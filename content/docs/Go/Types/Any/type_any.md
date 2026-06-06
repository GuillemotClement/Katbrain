---
date: 2026-06-06T13:08:53+02:00
weight: 1 
---
# Type_any

## Définition 

Le type `any` permet de stocker n'importe quel type de valeur. C'est l'équivalent d'une interface vide `interface{}`.

Lorsqu'une valeur prends un type `any`, son type réel ne disparaît pas, il est caché dans l'interface.
L'utilisation de `&T` permet de le voir.

Un type `any` ne peut pas être utilisé pour faire des opérations, il sera nécessaire de donner un type à la variable `any`.

## Raison 

## Modele mental 

```go
func main() {
	var x any // variable qui accepte n'importe quel type de donnée

    // la variable x peut changer de type 
	x = 42
	fmt.Printf("value=%v type=%T\n", x, x) // value=42 type=int

	x = "go"
	fmt.Printf("value=%v type=%T\n", x, x) // value=go type=string
}
```

## Quand l'utiliser ?

- stocker un ensemble de données différentes 
- reception de valeur de type inconnu

## Quand l'éviter ? 

## Pièges 

- Réduction de la lisibilité
- Contrat caché 
- Propagation 

## Bonne pratique 

## Pattern

### Journalisation et diagnostic 

```go 
func debug(name string, v any) {
    fmt.Println("[debug] %s=%v (type=%T)\n", name, v, v)
}

func main(){
    debug("id", 7) // [debug] id=7 (type=int)
}
```

### Conteneur universel 

```go 
func main() {
// creaton d'un map qui prend en valeur any 
// ctx commence a vivre dans la logique metier, et c'est le debut des problemes
	ctx := map[string]any{
		"op":   "create_task",
		"id":   10,
		"done": false,
	}
	fmt.Println(ctx["op"], ctx["id"], ctx["done"]) // create_task 10 false
}
```
