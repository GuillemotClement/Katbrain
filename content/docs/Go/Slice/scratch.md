## Découpage de slice 

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