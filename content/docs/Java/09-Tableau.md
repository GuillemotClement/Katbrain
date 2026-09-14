# Tableau 

Un tableau est un objet spécial qui peut stocker plusieurs valeurs. Un tableau une une "boîte" divisée en section. Chqaue section du tableau a son numéro qui commence à zéro.

La valeur initial des cellules du tableau est `0`, `null` (pour les cellules stockant des adresses), et `false` pour des boolean.

Après la création du tableau, il n'est plus possible de changer le type de ses éléments ou leur nombre.

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

// =====================================
// création en deux temps 
// =====================================
type[] = name; // création du tableau 
name = new type[count]; // initialisation du tableau 
```

### Initialisation rapide de tableau 

```java 
// initialisaiton rapide 
int[] months = new int[] { 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 };

// initialisation encore plus rapide 
int[] months = { 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 };
```

### Tableau de `String` 

**Remplir le tableau avec des saisies user**

```java 
// ===============================
// tableau de String qui récupère des saisie user
// ===============================
String[] array = new String[10];	// Créer un tableau-objet de 10 éléments
for (int i = 0; i < 10; i++)		// Boucle de 0 à 9
{
   array[i] = console.nextLine();	// Lire une ligne au clavier et la stocker dans la case du tableau
}
for (int i = 9; i >= 0; i--)		// Boucle de 9 à 0
{
    System.out.println(array[i]);	// Afficher la case suivante du tableau
}
```

### Tableau de `null`

`null` est une constante spéciale qui indique une référence vide. Lorsqu'une variable type-objet est créer, sa valeur initial est `null`. 

Il est impossible d'appeler des méthodes sur un objet si sa valeur est `null`. Le programme lance une erreur dans ce cas `NullPointerException`.

```java 
int[] numbers = new int[10]; // contient des 0
String[] strings = new String[10]; // contient des ""
User[] users = new User[10]; // contient des null
```

### Dépassement et limite de tableau 

En cas de tentative d'accès à une cellule d'un tableau via l'indice qui n'existe pas dans le tableau, cela provoque une erreur `ArrayIndexOutOfBoundsException`.


## Manipulation du tableau 

Pour manipuler les cellules du tableau, on viens indiquer son index. La numérotation commence toujours à zéro.

```java 
int[] a = new int[10];	// Nous créons un tableau de 10 éléments de type int.

a[2] = 4;				// Nous écrivons la valeur 4 dans la cellule d’indice 2.

a[7] = 9;				// Nous écrivons la valeur 9 dans la cellule d’indice 7.

a[9] = a[2] + a[5];		// Nous écrivons dans la cellule d’indice 9 la somme des valeurs stockées dans les cellules 2
                        // (4) et 5 (0).

// ================================
// utilisaton de variables et expression
// ================================
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


### Longueur de tableau - `array.length`

Retourne la longeur du tableau. 

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

## Parcourir un tableau 

### `for-each`

Boucle spécial permettant de simplifier l'itération de tableau.

La boucle itère sur chaque élément du tableau. Une variable locale est créer, et contient la valeur en cours d'itération. 


```java 
// ==============================
// parcourir un tableau de int 
// ==============================
for (int score : scores)
{
    System.out.println("Points: " + score);
}

// =================================
// somme des éléments du tableau 
// =================================
int sum = 0;
for (int score : scores)
{
    sum += score;
}
System.out.println("Somme de tous les points: " + sum);
```

### Itération et modification

La boucle ne permet pas de modifier les éléments du tableau, pour cela, il est nécessaire d'utiliser une boucle `for` et d'utiliser l'index de l'élément pour le modifier.

```java
for (int i = 0; i < scores.length; i++)
{
    int score = scores[i];
    System.out.println("Points: " + score);
}
```

## Pattern de tableau 

### Somme des élémens du tableau 

```java 
int sum = 0;
for (int i = 0; i < grades.length; i++) {
    sum += grades[i]; // équivaut à sum = sum + grades[i];
}
System.out.println("Somme des notes: " + sum);
```

### Rechercher une valeur max 

```java 
int max = grades[0]; // commençons par le premier élément
for (int i = 1; i < grades.length; i++) {
    if (grades[i] > max) {
        max = grades[i];
    }
}
System.out.println("Note maximale: " + max);
```

### Recherche de la valeur min 

```java 
int min = grades[0]; // commençons par le premier élément
for (int i = 1; i < grades.length; i++) {
    if (grades[i] < min) {
        min = grades[i];
    }
}
System.out.println("Note minimale: " + min);
```

### Calcul de la moyenne 

```java 
int sum = 0;
for (int i = 0; i < grades.length; i++) {
    sum += grades[i];
}
double average = (double) sum / grades.length; // il faut absolument convertir en double !
System.out.println("Note moyenne: " + average);
```

### Saisie d'une tableau au clavier 

