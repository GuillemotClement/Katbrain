## 26-0: io.Reader & io.Writter

La lecture/ecriture (IO) dans les programme fonctionne comme un flux (stream): les données arrivent par paquets, leurs taille est connue à l'avance, et la vitese dépend du monde extérieur.
La logique doit dépendre de `Reader` et `Writer`, ce pas ce qu'il y a à l'intérieur (fichier, réseau, mémoire, stdin/stdout).

`IO` correspond au transferts d'octets: string -> buffer, buffer -> stdout, buffer -> buffer, `Reader` -> `Writer`. Et on vient écrire à chaque fois une boucle `for`.


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

### `io.Writer` - écriture 

`io.Writter` est une interface qui décrit un récepteur d'octets: on peut y écrire des données. 

Lorsque'une fonction prends ce type en argument, on peut diriger sa sortie.



L'interface contient une méthode: 

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

---

## 26-1: bytes.Buffer & strings.Builder 

Dans le code, on sépare les fonctions qui calcule et produise du texte et celle qui decider ou envoie du texte. 

Le role de `io.Writer` est de venir écrire du contenu, sans avoir à connaitre l'endroit où écrire.

```go 
import (
	"fmt"
	"io"
	"os"
)

// fonction responsable de l'écriture 
func WriteHello(w io.Writer) {
	fmt.Fprintln(w, "hello") // write where we were told to write
}

func main() {
    // on décide où écrire le texte 
	WriteHello(os.Stdout) // this is the console for now
}
```

### `bytes.Buffer` - lecture & écriture d'octets

Permet de travailler avec des octets en mémoire. Il sait accumuler des choses: on écrit des morceaux, il garde tout collé ensemble. Il sait aussi lire ces octets accumulés comme un flux. Il ressemble à `io.Writter` et `io.Reader`.

La zero value de `bytes.Buffer` est prête à l'emploi. On n'as pas besoin d'utiliser `make` ou `new`. 

A utiliser lorsque l'on veux travailler avec des octets, et qu'il faut écrire et lire.

```go 
import (
	"bytes"
	"fmt"
)

func main() {
	// on créer la variable bytes.Buffer 
    var buf bytes.Buffer
    
    // on assemble la string 
	buf.WriteString("go")
	buf.WriteByte('!')

    // on affiche le résultat final
	fmt.Println(buf.String()) // go!
}
```

Si on vient lire depuis un `bytes.Buffer`, il consomme les données. Ce comportement ressemble à une file: lu = parti 

```go 
import (
	"bytes"
	"fmt"
)

func main() { 
    // creation du buffer bytes.Buffer 
	var buf bytes.Buffer
    // on commence a ecrire une nouvelle string 
	buf.WriteString("abcdef")

	tmp := make([]byte, 2)

	// lecture de la chaîne en construction 
	n, _ := buf.Read(tmp)
	fmt.Printf("%q\n", tmp[:n]) // "ab"

	fmt.Println(buf.String()) // cdef
}
```

---

### `strings.Builder` - construction de chaîne 

`strings.Buffer` permet de construire des chaînes. Il conserve le buffer interne, et l'agrandit au fur et à mesure. Pour l'utilise, on le passe via pointeur `&b`.

`string.Builder` n'aime pas être copier une fois que l'on commence à l'utiliser. Une fois créer, on l'utilise à un endroit, et on le passe comme pointeur, sans faire de copie par affectation.

A utiliser lorsque l'on veux produire du texte lisible par l'humaine.

```go 
import (
	"fmt"
	"strings"
)

func main() {
	// création du buffer 
	var b strings.Builder

	// construction du chaîne 
	b.WriteString("hello")
	b.WriteString(" ")
	b.WriteString("go")
	
	fmt.Println(b.String()) // hello go

	// utilisation avec pointeur 
	var b2 strings.Builder 

	fmt.Fprintln(&b2, "line 1")
	fmt.Fprintln(&b2, "line 2")

	fmt.Print(b.String())
}
```

---

### `fmt.Fprint*` 

La famille des `fmt.Fprint*` permetttent de définir un `io.Writer` comme premier paramètre pour définir où sera écrite la string de sortie.

En premier argument, on passe la sortie, puis on passe la string


