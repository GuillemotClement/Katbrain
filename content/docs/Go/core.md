---
date: 2026-06-10T00:17:04+02:00
---
# Core

## Commentaire 

```go
// commentaire one line

/*
commentaire multiligne
*/
```

---

## `fmt`

Package qui permet de gérer les string 

```go 
import "fmt"

func main(){
    // affichage sans nouvelle ligne 
    fmt.Print("Hello")

    // affichage avec saut de ligne 
    fmt.Println("Mon age :", 28)
    fmt.Println("Ami" + "go") // Amigo

    // affichage avec espace réserver
    x := 10 
    fmt.Printf("x=%v type=%T\n", x, x) // x=10 type=int 
}
```

- `%v`: universel 
- `%T`: type 
- `%d`: int 
- `%f`: float 
- `%s`: string 
- `%q`: string avec `""` 
- `%c`: rune 
- `%b`: binaire 

---

## `Scan`: récupération de saisie 

### `fmt.Scan()`: récupération depuis `stdin`

```go 
import "fmt"

func main() {
    var a, b int // on prepare deux variables
    fmt.Scan(&a, &b) // on recupere la saisie

    // traitement des valeurs retourne
    var x int
    count, err := fmt.Scan(&x) // on recupere les valeurs retourner

    fmt.Println("count:", count) // par exemple : count: 1
    fmt.Println("err:", err)     // en cas de succes : err: <nil>
    fmt.Println("x:", x)         // si vous avez saisi 42, alors : x: 42

    // récupération et conversion 
    var idStr string
    fmt.Scan(&idStr)

    // parse: on essaie de convertir la chaine en int
    id, err := strconv.Atoi(idStr)
}
```

### `fmt.Fscan()`: récupération depuis une entrée explicite 

Prends en premier argument la source d'entrée.

```go 
import (
    "fmt"
    "os"
)

func main(){
    var a, b int
    fmt.Fscan(os.Stdin, &a, &b) // on passe explicitement la stdin

    fmt.Println(a * b)
}
```