```java 
Scanner console = new Scanner(System.in);

int n = 5; // taille du tableau
int[] numbers = new int[n];

System.out.println("Saisissez " + n + " nombres:");
for (int i = 0; i < n; i++) {
    numbers[i] = console.nextInt();
}

System.out.println("Vous avez saisi:");
for (int i = 0; i < n; i++) {
    System.out.println(numbers[i]);
}
```

### Affichage du tableau en sens inverse 

```java 
for (int i = grades.length - 1; i >= 0; i--) {
    System.out.println("Note n°" + (i + 1) + ": " + grades[i]);
}
```
---

## Tableau à deux dimensions 

Un tableau à deux dimensions peut être appelé une matrice. 

Ce sont des tableaux qui contiennent un tableau.

### Création  

On utilise deux paires de crochets.

Le premier crochet correspond aux lignes, et le second au colonnes.

```java 
// ========================
// syntaxe 
// ========================
int[][] matrix;
matrix = new int[3][4]; // 3 lignes, 4 colonnes

// ==========================
// initisation rapide 
// ==========================
int[][] matrix = new int[3][4];

// ==========================
// initialisation très rapide 
// ==========================
int[][] example = {
    {1, 2, 3},
    {4, 5, 6},
    {7, 8, 9}
};
```

### Accès aux éléments 

Dans un tableau 2D, on accède au élément en indiquant la ligne, puis la colonne.

```java 
int[][] data = new int[5][2];
data[1][1] = 5;         // écriture
int value = data[1][1]; // lecture
```

### Remplir un tableau 2D 

```java 
int[][] matrix = new int[3][4];
int value = 1;

for (int row = 0; row < 3; row++)
{
    for (int col = 0; col < 4; col++)
    {
        matrix[row][col] = value;
        value++;
    }
}

/* sortie 
┌────┬────┬────┬────┐
│ 1  │ 2  │ 3  │ 4  │
├────┼────┼────┼────┤
│ 5  │ 6  │ 7  │ 8  │
├────┼────┼────┼────┤
│ 9  │ 10 │ 11 │ 12 │
└────┴────┴────┴────┘
*/
```

### Affichage de tableau 2D 

Pour itérer sur des tableau 2D, on utilise une double boucle.

```java 
for (int row = 0; row < matrix.length; row++)
{
    for (int col = 0; col < matrix[row].length; col++)
    {
        System.out.print(matrix[row][col] + "\t");
    }
    System.out.println(); // saut de ligne
}
```

### Pattern

#### Echange de ligne 

```java 
// Matrice importante avec des données
int[][] matrix = {
  {1, 2, 3, 4, 5},
  {5, 4, 3, 2, 1}
};

int[] tmp = matrix[0];
matrix[0] = matrix[1];
matrix[1] = tmp;
```

---

## Jagged Arrays 

Les tableaux irréguliers permettent d'avoir des lignes de longueurs différentes. Chaque élément est lui même un tableau, et ses sous-tableaux peuvent avoir une longueurs différentes.

### Création 

```java 
// 1. création du tableau externe 
int[][] jaggedArray = new int[3][];

// 2. Création et initialisation des sous tableaux 
jaggedArray[0] = new int[2]; // 2 éléments dans la première ligne
jaggedArray[1] = new int[4]; // 4 éléments dans la deuxième ligne
jaggedArray[2] = new int[3]; // 3 éléments dans la troisième ligne

// 3. Remplissage avec valeurs 
jaggedArray[0][0] = 1;
jaggedArray[0][1] = 2;

jaggedArray[1][0] = 3;
jaggedArray[1][1] = 4;
jaggedArray[1][2] = 5;
jaggedArray[1][3] = 6;

jaggedArray[2][0] = 7;
jaggedArray[2][1] = 8;
jaggedArray[2][2] = 9;

// =============================
// syntaxe courte 
// =============================
int[][] jaggedArray = new int[][]
{
    new int[] { 1, 2 },
    new int[] { 3, 4, 5, 6 },
    new int[] { 7, 8, 9 }
};

// ==============================
// syntaxe encore plus courte 
// ==============================
int[][] jaggedArray =
{
    { 1, 2 },
    { 3, 4, 5, 6 },
    { 7, 8, 9 }
};
```

### Parcourir 

```java 
// =============================
// itération avec for 
// =============================
for (int i = 0; i < jaggedArray.length; i++)
{
    System.out.println("Ligne " + i + ":");
    for (int j = 0; j < jaggedArray[i].length; j++)
    {
        System.out.print(jaggedArray[i][j] + " ");
    }
    System.out.println();
}

// ================================
// itération avec for-each 
// ================================
for (int[] row : jaggedArray)
{
    for (int value : row)
    {
        System.out.print(value + " ");
    }
    System.out.println();
}
```

---

## Tableau multidimensions 

### Création 

Le nombre de crochets permet de définir le nombre de dimensions 

```java 
int[][][] cube = new int[2][3][4]; // 2 couches, 3 lignes, 4 colonnes
cube[0][1][2] = 99;
```

