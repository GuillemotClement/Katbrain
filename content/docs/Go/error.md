## Wrapping

Le **wrapping** permet d'ajouter du contexte à une erreur. On utilise `%w`, ce qui permet de créer une string, qui sera ensuite possible de venir découper pour retirer des "couches".

La méthode `Unwrap()` permet de retirer l'enrobage créer. Elle permet de retirer un niveau de couche.



## Raison 

Permet de gérer proprement des remonter d'erreurs.

## Modele mental 

## Quand l'utiliser ?

## Quand l'éviter ? 

## Pièges 

## Bonne pratique 

## Pattern 

### Enrobage 

```go
package main

import (
	"errors"
	"fmt"
)

func main() {
	base := errors.New("bad input")
	w1 := fmt.Errorf("parse: %w", base)
	w2 := fmt.Errorf("run: %w", w1)

	fmt.Println(w2)                // run: parse: bad input
	fmt.Println(errors.Unwrap(w2)) // parse: bad input => retire la première couche 
}
```