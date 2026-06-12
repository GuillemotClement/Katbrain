---
date: 2026-06-11T16:53:50+02:00
---

# Tableau

Un tableau permet de stocker un ensemble de valeurs. Les éléments sont stocker par index, et débute à zéro.

La taille du tableau est définis à la déclaration, et ne peut plus être modifé après sa création.

Toutes les valeurs contenu dans le tableau sont du même type.

La valeur initial des valeur du tableau est `0` ou `null`, ou `false`.

La variable stocke la référence du table dans un espace mémoire, et la reférence contient l'adresse mémoire des éléments du tableau dans la mémoire.

## Déclaration du tableau

```java
// syntaxe
type[] name = new type[count];

// syntaxe longue 
type[] = name;
name = new type[count];


// tableau de 100 cellule de type int
int[] array = new int[100];

// tableau de 20 float
double[] vals = new double[20];
```

- `type[]`: le type des éléments du tableau 
- `new`: création du tableau
- `type[count]`: le nombre de cellule du tableau

## Accès aux valeurs

On utilise la notation crochet pour accéder aux éléments.

```java
// Nous créons un tableau de 10 éléments de type int.
int[] a = new int[10];

// Nous écrivons la valeur 4 dans la cellule d’indice 2.
a[2] = 4;

// Nous écrivons la valeur 9 dans la cellule d’indice 7.
a[7] = 9;

// Nous écrivons dans la cellule d’indice 9 la somme des valeurs stockées dans les cellules 2
a[9] = a[2] + a[5];
// (4) et 5 (0).
```

Des variables et des expression peuvent servir d'indice de tableau, et le nombre d'éléments du tableau 

```java
int n = 100;
int[] a = new int[n];			// 	Création d’un tableau de n éléments

int n = 100;
int[] a = new int[n * 2 + 3];	// 	Création d’un tableau de 203 éléments

int n = 100;
int[] a = new int[n];
a[n-1] = 2;					// a[99] = 2;
a[n-2] = 3;					// a[98] = 3;
a[n/5] = a[n-1] + a[n-2]	// a[20] = a[99] + a[98];
```

## Tableaux en mémoire

Lors de la création du tableau, deux emplacements mémoire sont crées. Le premier vient stocker le tableau lui même, et l'autre la variable qui stocke son adresse mémoire.

Il est possible de stocker des variables de type tableau dans un tableau.

```java
// stockage d'un tableau dans un tableau
int[] a = new int[10];		// Nous créons un tableau de 10 éléments de type int.

a[2] = 4;					// Nous écrivons la valeur 4 dans la cellule d’indice 2.
a[7] = 9;					// Nous écrivons la valeur 9 dans la cellule d’indice 7.

int[] b = a;				// Nous mettons dans la variable b l’adresse présente dans la variable a.
// Désormais, a et b pointent vers le même objet‑tableau en mémoire.
                            
// Nous écrivons dans la cellule d’indice 9 de l’objet‑tableau la somme des valeurs
a[9] = b[2] + a[7];			
// stockées dans les cellules 2 (4) et 7 (9).
```

L'objet tableau reste à l'endroit où il se trouve, et les variables `a` et `b` stockent la même adresse vers un seul et même objet.

---

## Dépassement des limites du tableau 

En cas de tentative d'accés sur un index qui n'existe pas dans le tableau provoque une erreur `ArrayIndexOutOfBoundsException`.

---

## Longueur de tableau 

On peut créer une variable de type tableau, et ensuite dans le code, lui affecter une référence.

```java 
int[] array;			//	Nous créons une variable‑tableau de type int[]
if (a < 10)				// Si la variable a est inférieure à 10,
   array = new int[10];	// alors créer un tableau de 10 éléments.
else					// Sinon
   array = new int[20];	// créer un tableau de 20 éléments
```

### `array.length`: retourne la longueur du tableau 

Permet d'obtenir la longueur du tableau. On peut affecter la propriété sur d'autre variables, mais on ne peut pas venir modifier cette propriété

```java
int[] array;			//	Nous créons une variable‑tableau de type int[]
if (a < 10)				// Si la variable a est inférieure à 10,
   array = new int[10];	// alors créer un tableau de 10 éléments.
else					// Sinon
   array = new int[20];	// créer un tableau de 20 éléments

for (int i = 0; i < array.length; i++)	// Boucle sur tous les éléments du tableau : de 0 à array.length — 1
{
   System.out.println(array[i]);
}
```