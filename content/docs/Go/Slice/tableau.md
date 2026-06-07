---
date: 2026-06-06T23:30:18+02:00
---
# Tableau

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


## Définition 

## Raison 

## Modele mental 

## Quand l'utiliser ?

## Quand l'éviter ? 

## Pièges 

## Bonne pratique 

## Pattern 
