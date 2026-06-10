---
date: 2026-06-10T00:25:48+02:00
---
# Generics

Les générics permettent d'écrire des fonctions ou des types qui fonctionnent avec plusieurs types de données, sans avoir besoin de dupliquer du code ou d'utiliser des `interface{}` / `any`. 

Le `T` est remplacer par le type passer à la fonction lors de l'exécution.

## 27-0: Paramètre de type 

Un paramètre de type est un substitut pour un futur type concret. Au moment de la compilation, le compilateur remplace cet argument de type, puis viens vérifier que tout est correct.

C'est similaire à une variable, mais elle ne vit pas comme parmi les valeurs, mais parmis les types. La variable de type est connue au moment de la compilation.

Par exemple, on as deux fonctions : 
- `FirstInt([]int) (int, bool)` 
- `FirstString([]string)(string, bool)`

Les deux font la même chose: prennent le premier élément ou disent vide. Les gùnùrics permettent d'écrire une seul fonction `First` qui fonction pour `[]int`, pour `[]string` ou `[]Task`.

### Déclaration 

Une fonction generics prends des crochets juste après son nom. Ils permettent de passer une liste de paramètre de type.

`T` est un nom de type. Il existe pour que le compilateur comprenne le lien: "un `[]T` est arrivée en entrée, dans la sortie `T` sera du même type"

```go 
func First[T any](xs []T) (T, book) {
  ...
}
```

### Paramètre de types & paramètre de fonction 

- Paramètre de fonction: valeurs
- Paramètre de type: type 

```go
func Echo[T any](v T) T {
	return v
}

func main() {
	fmt.Println(Echo(10))      // 10
	fmt.Println(Echo("go"))    // go
}
```
- `v`: paramètre de fonction, il vit pendant l'éxécution
- `T`: paramètre de type, il vit pendant la compilation 

`Echo[T any]` signifie: `Echo` peut fonctionner avec n'importe quel type `T`, mais à l'intérieur de la fonction, je ne promets pas de pouvoir faire n'importe quoi avec `T`.
C'est la contrainte qui définit quelles opérations sont autorisées sur `T`.

### Utilisation 

Il existe deux modes d'utilisation des generics: 
- on définis explicitement l'argument de type 
- le compilateur déduit l'argument de type à partir des arguments ordinaire de la fonction 

```go 
func First[T any](xs []T) (T, bool) {
	if len(xs) == 0 {
		var zero T
		return zero, false
	}
	return xs[0], true
}

func main() {
	n, ok := First([]int{10, 20})
	fmt.Println(n, ok) // 10 true

	s, ok := First([]string{"go"})
	fmt.Println(s, ok) // go true
}
```

Le compilateur voit `[]int` et comprends que `T = int`. C'est l'inférence de type.

L'indication explicite est utile dans le cas ambigus, par exemple, lorsque le compilateur ne dispose pas de suffisament d'informations.

### Retourne "vide"

Il est parfois nécessaire de retourner une valeur par défaut lorsqu'il n'y a pas de données.

```go 
// la fonction prends un slice de T
// retourne une valeur T et boolean
// par exemple, on veux retourner le premier element du slice 
// si le slice est vide, on retourne la valeur nil => avec zero 
// sinon on retourne le premier élément
func First[T any](xs []T) (T, bool) {
	if len(xs) == 0 {
		var zero T
		return zero, false
	}
	return xs[0], true
}

func main() {
  // T est remplacer par le type passer à la fonction
	t, ok := First([]Task{{ID: 1, Title: "learn generics"}})
	fmt.Println(t.Title, ok) // learn generics true
}
```

---

## 27-1: Restriction any et comparable 

### `any`

Avec `any`, on permet de passer n'importe quel type. Il n'est pas possible de réaliser une opération dans la fonction.

Cette contrainte est idéale pour les fonctions qui n'effectuent pas d'opérations sur la valeur mais réalise du déplacement, retourne une valeur, la place dans une structure, etc 

```go
// utilisation de la contrainte any  
func Swap[T any](a, b T) (T, T) {
	return b, a
}

func main() { 
	x, y := Swap(10, 20)
	fmt.Println(x, y) // 20 10
}
```

### `comparable`

La restriction prédéfinie `comparable` permet de garantir que l'opération de comparaison est disponible.

```go
// utilisation de la constraint comparable
func Contains[T comparable](xs []T, v T) bool {
	for _, x := range xs {
		if x == v {
			return true
		}
	}
	return false
}

func main() {
	fmt.Println(Contains([]int{1, 2, 3}, 2))       // true
	fmt.Println(Contains([]string{"a", "b"}, "c")) // false
}
```

---


