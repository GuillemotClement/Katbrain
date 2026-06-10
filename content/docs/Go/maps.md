---
date: 2026-06-10T08:58:59+02:00
---
# Map

Un map est une structure de donnée qui stocke les valeurs sous forme de clé/valeur. 

```go
map[int]string // la cle est une string, et la valeur un int
```

## Déclaration 

```go
func main(){
  // make => le plus courante ==============================
  phones := make(map[string]string) // initialiser via le make

  phones["alice"] = "+1-202-555-0101" // ajout d'une valeur
  fmt.Println(phones["alice"]) // affichage

  // creation litteral =====================================
  phones := map[string]string{
    "alice": "+1-202-555-0101",
    "bob": "+1-202-555-0110",
  }

  fmt.Println(phones["bob"]) // +1-202-555-0110
}
```

## Lecture & Ecriture 

```go
func main(){
  phones := make(map[string]string)

  phones["alice"] = "111"
  phones["alice"] = "222" // reecriture

  if value, ok := phones["alice"]; !ok {
    return fmt.errors("not found")
  }
}
```

- `value`: contient la valeur si trouvé
- `ok`: boolean qui indique si la valeur est trouvé dans le map 

## Utilisation avec les fonctions 

Les maps sont passer par référence dans un fonction. Il sera modifier depuis la fonction.

```go 
// modifier la valeur dans le map
func setPhone(m map[string]string, name string, phone string){
  // protection contre un map vide 
  if m == nil {
    m = make(map[string]string)
  }

  m[name] = phone
}

func main(){
  phones := make(map[string]string)

  setPhone(phones, "bob", "333")
  fmt.Println(phones["bob"]) // 333
}
```

## `len()`: Afficher le nombres d'élément dans le map 

```go
func main(){
  phones := map[string]string{"alice" : "111", "bob": "222"}

  fmt.Println(len(phones)) // 2
  phones["carol"] = "333"
  fmt.Println(len(phones)) // 3
}
```

## `delete()`: supprimer une valeur 

Prends en premier argument le `map`, en second argument la clé à supprimer.

```go
func main(){
  phones := map[string]string{"alice" : "111", "bob": "222"}

  delete(phones, "bob")

  fmt.Println(len(phones))   // 1
    fmt.Println(phones["bob"]) // "" (la cle n'existe pas, zero value renvoyee)
}
```

## `nil` map 

La lecture est possible et retourne la zero value.

L'écriture provoque une `panic`.

```go
func main(){
  var phones map[string]string // nil-map

  fmt.Prinln(phones == nil) // true
  fmt.Println(len(phones)) // 0
  fmt.Println(phones["x"]) // "" -> zero value

  phones["x"] = "123" // panic => map non initialiser
}
```

## `range`: parcourir un map 

L'ordre des valeurs dans le map, n'est pas garantis.

```go 
func main(){
  ages := map[string]int{"alice:": 30, "bob": 25}

  for key, value := range ages {
    ages[key] = value + 1 // modification de la valeurs
  }
}
```

### Triage stable 

```go
import (
	"cmp"
	"fmt"
	"maps"
	"slices"
)

type Task struct {
	Title string
}

func main() {
	byID := map[int]Task{2: {"Learn Go"}, 1: {"Buy milk"}}

	ids := maps.Keys(byID) // retourne un slice des key du map 
	slices.SortFunc(ids, cmp.Compare[int]) // triage des ids 

  // on parcours la liste pour afficher les valeurs du map dans l'ordre des id
	for _, id := range ids {
		fmt.Println(id, byID[id].Title)
		// 1 Buy milk
		// 2 Learn Go
	}
}
```






## Package `maps`

Fournis des méthodes permettant d'effectuer des manipulation de bases sur des maps.

L'utilisation des méthode du package ne garantit pas l'ordre d'itération.

### `maps.Clone()`: cloner un map 

Permet de créer un clone pour réaliser des opération sans modifier le map original. Clone un map c'est faire une copie des clé/valeur, et pas faire une copie profonde des structures imbriqués.

```go 
import (
	"fmt"
	"maps"
)

func main() {
	byID := map[int]string{1: "Buy milk", 2: "Learn Go"}
	snapshot := maps.Clone(byID)

	snapshot[1] = "Hacked"
	fmt.Println(byID[1])     // Buy milk
	fmt.Println(snapshot[1]) // Hacked
}
```

### `maps.Copy()`: tranfert de donnée dans un map 

Lorsque l'on souhaite compléter un map existant.

```go 
import (
	"fmt"
	"maps"
)

func main() {
	dst := map[int]string{1: "A"}
	src := map[int]string{2: "B", 3: "C"}

	maps.Copy(dst, src)
	fmt.Println(dst) // map[1:A 2:B 3:C]
}
```

### `maps.Equal`: comparaison de maps 

Si les valeurs sont comparables

```go 
import (
	"fmt"
	"maps"
)

func main() {
	a := map[string]int{"x": 1, "y": 2}
	b := map[string]int{"y": 2, "x": 1}

	fmt.Println(maps.Equal(a, b)) // true
}
```