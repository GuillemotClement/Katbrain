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

### Déclaration rapide de tableau 

Il est possible lors de la déclaration de tableau, de remplir directement les valeurs de celui ci.

Le compilateur détermine alors le type, et la taille du tableau avec le nombres de valeurs insérées

```java
// longueurs des mois de l'année
int[] months = new int[] { 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 };

// encore plus court 
int[] months = { 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 };

// avec des string
String[] months = { "Janvier", "Février", "Mars", "Avril", "Mai", "Juin", "Juillet", "Août", "Septembre", "Octobre", "Novembre", "Décembre" };
```



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

## Tableau de string 

Lors de la déclaration du tableau de string, ou de type personnalisé, les valeurs sont `null` par défaut.

Seul les types primitifs ont une valeur par défaut,

```java
int[] numbers = new int[10];		// {0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
String[] strings = new String[10];  // {null, null, null, null, null, null, null, null, null, null}
User[] users = new User[10];		// {null, null, null, null, null, null, null, null, null, null}
```

Dans un tableau de `String`, ce n'est pas la string qui est stocké dans le tableau, mais une référence qui pointe vers son emplacement mémoire.

---

## `for-each`: parcourir un tableau

La boucle parcours tous les éléments du tableau. On ne peut pas venir modifier directement les éléments, la variable de la boucle ne contient qu'une copie de la valeur.

```java 
for (int score : scores)
{
    System.out.println("Points: " + score);
}

// calculer la somme des éléments 
int sum = 0;
for (int score : scores)
{
    sum += score;
}
System.out.println("Somme de tous les points: " + sum);
```

--- 
## Pattern 

### Somme des éléments du tableau

```java
int sum = 0;
for (int i = 0; i < grades.length; i++) {
    sum += grades[i]; // équivaut à sum = sum + grades[i];
}
System.out.println("Somme des notes: " + sum);
```

### Recherche valeur max 

```java
int max = grades[0]; // commençons par le premier élément
for (int i = 1; i < grades.length; i++) {
    if (grades[i] > max) {
        max = grades[i];
    }
}
System.out.println("Note maximale: " + max);
```

### Recherche valeur min 

```java
int min = grades[0]; // commençons par le premier élément
for (int i = 1; i < grades.length; i++) {
    if (grades[i] < min) {
        min = grades[i];
    }
}
System.out.println("Note minimale: " + min);
```

### Calcul de moyenne 

```java
int sum = 0;
for (int i = 0; i < grades.length; i++) {
    sum += grades[i];
}
double average = (double) sum / grades.length; // il faut absolument convertir en double !
System.out.println("Note moyenne: " + average);
```

### Saisie d'un tableau au clavier 

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

### Affichage du tableau inverser

```java
for (int i = grades.length - 1; i >= 0; i--) {
    System.out.println("Note n°" + (i + 1) + ": " + grades[i]);
}
```

## Tableau deux dimensions 

La première paire de `[]` pour les lignes, la seconde pour les colonnes.

Chaque élément du tableau est défini par une paire d'indice.

```java
// création du tableau
int[][] matrix;
// création et affectation 
int[][] matrix = new int[3][4];
// création rapide
int[][] example = {
    {1, 2, 3},
    {4, 5, 6},
    {7, 8, 9}
};
```

```java
int[][] data = new int[5][2];
data[1][1] = 5;         // [ligne][colonne] écriture
int value = data[1][1]; // lecture
```

En mémoire, la variable stocke la référence vers un emplacement mémoire qui contient des références vers les sous tableau.

Pour accéder aux au conteneur de conteneur, il suffit d'indiquer un indice :

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

### Remplir un tableau à deux dimensions 

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
```

### Affichage d'un tableau à deux dimensions 

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

---

## `jagged arrays`: Tableau irrégulier 

Les jagged arrays permettent d'avoir des lignes de longueurs différentes. Chaque élément est un tableau, et ces tableau imbriqués peuvent avoir des longueurs différentes.

```java
// création du tableau principale -> 3 lignes initialisé ä null  
int[][] jaggedArray = new int[3][];

// création et initialisation des tableaux interne
jaggedArray[0] = new int[2]; // 2 éléments dans la première ligne
jaggedArray[1] = new int[4]; // 4 éléments dans la deuxième ligne
jaggedArray[2] = new int[3]; // 3 éléments dans la troisième ligne

// remplissage avec des valeurs 
jaggedArray[0][0] = 1;
jaggedArray[0][1] = 2;

jaggedArray[1][0] = 3;
jaggedArray[1][1] = 4;
jaggedArray[1][2] = 5;
jaggedArray[1][3] = 6;

jaggedArray[2][0] = 7;
jaggedArray[2][1] = 8;
jaggedArray[2][2] = 9;
```

On peut créer et remplir un tableau irrégulier d'emblée si on connait les valeurs à l'avance 

```java
int[][] jaggedArray = new int[][]
{
    new int[] { 1, 2 },
    new int[] { 3, 4, 5, 6 },
    new int[] { 7, 8, 9 }
};

