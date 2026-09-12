# Tableau 

Un tableau est un objet spécial qui peut stocker plusieurs valeurs. Un tableau une une "boîte" divisée en section. Chqaue section du tableau a son numéro qui commence à zéro.

## Création d'un tableau 

La taille du conteneur du tableau ne peut pas être modifiée après sa création.

```java
// =====================================
// création d'un tableau de 100 entier
// =====================================
int[] myArray = new int[100];

// =====================================
// création d'un tableau de 20 double 
// =====================================
double[] myTableau = new double[20];
```

## Manipulation du tableau 

Pour manipuler les cellules du tableau, on viens indiquer son index. La numérotation commence toujours à zéro.

```java 
int[] a = new int[10];	// Nous créons un tableau de 10 éléments de type int.

a[2] = 4;				// Nous écrivons la valeur 4 dans la cellule d’indice 2.

a[7] = 9;				// Nous écrivons la valeur 9 dans la cellule d’indice 7.

a[9] = a[2] + a[5];		// Nous écrivons dans la cellule d’indice 9 la somme des valeurs stockées dans les cellules 2
                        // (4) et 5 (0).
```


