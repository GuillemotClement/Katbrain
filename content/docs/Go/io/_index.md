## 26-0: io.Reader & io.Writter

La lecture/ecriture (IO) dans les programme fonctionne comme un flux (stream): les données arrivent par paquets, leurs taille est connue à l'avance, et la vitese dépend du monde extérieur.
La logique doit dépendre de `Reader` et `Writer`, ce pas ce qu'il y a à l'intérieur (fichier, réseau, mémoire, stdin/stdout).

```mermaid
flowchart LR
    R["Source de donnees - Reader"]
    C["Logique de taitement"]
    W["Recepteur de donnees - Writer"]

    R -->|Read(p)| C
    C -->|Write(p)| W
```

### `io.Reader` - lecture 

`io.Reader` est une interface de la lib standard qui décrit une source d'octets. Elle posséde une méthode `Read`: 

```go 
Read(p []byte) (n int, err error)
```

Elle prends un buffer `p`, et le reader essaie de le remplir avec des donnéees. La méthode retourne le nombre d'octets réellement écrit dans le buffer `p` et une `err`.

Aprés `Read`, on ne peut utiliser que `p[:n]`.

```go 
import (
	"fmt"
	"io"
	"strings"
)

func main() {
    // reader en mémoire
	r := strings.NewReader("hello-go")
	// création du buffer 
    buf := make([]byte, 3)

	for {
        // lecture, on passe le buffer qui viens recupérer les octets 
		n, err := r.Read(buf)
        
        // vérifie si des octects ont été écrit 
		if n > 0 {
			fmt.Printf("chunk=%q\n", buf[:n]) // chunk="hel" ...
		}
        
		if err == io.EOF {
			break
		}
		if err != nil {
			fmt.Println("read error:", err)
			return
		}
	}
}
```

### `io.Writter` - écriture 

`io.Writter` est une interface qui décrit un récepteur d'octets: on peut y écrire des données. L'interface contient une méthode: 

```go 
Write(p []byte) (n int, err error)
```

On passe à la méthode les données dans `p`. Elle retourne le nombre d'octets reçus `n` et `err`.

`Write` à le droit de n'écrire qu'une partie: liaison surchargée, buffer plein, récepteur lent. L'architecture se fait dans une boucle de type: écrire le reste. 

La lib standard Go construit son I/O autour de petites interfaces. Par exemple, le bufferiseur `bufio.Writer` implémente `io.Writter` et soutient l'idée "on accumule d'abord les éecriture, puis on vùrifie l'erreur au moment de `Flush`, car c'est plus confortable de gérer les erreurs de sortie de cette manière".

### Lecture de `n`, `err` et `io.EOF`

#### `io.EOF`

`io.EOF` indique que les données sont terminées. C'est une manière normal de terminer correctement la lecture. Dans la plupart des boucles de lecture `EOF` est une condition de `break` ou de `return nil`.

#### Combinaison `n/err` pouur `Read`

| `n` |  `err` | signifie | réaction | 
| --- | ------ | -------- | -------- |
| `>0` | `nil` | lecture terminée | traiter `p[:n]`, continuer | 
| 0 | `io.EOF` | flux terminé | terminer la lecture | 
| >0 | `io.EOF` | on as lu le dernier morceau et la fin est arrivée tout de suite | traiter `[:n]`, puis terminer | 
| >0 | autre erreur | des données ont été lues, mais il y a ensuite un problème | traiter `[:n]`, puis retourner/journaliser l'erreur | 
| 0 | autre erreur | rien n'a été lu, erreur immédiate | retourner/logger |

Le cas `n>0` et `err != nil` est une partie automatiser du contrat. Dans la lib standard, on rencontre des implémentations où l'on fournit d'abord une portion utile de données, puis on signale une erreur ou la fin du flux.

### Ecriture partielle dans `Write` 

Pour `Write`, la situation est semblabe: `n` peut être inférieur à `len(p)`, et cela signifie que seule une partie à été écrite. Si on doit garantir que tout soit écrit, on fait une boucle `write-all`: 

```go 
import "io"

// prends le writter + le slice de bytes (les données)
func writeAll(w io.Writer, p []byte) error {
    // tant que le nombre d'octect est supérieur a 0, on continuer d'écrire.
	for len(p) > 0 {
		n, err := w.Write(p)
        // permet de sortir de la boucle 
		if err != nil {
			return err
		}
        // on ajoute dans le slice 
		p = p[n:]
	}
	return nil
}
```

### Testabilité

Reader et Writer permettre de mettre en place des tests basique du code. 

Si une fonction prend un `io.Reader`, on peut lui fournir un fichier, une chaine en memoire. Si une fonction ecrit dans un `io.Writer`, on peut diriger la sortie vers la console ou vers un buffer en mémoire, puis comparer le résultat.

```go 
import (
	"fmt"
	"io"
)

func PrintHello(w io.Writer) {
	fmt.Fprintln(w, "hello")
}
```

### Exemple: TaskBook 

La liste des taches peut etre affichee dans n'importe quel `io.Writter`, et chargee depuis n'importe quel `io.Reader`. On gere juste un flux et un contrat.

La logique du code ne dépend pas de l'element avec lequel il intéragit, il est juste responsable de l'ecriture et la lecture.

```go 
package main

import (
    "fmt"
    "io"
    "bytes"
    "fmt"
    "strings"
)

// définition du modèle de données
type Task struct {
	ID    int
	Title string
	Done  bool
}

// écriture des taches 
// exemple de ligne: buy_milk false 
// la fonction prends un writter et écris les tasks.
// elle n'affiche rien elle meme
func WriteTasks(w io.Writer, tasks []Task) error {
	for _, t := range tasks {
		_, err := fmt.Fprintf(w, "%d %s %t\n", t.ID, t.Title, t.Done)
		if err != nil {
			return err
		}
	}
	return nil
}

// lecture des taches 
// on utilise fmt.Fscan qui permet de lire depuis n'importe quel io.Reader 
func ReadTasks(r io.Reader) ([]Task, error) {
	var tasks []Task

	for {
		var t Task
        // récupère la saisie utilisateur 
		_, err := fmt.Fscan(r, &t.ID, &t.Title, &t.Done)
        // lorsque la saisie est terminer, on returne la nouvelle task 
		if err == io.EOF {
			return tasks, nil
		}
		if err != nil {
			return nil, err
		}
        // ajoute dans le slice 
		tasks = append(tasks, t)
	}
}

// assemblage 
func main() {
	input := "1 buy_milk false\n2 learn_go true\n"
	r := strings.NewReader(input) // création du reader 

	tasks, err := ReadTasks(r) // creation de la task 
	if err != nil {
		fmt.Println("read error:", err)
		return
	}

    // lecture depuis le buffer 
	var out bytes.Buffer
	if err := WriteTasks(&out, tasks); err != nil {
		fmt.Println("write error:", err)
		return
	}

	fmt.Print(out.String())
	// 1 buy_milk false
	// 2 learn_go true
}
```