```go 
import (
	"fmt"
	"os"
	"bytes"
)

func main() {
	// sortie dans la console
	fmt.Fprintln(os.Stdout, "hello") // hello

	// sortie dans un buffer 
	var buf bytes.Buffer // création du buffer 
	fmt.Fprintln(&buf, "hello") // on passe le pointeur du buffer en premiere argument => la string sera écrire dans celui ci 
	fmt.Println(buf.String()) // hello 
}
```

---

### Exemple: gestion de sortie 

Chaque fonction à sa propre responsabilité: `FormatTask()` pour le formatage, `WriteTasks()` permet de définir la sortie.

```go 
package main

import (
	"fmt"
	"io"
	"os"
	"strings"
)

type Task struct {
	ID    int
	Title string
	Done  bool
}

// la fonction imprime la Task 
func WriteTask(w io.Writer, t Task) error {
	status := "TODO"

	if t.Done {
		status = "DONE"
	}

	// la sortie sera sur la valeur de l'argument w qui contient l'indication
	_, err := fmt.Fprintf(w, "#%d [%s] %s\n", t.ID, status, t.Title)

	return err
}

// la fonction permet d'afficher la listes 
func WriteTasks(w io.Writer, tasks []Task) error {
	for _, t := range tasks {
		// on appelle la fonction responsable de l'affichage pour chacune des tasks
		if err := WriteTask(w, t); err != nil {
			return err
		}
	}

	return nil
}

// la fonction retourne une string formater 
func FormatTasks(tasks []Task) (string, error) {
	// on utilise Builder pour la construction de string 
	var b strings.Builder

	// WriteTasks permet de formater la task
	if err := WriteTasks(&b, tasks); err != nil {
		return "", err
	}

	// on retourne la task formatée
	return b.String(), nil
}

// assemblage 
func main() {
	// initialisation du slice de Task 
	tasks := []Task{
		{ID: 1, Title: "learn io.Writer", Done: true},
		{ID: 2, Title: "stop printing everywhere", Done: false},
	}

	// on affiche dans la console avec os.Stdout 
	err = WriteTasks(os.Stdout, tasks)
	// ...
	// #1 [DONE] learn io.Writer
	// #2 [TODO] stop printing everywhere

	// =============================================
	tasks := []Task{{ID: 1, Title: "write report", Done: false}}

	// on viens formater la task
	s, err := FormatTasks(tasks)
	fmt.Println(err) // <nil>
	fmt.Print(s)     // #1 [TODO] write report
}
```

--- 

### Vérification de sortie 

Les buffer permettent de rediriger la sortier vers `bytes.Buffer`, puis comparer la chaine avec celle attendue.

```go
import (
	"bytes"
	"fmt"
	"testing"
)

func main() {
	// création du buffer 
	var buf bytes.Buffer
	// ajout d'une nouvelle task dans le buffer 
	_ = WriteTask(&buf, Task{ID: 7, Title: "check output", Done: true})

	// récupération des résultats
	got := buf.String()
	want := "#7 [DONE] check output\n"

	// check 
	fmt.Println(got == want) // true
}

// fonction de test simple 
func TestWriteTask(t *testing.T) {
	var buf bytes.Buffer
	_ = WriteTask(&buf, Task{ID: 1, Title: "t", Done: false})

	if buf.String() != "#1 [TODO] t\n" {
		t.Fatalf("unexpected output: %q", buf.String())
	}
}
```

---

## 26-2: Décorateur de flux: `io.LimitReader`, `io.TeeReader`, `io.MultiWriter`

Dans le domaine du I/O, le décorateur est une enveloppe qui prends un flux (stream), et on construit un mini-pipeline de traitement.

On utilise `io.Reader` et `io.Writer` prédéfinie, on l'enveloppe dans un autre objet qui ajoute du comportement sans changer le code princiapl.

`io.Reader` est un tuyau dans lequel on viens puiser des données. `io.Writer` est un tuyau dans lequel on verse les données. Les décorateurs sont les embouts: un limitateur de flux, un raccord en T, un répartiteur qui envoie tout de suite vers deux endroits.

### `io.LimitReader`: limitation d'octets 

Lorsque l'on vient lire des données depuis un flux, on ne fait pas confiance à la source. Parfois la source est bonne, et on souhaite obtenir un extrait (preview) et lire seulement les premiers octets. Parfois la source est suspecte (saisie utilisateur, fichier, réseau), et on souhaite se protéger de la situation "je vais envoyer 10Go, et tu viens lire". 