### Parcourir 

```java 
for (int i = 0; i < cube.length; i++)
{
    for (int j = 0; j < cube[i].length; j++)
    {
        for (int k = 0; k < cube[i][j].length; k++)
        {
            System.out.print(cube[i][j][k] + " ");
        }
        System.out.println();
    }
    System.out.println("---");
}
```

---

## Classe `Arrays`

La classe `java.util.Arrays` fournit un ensemble de méthode statique permettant de simplifier le travail avec les tableaux.

 La classe doit ètre importée avant de pouvoir être utilisée.

```java 
import java.util.Arrays;
```

### `Arrays.sort` - trie du tableau 

Cette méthode trie sur place le tableau. Elle vient modifier le tableau d'origine.

Pour conserver le tableau original, venir créer une copie avant de travailler sur le tableau.

```java 
Arrays.sort(array);
Arrays.sort(array, startIndex, endIndex);
```

#### Trie d'un tableau d'entiers 

Les entiers sont triée dans l'ordre croissant.

```java 
int[] scores = {5, 2, 9, 1, 7};
Arrays.sort(scores); // Tri croissant

System.out.println("Tableau trié: " + Arrays.toString(scores));
// Affichera: [1, 2, 5, 7, 9]
```

#### Trie d'un tableau de String 

Les String sont triée par ordre alphabétique.

```java 
String[] names = {"Alice", "Bob", "Charlie", "David"};
Arrays.sort(names);

System.out.println(Arrays.toString(names));
// [Charlie, David, Bob, Alice]
```

#### Trie d'une partie du tableau 

```java
int[] arr = {7, 5, 3, 1, 9, 8};
Arrays.sort(arr, 1, 4); // trie les éléments d’indice 1 à 3 inclus (4 exclu)

System.out.println(Arrays.toString(arr));
// [7, 1, 3, 5, 9, 8]
```

### `Arrays.fill` - remplissage de tableau 

La méthode remplit tous les éléments du tableau, ou la partie indiquée avec la même valeur 

```java 
Arrays.fill(array, value);
Arrays.fill(array, startIndex, endIndex, value);
```

#### Remplir tout le tableau 

```java 
int[] marks = new int[5];
Arrays.fill(marks, 3); // Tous les éléments valent désormais 3
System.out.println(Arrays.toString(marks)); // [3, 3, 3, 3, 3]
```

#### Remplir une partie du tableau 

```java 
int[] arr = new int[10];
Arrays.fill(arr, 2, 5, 7); // Remplit les éléments d’indice 2 à 4 inclus (5 exclu)
System.out.println(Arrays.toString(arr));
// [0, 0, 7, 7, 7, 0, 0, 0, 0, 0]
```

#### Remplir un tableau de String 

```java 
String[] guests = new String[4];
Arrays.fill(guests, "Vide");
System.out.println(Arrays.toString(guests)); // [Vide, Vide, Vide, Vide]
```

### `Arrays.copyOf` - copie des éléments d'un tableau 

Cette méthode créer un nouveau tableau et copie les éléments depuis l'original. Si la nouvelle longueur est supérieur à l'originale, la "queue" est remplie par des valeurs par défaut.

```java 
Arrays.copyOf(originalArray, newLength);
```

#### Copie de tableau 

```java 
int[] original = {1, 2, 3};
int[] copy = Arrays.copyOf(original, 5);
System.out.println(Arrays.toString(copy)); // [1, 2, 3, 0, 0]
```

#### Réduction de tableau 

```java 
int[] shortCopy = Arrays.copyOf(original, 2);
System.out.println(Arrays.toString(shortCopy)); // [1, 2]
```

### `Arrays.copyOfRange()`

```java 
Arrays.copyOfRange(originalArray, startIndex, endIndex);
```
```java 
int[] arr = {10, 20, 30, 40, 50};
int[] mid = Arrays.copyOfRange(arr, 1, 4); // Copiera les éléments d’indice 1 à 3
System.out.println(Arrays.toString(mid)); // [20, 30, 40]
```

### `Arrays.equals()` - comparaison de tableau 1D 


```java 
Arrays.equals(array1, array2);
System.out.println(Arrays.equals(a, b)); // true
```

### `Arrays.deepEquals()` - comparaison tableau 2D 

```java 
Arrays.deepEquals(matrix1, matrix2);

int[][] matrix2 = {{1, 2}, {3, 4}};
System.out.println(Arrays.deepEquals(matrix1, matrix2)); // true
```

### `Arrays.toString()` - affichage du tableau 1D en String

```java 
Arrays.toString(array);

System.out.println(Arrays.toString(arr)); // [1, 2, 3]
```

### `Arrays.deepToString()` - affichage du tableau 2D en String 

```java 
int[][] matrix = {{1, 2}, {3, 4}};
System.out.println(Arrays.deepToString(matrix)); // [[1, 2], [3, 4]]
```