// syntaxe courte 
int[][] jaggedArray =
{
    { 1, 2 },
    { 3, 4, 5, 6 },
    { 7, 8, 9 }
};
```

### Itération 

```java
for (int i = 0; i < jaggedArray.length; i++)
{
    System.out.println("Ligne " + i + ":");
    for (int j = 0; j < jaggedArray[i].length; j++)
    {
        System.out.print(jaggedArray[i][j] + " ");
    }
    System.out.println();
}

// for-each 
for (int[] row : jaggedArray)
{
    for (int value : row)
    {
        System.out.print(value + " ");
    }
    System.out.println();
}

// éviter d'ajouter un caractère sur le dernier élément du sous tableau 
for(int i = 0; i < playerAchievements.length; i++){
    for (int j = 0; j < playerAchievements[i].length; j++){
        if(j == playerAchievements[i].length - 1){
            System.out.println(playerAchievements[i][j]);
            continue;
        }
        System.out.print(playerAchievements[i][j] + " ");
    }
    System.out.println("");
}
```

### Exemple complet 
On souhaite gérer le suivis des notes des étudiants

On commence par déclarer un nouveau tableau qui vient stocker les étudiants et les notes :

```java
int[][] studentMarks = new int[3][];
studentMarks[0] = new int[] { 5, 4 };         // Premier étudiant — 2 notes
studentMarks[1] = new int[] { 3, 4, 4 };      // Deuxième étudiant — 3 notes
studentMarks[2] = new int[] { 5 };            // Troisième étudiant — 1 note
```

On viens afficher ensuite ces notes 

```java 
for (int i = 0; i < studentMarks.length; i++)
{
    System.out.print("Étudiant " + i + ": ");
    for (int j = 0; j < studentMarks[i].length; j++)
    {
        System.out.print(studentMarks[i][j] + " ");
    }
    System.out.println();
}
```

### Tableaux irrégulier et types 

Un tableau irrégulier peut contenir n'importe quel types: chaîne, tableaux, objets 

```java
String[][] groups = {
    { "John", "Peter" },
    { "Maria", "Alex", "Serge" },
    { "Sarah" }
};
```

---

## Tableaux tridimensionnels et multidimensionnels 

Il est possible de créer des tableaux de n'importe quel dimensions.

On indique le nombre de dimensions avec des paires de crochets:

```java
int[][][] cube = new int[2][3][4]; // 2 couches, 3 lignes, 4 colonnes
cube[0][1][2] = 99;
```

On obtient ici :
- 2 éléments selon la première coordonnée
- 3 selon la deuxième 
- 4 selon la troisième 

L'accès à un élément se fait en utilisant tous les indices à la fois:

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

Ce tableau contient au total 24 élément (2 x 3 x 4)

---

## Classe `Arrays`

La classe `java.utils.Arrays`fournit des méthodes statiques pour travailler avec des tableaux: trie, copie, comparaison, affichage formaté.

Pas besoin de créer des instances, les méthodes sont statique.

```java
// import de la classe 
import java.util.Arrays;
```

### `Arrays.sort`: trie de tableau 

La méthode trie sur place, elle modifie le tableau d'origine et ne retourne pas de nouveau tableau. Pour conserver l'ordre d'origine, faire une copie avant le triage.

```java
// trie d'un tableau d'entier
int[] scores = {5, 2, 9, 1, 7};
Arrays.sort(scores); // Tri croissant

System.out.println("Tableau trié: " + Arrays.toString(scores));
// Affichera: [1, 2, 5, 7, 9]

// trie de strings
String[] names = {"Alice", "Bob", "Charlie", "David"};
Arrays.sort(names);

System.out.println(Arrays.toString(names));
// [Charlie, David, Bob, Alice]

// trie d'une partie du tableau 
int[] arr = {7, 5, 3, 1, 9, 8};
Arrays.sort(arr, 1, 4); // trie les éléments d’indice 1 à 3 inclus (4 exclu)

System.out.println(Arrays.toString(arr));
// [7, 1, 3, 5, 9, 8]
```

### `Arrays.fill`: remplissag de tableau 

La méthode remplt tous, ou une partie des éléments du tableau avec la même valeur.

```java
// remplissage de tout le tableau
int[] marks = new int[5];
Arrays.fill(marks, 3); // Tous les éléments valent désormais 3
System.out.println(Arrays.toString(marks)); // [3, 3, 3, 3, 3]

// Remplissage d'une partie du tableau 
int[] arr = new int[10];
Arrays.fill(arr, 2, 5, 7); // Remplit les éléments d’indice 2 à 4 inclus (5 exclu)
System.out.println(Arrays.toString(arr));
// [0, 0, 7, 7, 7, 0, 0, 0, 0, 0]

