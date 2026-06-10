## Tableau

Permet de stocker des valeurs. Il possède une taille fixe, et toutes les valeurs contenue doivent être du même type.

Les valeurs sont stockées par index.

La taille du tableau fait partie de son type.

```go 
//déclaration d'un nouveau tableau 
func main(){
  week := [3]int{10, 20, 30} // creation et initialisation du tableau
  week[1] = 99 // on set une valeur au deuxieme emplacement

  fmt.Println(// [10, 99, 30])
}
```

### Copie de tableau 

Les tableaux sont copiées par valeur et la copie est indépendantes.

```go 
func main(){
  a := [3]int{1, 2, 3}
  b := a
  b[0] = 99

  fmt.Println("a: ", a) // a: [1, 2, 3]
  fmt.Println("b: ", b) // b: [99, 2, 3]
}
```

---

## Slice 












### Découpage de slice 

Le découpage de slice permet de récupérer une parties des éléments du slice. En cas d'overflow, on obtient une panic.

- `[:n]`: 0 -> n non inclut 
- `[n:]`: n -> à la fin du slice 
- `[:]`: créer une copie de slice 

```go 
func main(){
  // déclaration du slice
  s := []int{10, 20, 30, 40, 50}

  // deuxième au quatrième éléments 
  s[1:4] // [20 30 40]

  // premier au deuxieme
  fmt.Println(s[:2]) // [10 20]

  // du quatrième au dernier 
  fmt.Println(s[3:]) // [40 50]

  // copie complète 
  fmt.Println(s[:]) // [10 20 30 40 50]
}
```

---

### `s[a:b:c]`: limitation de la cap

`[a:b:c]`. Le dernier élément permet de définir une limite haute de la `cap`.

- `a`: début de fenetre 
- `b`: où finis la longueur (`len`)
- `c`: où finis la capacité


On peut venir utiliser ce pattern pour limiter `caq` afin que l'utilisation d'un `append` soit obligé d'utiliser un nouveau backing array, et ne vienne pas modifier le backing array.

La limitation obliger `append` à venir créer un nouveau backing array afin d'y ajouter la nouvelle valeur. On interdit de faire grandir par la droite.

La limitation ne rends pas les données indépendante, elle permet uniquement de protéger le backing array du slice initial (`tasks` dans l'exemple). Le backing array reste commun au deux slices.

```go 
func main() {
	tasks := []string{"learn", "water", "sleep", "repeat"}

  // on prends les deux premiers élément du slice tasks
  // on ajoute ensuite une limite 
	first := tasks[:2:2] // cap limitee
	first = append(first, "tip")

	fmt.Println(tasks) // [learn water sleep repeat]
	fmt.Println(first) // [learn water tip]
}
```

--- 

### Package `slices` 

Contient un ensemble de méthodes pour réaliser les opérations les plus fréquentes sur les slices.

#### `slices.Clone`: copie 

Permet de créer une copie d'un slice, sans modification du slice d'origine. La méthode permet également de conserver le type des slices.

```go 
import (
	"fmt"
	"slices"
)

func main() {
	tasks := []int{3, 1, 2}
	cp := slices.Clone(tasks)

	cp[0] = 999
	fmt.Println(tasks) // [3 1 2]
	fmt.Println(cp)    // [999 1 2]
}
```

#### `slices.Sort` & `slices.SortFunc`: triage 

Les méthodes permettent de trier l'ordre des éléments du slice existant et ne retourne rien.

```go 
import (
	"fmt"
	"slices"
)

type Task struct {
	ID    int
	Title string
}

func main() {
	tasks := []Task{{ID: 2, Title: "B"}, {ID: 1, Title: "A"}}

  // triage des Task par id 
	slices.SortFunc(tasks, func(a, b Task) int {
		if a.ID < b.ID {
			return -1
		}
		if a.ID > b.ID {
			return 1
		}
		return 0
	})

	fmt.Println(tasks) // [{1 A} {2 B}]
}
```

#### `slices.Delete`: supprimer une plage de valeurs

Permet de supprimer une plage. La borne de droite est exclus.

La méthode retourne un nouveau slice.

```go 
import (
	"fmt"
	"slices"
)

func main() {
	ids := []int{10, 20, 30, 40}
	ids = slices.Delete(ids, 1, 3) // supprime 20 et 30
	fmt.Println(ids)               // [10 40]
}
```

### Package `cmp`

Le package fournis des méthodes permettant de simplifier le trie poour les types ordonnables.

```go 
import (
	"cmp"
	"fmt"
	"slices"
)

func main() {
	nums := []int{3, 1, 2}
	slices.SortFunc(nums, cmp.Compare[int])

	fmt.Println(nums) // [1 2 3]
}
```

On peut simplifier le code pour un trige sur les priorités de tâches 

```go
import (
	"cmp"
	"fmt"
	"slices"
)

type Task struct {
	Title    string
	Priority int
}

func main() {
	tasks := []Task{{"B", 2}, {"A", 2}, {"C", 1}}

	slices.SortFunc(tasks, func(a, b Task) int {
		if p := cmp.Compare(a.Priority, b.Priority); p != 0 {
			return p
		}
		return cmp.Compare(a.Title, b.Title)
	})

	fmt.Println(tasks) // [{C 1} {A 2} {B 2}]
}
```