`io.LimitReader` est le moyen standard de limiter la lecture des données. 

Fournis une méthode `LimitReader(r Reader, n int64) Reader`. La fonction ne lit pas lui même, il retourne un nouveau `Reader` qui se comporte comme si le flux de départ contenait exactement `n` octets. Lorsque la limite est atteinte, on obtient ensuite `io.EOF`, même s'il reste des données dans le flux d'origine.

Par exemple, on limite la lecture au 5 premiers octets:

```go
import (
	"bytes"
	"fmt"
	"io"
)

func main() {
	src := bytes.NewBufferString("abcdefg")
	// on créer la limite
	r := io.LimitReader(src, 5)

	buf := make([]byte, 8)
	n, err := r.Read(buf)

	fmt.Printf("n=%d data=%q err=%v\n", n, buf[:n], err) // n=5 data="abcde" err=<nil>
}
```

### `io.TeeReader`: lire et copier en parallèle

Retourne un `Reader` qui à chaque lecture, copie les octets lus dans `Writer`. 

Il permet de prendre la lecture depuis un flux, et de laisser une trace, par exemple dans les logs, dans un buffer de debug ou une sortie supplémentaire.

```go
func TeeReader(r Reader, w Writer) Reader
```

La méthode reçoit les octets depuis lr `r Reader`, et viens les écrire avec `w Writer`.
Si l'écriture échoue, l'erreur se manifeste comme une erreur de lecture.

```go 
import (
	"bytes"
	"fmt"
	"io"
	"strings"
)

func main() {
	// création d'une string 
	src := strings.NewReader("go-go-go")
	// création du buffer 
	var debugCopy bytes.Buffer

	// lecture du flux + écriture dans le buffer 
	r := io.TeeReader(src, &debugCopy)

	buf := make([]byte, 2)
	n, _ := r.Read(buf)
	fmt.Printf("chunk=%q\n", buf[:n]) // chunk="go"

	fmt.Printf("debug=%q\n", debugCopy.String()) // debug="go"
}
```

En pratique, `TeeReader` est utilisé comme outil d'écoute lors du traitement de donnée. Par exemple, on analyse le flux entrant, et on souhaite conserver les N premier octets afin d'afficher un message clair, ou d'enregistrer des informatins de diagnostics en cas d'erreur.

---

### `io.MultiWriter`: écrire à plusieurs endroits 

`io.MultiWriter` est utilisé pour écrire tout de suite dans plusieurs destination. Par exemple, écrire simultanément dans la console et dans un buffer (pour les tests, la sauvegarde ou un traitement extérieur).

```go 
func MultiWriter(writers ...Writer) Writer 
```

La fonction retourne un nouveau `Writer`, qui pour chaque `Write(p)` appelle `Write(p)` sur chaque writer interne.

Si une writer a eu le temps d'écrire et qu'un autre échoue, il est possible d'annuler l'écriture du premier.

```go
import (
	"bytes"
	"fmt"
	"io"
)

func main() {
	// déclaration de deux buffers 
	var a bytes.Buffer
	var b bytes.Buffer

	// on viens écrire dans les deux buffer
	w := io.MultiWriter(&a, &b)

	// on ecrit dans les deux en même temps.
	_, _ = w.Write([]byte("Hi"))

	fmt.Println(a.String(), b.String()) // Hi Hi
}
```

---

### Pipeline: combinaison des décorateurs 

Il est possible de combiner chacun des décorateurs. L'ordre des wrapper change le sens: si on limite le flux, seule la partie limitée iras dans la copie par exemple

### Exemple

On as une application Todo. On viens mettre en place une génération de rapport, gérer son envoie, et brancher les décorateurs.