// remplissage d'un tableau de string 
String[] guests = new String[4];
Arrays.fill(guests, "Vide");
System.out.println(Arrays.toString(guests)); // [Vide, Vide, Vide, Vide]
```

### `Arrays.copyOf` & `Arrays.copyOfRange`: copie de tableau 

`copyOf` permet de créer un nouveau tableau et de copier les éléments depuis l'original. Si la nouvelle longueur est supérieur à l'originale, la queue est remplie par des valeurs par défaut.

```java
int[] original = {1, 2, 3};
int[] copy = Arrays.copyOf(original, 5);
System.out.println(Arrays.toString(copy)); // [1, 2, 3, 0, 0]

// réduction de tableau 
int[] shortCopy = Arrays.copyOf(original, 2);
System.out.println(Arrays.toString(shortCopy)); // [1, 2]
```

`copyOfRange`

```java
int[] arr = {10, 20, 30, 40, 50};
int[] mid = Arrays.copyOfRange(arr, 1, 4); // Copiera les éléments d’indice 1 à 3
System.out.println(Arrays.toString(mid)); // [20, 30, 40]
```

### `Arrays.equals` & `Arrays.deepEquals`: comparaison de tableau 

`equal` pour les tableaux simple, et `deepEquels` pour les tableau à dimensions multiple.

```java 
int[][] matrix1 = {{1, 2}, {3, 4}};
int[][] matrix2 = {{1, 2}, {3, 4}};

System.out.println(Arrays.equals(matrix1, matrix2));     // false!
System.out.println(Arrays.deepEquals(matrix1, matrix2)); // true
```

### `Arrays.toString` & `Arrays.deepToString`: affichage lisible de tableau 

Permet de faire un affichage direct d'un tableau dans une chaîne lisible.

```java 
// tableau simple 
int[] arr = {1, 2, 3};
System.out.println(Arrays.toString(arr)); // [1, 2, 3]

// tableau multi-dimension 
int[][] matrix = {{1, 2}, {3, 4}};
System.out.println(Arrays.deepToString(matrix)); // [[1, 2], [3, 4]]
```

---

## `ArrayList<T>`: Tableau infini 

ArrayList est un "tableau intelligent" qui peut grandir et rétrécir automatiquement. 

Le type des éléments du tableau doit être indiqué dans les chevrons. On peut utiliser n'importe quels types, sauf les primitifs. Il sera nécessaire de les envelopper.

```java 
// création du tableau infini de string 
ArrayList<String> array = new ArrayList<String>()
ArrayList<Integer> numbers = new ArrayList<Integer>();      // int
ArrayList<Double> fees = new ArrayList<Double>();            // double
ArrayList<Boolean> yesList = new ArrayList<Boolean>();       // boolean
ArrayList<Character> chars = new ArrayList<Character>();     // char
```

### `add(element)`: ajouter un élément 

```java
// cr"ation d'un tableau de String  
ArrayList<String> todo = new ArrayList<>(); // liste des tâches
todo.add("Apprendre ArrayList");
todo.add("Préparer du thé");
todo.add("Se promener");
```

### `get(index)`: accès par indice

Chaque élément est ranger par indice. L'indexation débute toujours à zéro.

Si on tente d'accéder à un indice qui n'existe pas dans le tableau, cela provoque une erreur.

```java
String task = todo.get(1);
System.out.println("Deuxième tâche : " + task);
```

### `set(index,element)`: remplacer 

```java
todo.set(1, "Préparer du café");
System.out.println("Désormais, la deuxième tâche : " + todo.get(1));
```


### `remove(index)`: supprimer un élément 

Lors de la supression, les éléments sont décalé vers la gauche. Par exemple, on supprime l'élément placé à l'index 0. L'élément ranger à l'index 1 passe sur l'index 0. 

```java
todo.remove(0);
System.out.println("La première tâche maintenant : " + todo.get(0));
```

### `size()`: retourne le nombre d'élément du tableau 

```java
System.out.println("Nombre total de tâches : " + todo.size());

// parcourir les éléments 
for (int i = 0; i < todo.size(); i++)
{
    System.out.println(todo.get(i));
}
```

### `contains(element)`: vérification de présence 

Retourne true ou false selon si l'élément est présent dans le tableau.

```java
System.out.println(todo.contains("Se promener"));
System.out.println(todo.contains("Préparer du thé"));
```


### Application: todo app 

```java 
import java.util.ArrayList;
import java.util.Scanner;

public class TodoApp
{
    public static void main(String[] args)
    {
        ArrayList<String> todo = new ArrayList<>();
        Scanner console = new Scanner(System.in);

        while (true)
        {
            System.out.print("Saisissez une tâche (ou une ligne vide pour quitter) : ");
            String task = console.nextLine();
            if (task.isEmpty()) break;
            todo.add(task);
        }

        System.out.println("Votre liste de tâches :");
        for (int i = 0; i < todo.size(); i++)
        {
            System.out.println((i + 1) + ". " + todo.get(i));
        }
    }
}
```