```go 
package main

import (
	"fmt"
	"io"
	"bytes"
	"os"
)

type Task struct {
	ID    int
	Title string
	Done  bool
}

// fonction d'écriture de ligne 
func writeTaskLine(w io.Writer, t Task) error {
	_, err := fmt.Fprintf(w, "%d\t%v\t%s\n", t.ID, t.Done, t.Title)
	return err
}

// écriture des task dans un flux 
func writeTasks(w io.Writer, tasks []Task) error {
	for _, t := range tasks {
		if err := writeTaskLine(w, t); err != nil {
			return err
		}
	}
	return nil
}

func main() {
	tasks := []Task{
		{ID: 1, Title: "read about io.Reader", Done: true},
		{ID: 2, Title: "don't forget to check err", Done: false},
	}

	// écriture simultané dans la console et un buffer
	var copyBuf bytes.Buffer
	w := io.MultiWriter(os.Stdout, &copyBuf)

	_ = writeTasks(w, tasks)

	// =====================================================
	// limitation des octets du rapport 
		var report bytes.Buffer
	_ = writeTasks(&report, []Task{{ID: 1, Title: "big report", Done: false}})

	// ajout de la limitation 
	r := io.LimitReader(&report, 10)
	buf := make([]byte, 64)

	n, err := r.Read(buf)
	fmt.Printf("preview=%q err=%v\n", buf[:n], err)

	// =====================================================
	// lecture apercus et conserver ce qui a ete afficher 
	src := strings.NewReader("task report line 1\ntask report line 2\n")
	var shown bytes.Buffer

	r := io.TeeReader(io.LimitReader(src, 12), &shown)

	buf := make([]byte, 16)
	n, _ := r.Read(buf)

	fmt.Printf("shownNow=%q\n", buf[:n])           // shownNow="task report "
	fmt.Printf("storedCopy=%q\n", shown.String()) // storedCopy="task report "
}
```

---

## `io.Copy` & `io.CopyN` 

### `io.Copy()`: copie 

Cette méthode permet de faire une copie.

Elle vient lire dans un buffer, écrit par portion, et recommance jusqu'à la fin ou jusqu'a une erreur. Il choisit le buffer lui même, on permet de ce concentrer sur la logique du programme plutôt qu'implémenter manuelle la copie.

```go 
written, err := io.Copy(dst, src)
```

- `dst`: un `io.Writter` -> où l'on vient écrire 
- `srd`: un `io.Reader` -> on l'on dit 
- `written` indique combien d'octets ont été écrit dans `dst`. Le type `int64` permet de gérer les flux volumineux.

- `err == nil` : copiée jusqu'a la fin du flux 
- `err != nil` : erreur lors de la copie. `written` peut être `0` ou `>0`.

```go 
import (
	"bytes"
	"fmt"
	"io"
	"strings"
)

func main() {
	// création de la source => une string 
	src := strings.NewReader("hello, stream")
	// création de la dst => un buffer 
	var dst bytes.Buffer

	// on fait la copie de la source vers la destination 
	n, err := io.Copy(&dst, src)
	fmt.Printf("n=%d err=%v dst=%q\n", n, err, dst.String())
	// n=13 err=<nil> dst="hello, stream"
}
```

#### Progression partiel

`err != nil` n'indique pas forcément une erreur total. Le flux à pu transmettre une partie des données, puis échouer, un `Writer` a pu accepter une partie des données, puis refuser la suite ...

Une opération peut renvoyer une partie du résultat + une erreur. L'important est que l'erreur n'annule pas ce qui a été fait avant elle.

---

### `io.CopyN()`: copier exactement N octets 

Cette méthode permet de faire la copie d'un nombre définis d'octet. Pas plus, pas moins.

```go
written, err := io.CopyN(dst, src, n)
```

- `written`: le nombre d'octet copier 
- `err` : si erreur pendant l'exécution 
- `dst`: destination  
- `src`: source 
- `n`: nombre d'octets à copier

```go 
import (
	"bytes"
	"fmt"
	"io"
	"strings"
)

func main() {
	src := strings.NewReader("hey")
	var dst bytes.Buffer

	written, err := io.CopyN(&dst, src, 10) // on copie 10 octets dans la destination 
	fmt.Printf("written=%d err=%v dst=%q\n", written, err, dst.String())
	// written=3 err=EOF dst="hey"
}
```

### Gestion d'erreur

On retourne nombre d'octets copier et le message d'erreur pour obtenir un message precis.

```go 
import (
	"fmt"
	"io"
)

func copyWithContext(dst io.Writer, src io.Reader, op string) (int64, error) {
	n, err := io.Copy(dst, src)
	if err != nil {
		return n, fmt.Errorf("%s: %w", op, err) // ajout du contexte 
	}
	return n, nil
}

func main() {}
```