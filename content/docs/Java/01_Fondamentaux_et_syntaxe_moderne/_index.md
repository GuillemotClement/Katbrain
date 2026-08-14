# Java

## Affichage

```java
void main()
{
  // affichage avec passage à la ligne
  System.out.println("Bonjour à tous !");
  System.out.println(2025);
  System.out.println("Mon âge : " + 28);

  // affichage sans passage à la ligne
  System.out.print("Amigo");
}
```

---

## Variable

Chaque objet Java et variable possède son type.

```java
// entier
int a = 5;
// string
String s = "Gizmo";
// float
double c = 10.5;

// déclaration multiple
int a, b;
// déclaration et affectation multiple
int x = 1, y = 2;

// affectation de valeur
i = 3;

// concaténation
String s1 = "Amigo" + " the best";
```

Une variable doit avoir une valeur d'affecter pour pouvoir être manipulée.

---

## Commentaire

```java
// Initialisation de la variable contenant le nom d’utilisateur
String userName = "Vasya";

/*
  Ici, nous affichons le nom de l’utilisateur à l’écran.
  S’il est absent, nous écrirons "Invité".
*/
System.out.println("Entrez votre nom:");
```

---

## Opération

### Division

La division d'un entier par un autre entier produit toujours un entier. Le reste de la division est tronqué, la partie divisionnaire et ignorée.

```java
void main()
{
  int a = 5 / 2; // 2
}
```

### Modulo

Permet d'obtenir le reste d'une division.

Peut servir pour savoir si un nombre est pair.

```java
void main()
{
  int a = 5 % 2; // 2 et reste 1 => a = 1

  int isPair = 5 % 2; // 1 -> impair
}
```

### Incrémentation et décrémentation

Permet d'augmenter ou de réduire par 1 une valeur.

```java
void main()
{
  int x = 5;
  x++; // 6
  x--; // 5
}
```

## Types

### Nombre

#### Nombre entier 

- `long`: utilisé pour les grandes valeurs (-9 223 372 036 854 775 808
à 9 223 372 036 854 775 807)
- `int`: type de base pour les entiers (-2 147 483 648 à 2 147 483 647)
- `short`: pour les petites valeurs (-32 768 à 32 767)
- `byte`: encore plus petit (-128 à 127)

#### Nombre flottant 

- `double`: type par défaut pour stocker des nombres à virgule (précision double (15–16 chiffres))
- `float`: plus léger et moins précis pour traiter de grands volumes de données (précision simple (7 chiffres))

#### Numérique spécialisés

- `BigInteger`: travailler avec de gros nombres (cryptographie, calcul astronomique)
- `BigDecimal`: classe pour des calculs exacts avec des nombres décimaux (finance, calcul d'intêret) qui permet d'éviter les imprécisions 

#### Suffixe pour les nombres

Dans certaine situation, il faut indiquer explicitement le type que l'on souhaite utiliser pour un nombre.

- `L` ou `l`: `long` - `10000000000L`
- `F` ou `f`: `float` - `3.14f`
- `D` ou `d`: `double`, généralement inutile, par défaut, un nombre à virgule sans suffixe est un `double`

```java
long bigNumber = 9000000000L; // si on retire le L, il y aura une erreur de compilation
```

- `_`: séparateur pour les gros nombres

```java
int population = 146_700_000;
long stars = 100_000_000_000L;
```

---

### `char`

Le type `char` est utilisé pour stocker un seul caractère. Derrière un caractère, on retrouve son code numérique unicode, un nombre de 16 bits.

```java
char letter = 'A';
char digit = '7';
char symbol = '?';
char cyrillic = '\u0416';
char euro = '€';
char smile = '☺'; // Oui, c'est aussi possible !
```

#### Obtenir le code Unicode

```java
// char -> unicode
public class CharToInt {
    public static void main(String[] args) {
        char ch = 'A';
        int code = ch; // Conversion implicite char → int

        System.out.println("Code du caractère '" + ch + "': " + code);
    }
}
//Code du caractère 'A': 65

// unicode -> char 
public class IntToChar {
    public static void main(String[] args) {
        int code = 1040; // Code du caractère 'A cyrillique' en Unicode (alphabet cyrillique)
        char ch = (char) code; // Conversion explicite int → char

        System.out.println("Caractère avec le code " + code + ": " + ch);
    }
}

// Caractère avec le code 1040: \u0410
```

### `String`

Permet de stocker du texte. Il dispose de nombreuse méthodes permettant d'effectuer des opération sur une chaîne.

Tous les objets Java peuvent être convertis en type `String`. Ils peuvent retourner une représentation textuelle.

```java
void main()
{
  String name = "Gizmo";
  String zeroValue = ""; // déclare une chaîne vide
}
```

#### Concaténation

La concaténation permet d'assembler des string.

```java
void main()
{
  String name = "Anya";                // name contient la chaîne Anya
  String city = "New York";           // city contient la chaîne New York
  String message = "Hello!" + city + name + city; // message contient la chaîne Hello!New YorkAnyaNew York
}

```

#### Echappement de char 

```java
void main(){
  String quote = "Il a dit: \"Bonjour!\"";
  System.out.println(quote); // Il a dit: "Bonjour!"
}
```

- `\n`: saut de ligne 
- `\t`: tabulation 
- `\\`: \
- `\"`: "

#### Méthode de String 

Chacune de ses méthodes retourne une nouvelle chaîne sans modifier l'original

```java
void main()
{
  // longueur d'une chaine 
  String name = "Andrey";
  int length = name.length();
  System.out.println(length); // 6, car il y a 6 lettres

  // majuscule et minuscule 
  String original = "Bonjour";
  System.out.println(original.toUpperCase()); // BONJOUR
  System.out.println(original.toLowerCase()); // bonjour

  // nettoyage d'espaces
  String messy = "   hello   ";
  System.out.println(messy.trim()); // "hello"
}
```

### Boolean 

Contient une valeur `true` ou `false`.

Il permet de réaliser des comparaison.

```java
boolean isAdult = true;
boolean hasMoney = false;

// utilisation
int age = 20;
boolean isAdult = age >= 18;   // true (20 est supérieur ou égal à 18)
boolean isTeenager = age >= 13 && age < 18; // false (20 n'est pas inférieur à 18)
boolean isEven = age % 2 == 0; // true (20 est divisible par 2)
```

### Conversion de type 

#### Nombre -> chaine - `String.valueOf()`

```java
void main()
{
  // String.valueOf() -> méthode principale
  int number = 42;
  String str = String.valueOf(number);  // str == "42"

  // Concaténation de chaîne -> ancienne méthode
  int number = 42;
  String str = "" + number;
}
```

#### Conversion implicite en chaîne 

Toutes les variables, objets et expression en Java peuvent être convertis en type `String`. Cela se produit automatiquement lorsque l'on concatène un `String` avec un autre type.

Il est impossible de réaliser des opérations avec des `String`.

```java
void main()
{
  int a = 5;
  String name = "Anya" + a;            //  name contient la chaîne Anya5

  int a = 5;
  String city = a + "New York" + a;   //  city contient la chaîne 5New York5

  int number = 10;
  String code = "Yo";
  String message = "Hello! " + number + code; //  message contient la chaîne Hello! 10Yo

  int a = 5;
  String name = "1" + a;              //  name contient la chaîne 15

  int a = 5;
  String city = a + "9" + a;          //  city contient la chaîne 595

  int number = 10;
  String code = "10";
  String message = "" + number + code; // message contient la chaîne 1010

  int a = 5;
  String name = a + a + "1" + a;      // name contient la chaîne 1015
}
```

#### chaine -> nombre - `Integer.parseInt()`

Pour convertir une chaîne en nombre, il faut que celle ci doivent contenir que des nombres.

```java
void main()
{
  String str = "123";
  int number1 = Integer.parseInt(str);        //  number1 contient le nombre 123;

  int number2 = Integer.parseInt("321");      //  number2 contient le nombre 321

  int number3 = Integer.parseInt("321" + 0);  //  number3 contient le nombre 3210

  int number4 = "321"; //  Ne se compile pas : variable de type int, mais valeur de type String
}
```









---

## Mémoire 

Chaque programme Java est chargé en mémoire vive avant son exécution. La RAM contient le code du programme (exécuté par le processeur) et les données du programme (placer en mémoire).

Le programme et ses données sont stockées en mémoire pendant l'exécution. Toute la mémoire de l'ordinateur est représentës sous forme de petites cases - les octets.
Chaque octet dispose de son numéro unique (la numérotation débute à zéro). En connaissant le numéro de la casse, on peux y enregistrer des données, les lire.

Dans certaines case, se trouve le code du programme, c-a-d un ensemble d'insturction pour le processeur, dans d'autre, les données du programme. Le numéro d'une case est appelé l'adresse de la case.

Lorsqu'une variable est déclarée dans le code du programme, un petit bloc de mémoire libre lui est alloué. La taille de l'emplacemenment mémoire dépent du type de la variable. 

Les programmes `Java` n'ont pas le droit d'accèder directement à la mémoire. Toute manipulation mémoire s'effectue avec la `JVM`.

**String**

Le type `String` peut contenir de grands volumes de données, elle est stocker sous forme d'objet. Les données sont stockées dans un objet spécial pour lequel la mémoire est allouée, et c'est l'adrese de l'objet qui est placée dans la variable.

---

## Récupération de saisie - `System.in`

`System.in` est l'objet permettant de récupérer une saisie clavier.

### `Scanner`

Cette classe permet de lire des données à partir de différentes sources: console, fichiers, internet.

```java
void main()
{
    Scanner console = new Scanner(System.in); // création d'un objet Scanner
    String name = console.nextLine(); // récupération de la saisie depuis le terminal 
    int age = console.nextInt(); // récupération d'une valeur depuis le terminal

    System.out.println("Name: " + name);
    System.out.println("Age: " + age);
}
```

- `Scanner console = new Scanner(System.in);`: Déclaration d'un objet `Scanner` avec pour nom `console`.
- `new Scanner(System.in);`: création d'un nouvel objet `Scanner`, `System.in` est la source de la saisie -> terminal
- `console.nextLine()`: utilisation de l'objet pour récupérer une saisie de type string
- `console.nextInt()`: utilisation de l'objet pour récuprer une saisie de type int
- `console.nextDouble()`: récupération d'une saisie d'un nombre à virgule

---

## Condition 

### Opérateur de compararaison 

- `==`: egale
- `!=`: différent 
- `>` : supérieur 
- `>=`: supérieur ou égale
- `<` : inférieur
- `<=` : inférieur ou égale

### Opérateur logique

- `||` : ET 
- `&&` : OU 
- `!` : NOT

```java
// ET
int age = 16;
boolean hasTicket = true;
boolean canAttend = age >= 14 && hasTicket; // true (16 est supérieur à 14 ET un billet est présent)

// OU
boolean isAdmin = false;
boolean isModerator = true;
boolean canEdit = isAdmin || isModerator; // true (on peut modifier si au moins l'un des deux est true)

// NOT
boolean isWeekend = false;
boolean shouldGoToWork = !isWeekend; // true (si ce n'est pas le week-end, on travaille)

// Opérateurs combinés
int age = 17;
boolean hasTicket = false;
boolean isVip = true;

boolean canGo = (age >= 18 && hasTicket) || isVip; // true, parce que isVip = true
```

### Priorité 

Dans l'ordre de priorité, puis de gauche à droite

L'utilisation des priorité permet de rendre plus simple la lecture de la priorité

- `()`
- `!`
- `==`, `!=`
- `<`, `>`, `<=`, `=>`
- `&&`
- `||`


### if/else 

```java
void main()
{
  // if simple 
  int age = 19;
  if (age >= 18)
  {
      System.out.println("Vous êtes majeur !");
  }

  // if / else 
  int age = 17;
  if (age < 18)
  {
    System.out.println("Tu es encore un enfant");
    System.out.println("Ne discute pas avec les adultes");
  }
  else
  {
    System.out.println("Vous êtes déjà adulte");
    System.out.println("Eh bien, quelle jeunesse");
  }

  // else if
  int hour = 13;
  if (hour < 12)
  {
      System.out.println("Bonjour !");
  }
  else if (hour < 18)
  {
      System.out.println("Bon après-midi !");
  }
  else
  {
      System.out.println("Bonsoir !");
  }
}
```

### Comparaison de string - `equals()`

Pour comparer des chaine, il faut utiliser la méthode `equals()`

```java
  String password = console.nextLine();
  if (password.equals("qwerty"))            // on appelle la méthode equals() et on lui passe la deuxième chaîne
  {
      System.out.println("Vous êtes connecté !");
  }
```

### Opérateur ternaire 

```java
Condition ? Expression1 : Expression2;

int age = 25;
int money = age > 30 ? 100 : 50; // age = 100

// calcul de valeur absolu 
int number = -5;
int abs = (number >= 0) ? number : -number;
System.out.println(abs); // 5

// exemple d'utilisation
System.out.print("Entrez votre nom : ");
String name = console.nextLine();

System.out.print("Entrez votre âge : ");
int age = console.nextInt();

int nextYear = age + 1;
// status est évalué selon les valeur de la condition ternaire
String status = (nextYear >= 18) ? "majeur" : "mineur";

System.out.println("Bonjour, " + name + " ! L'année prochaine, vous aurez " + nextYear + ". Vous serez " + status + ".");

// syntaxe longue 
boolean adult = (age >= 18) ? true : false;
// syntaxe courte
boolean adult = (age >= 18);
```

---

## Boucle 

### while 

Tant que, alors fait

La condition est évaluer à chaque itération. Tant que la conditon est `true`, la boucle continue.

```java
// syntaxe
while (condition)
{
    // Corps de la boucle
}

// utilisation 
int i = 1;
while (i <= 5)
{
    System.out.println("Étape n° " + i);
    i++; // N’oubliez pas d’incrémenter le compteur !
}
// Affichera :
// Étape n° 1
// Étape n° 2
// Étape n° 3
// Étape n° 4
// Étape n° 5

// boucle de saisie 
String password = "";
while (!password.equals("qwerty"))
{
    System.out.print("Entrez le mot de passe : ");
    password = console.nextLine();
}
System.out.println("Bienvenue !");

// boucle infinie 
while (true)
{
    System.out.println("Je suis éternel !");
}
```

### do while

Effectue une itération, puis évalue la condition

```java
// syntaxe
do
{
    // Corps de la boucle : ce code s'exécutera au moins une fois
}
while (condition);

// example
int count2 = 0;
do
{
    System.out.println("count2 = " + count2);
    count2--;
}
while (count2 > 0);
// Affichera "count2 = 0", même si la condition est fausse !

// validation de données
String password;
do
{
    System.out.print("Saisissez un nouveau mot de passe (au moins 6 caractères) : ");
    password = console.nextLine();
}
while (password.length() < 6);

System.out.println("Mot de passe accepté !");

// menu console
String command;
do
{
    System.out.println("Menu :");
    System.out.println("1. Afficher un message de bienvenue");
    System.out.println("2. Quitter");
    System.out.print("Choisissez une action : ");
    command = console.nextLine();

    if (command.equals("1"))
    {
        System.out.println("Bonjour, monde !");
    }
    else if (!command.equals("2"))
    {
        System.out.println("Commande inconnue.");
    }
}
while (!command.equals("2"));

System.out.println("Au revoir !");
```

### for 

Permet d'itérer un nombre de fois définie.

- `initialisation`: valeur initial
- `condition`: condition évaluer à chaque itération. si vrai, continue d'itérer
- `mise à jour`: exécuter après chaque itération

```java
// syntaxe
for (initialisation; condition; mise à jour)
{
    // Corps de la boucle
}

// example
for (int i = 0; i < 10; i++)
{
    System.out.println("Salut !");
}

// boucle avec variables multiple
for (int left = 1, right = 10; left <= 10; left++, right--)
{
    System.out.println(left + "  " + right);
}

// boucle for infinie
for (;;) // ni initialisation, ni condition, ni mise à jour
{
    System.out.println("Travailler, travailler et encore travailler !");
}
```

### `break`

Permet de quitter immédiatement une boucle

```java
// syntaxe
while (condition)
{
    if (kakoe-to_condition)
    {
        break;
    }
    // le reste du code de la boucle
}

// example
for (int i = 0; i < 10; i++)
{
    if (kakoe-to_condition)
    {
        break;
    }
    // le reste du code de la boucle
}
```

### `continue`

Permet de passer à l'itération suivante 

```java
// syntaxe
for (int i = 0; i < 10; i++)
{
    if (condition)
    {
        continue;
    }
    // cette partie ne s'exécute que si continue ne s'est pas déclenché
}

// example
for (int i = 1; i <= 10; i++)
{
    if (i % 2 == 0)
    {
        continue; // si le nombre est pair - on saute tout ce qui suit !
    }
    System.out.println("Nombre impair: " + i);
}
```

### Boucle imbriquée

La boucle interne s'effectue en intregraliter, puis la boucle externe viens faire itération avant de relancer la boucle interne.

L'utilisation de `break` et `continue` dans une boucle intérieur n'affecte pas la boucle exterieur

```java
// Boucle externe for
for (int i = 0; i < 3; i++)
{
    for (int j = 0; j < 4; j++)  // Boucle interne for
    {
        System.out.print(i + "," + j + " ");
    }
    System.out.println(); // Saut de ligne après la boucle interne
}
/*
0,0 0,1 0,2 0,3
1,0 1,1 1,2 1,3
2,0 2,1 2,2 2,3
*/

// example: affichage d'une échiquier 
for (int row = 0; row < 8; row++)
{
    for (int col = 0; col < 8; col++)
    {
        // Si la somme des indices ligne + colonne est paire — la case est blanche, sinon noire
        if ((row + col) % 2 == 0)
            System.out.print("_");
        else
            System.out.print("#");
    }
    System.out.println(); // Retour à la ligne après chaque rangée
}

/*
_#_#_#_#
#_#_#_#_
_#_#_#_#
#_#_#_#_
_#_#_#_#
#_#_#_#_
_#_#_#_#
#_#_#_#_
*/

// table de multiplication
for (int i = 1; i <= 9; i++)
{
    for (int j = 1; j <= 9; j++)
    {
        System.out.print(i * j + "\t");
    }
    System.out.println();
}

/*
1   2   3   4   5   6   7   8   9
  2   4   6   8  10  12  14  16  18
  3   6   9  12  15  18  21  24  27
  4   8  12  16  20  24  28  32  36
...
  9  18  27  36  45  54  63  72  81
  */
```

---

## Projet Java

### JDK

**JDK**: contiens tous les tools pour créer, compiler et exécuter des programmes Java.

Dans le monde Java, le dossier `src` contient le code d'un projet. Le fichier doit porter le nom de la clase. 
Par exemple `Main.java` contient la classe `Main`. Le nom du fichier doit également avoir une majuscule en début de nom.

### Structure d'un projet 

Exemple d'une structure basique de projet.

```tree
MyFirstProject/
├── .idea/           # fichiers de service d’IntelliJ IDEA, ne pas toucher
├── out/             # ici apparaissent les fichiers .class compilés
├── src/             # c’est ici que vit votre code source !
│   └── Main.java
├── MyFirstProject.iml
└── README.md
```

**src**
Dossier qui contient le code source du projet. C'est dans ce dossier que sont placer les classes.
L'extension est `.java`

### Package 

En Java, les classes sont regroupées par **package**, ces sont des "dossier" pour les classes. Ils permettent :
- d'éviter les conflits de nom si le projet contient deux classes avec le même nom
- structurer logiquement le code 
- gérer l'accès aux classes et méthodes

**Syntaxe de déclaration de package**

Au début de chaque fichier Java, avant les `import` et `class`, on ajoute la ligne 

```java
package com.codegym.lesson01;
```

Cette ligne indique que la classe de ce fichier appartient au package `com.codegym.lesson01`.

Les dossiers du system file doivent correspondrent au nom du package. Pour le package de l'exemple, le chemin du fichier sera **src/com/codegym/lesson01/Main.java**

#### Nom complet d'une classe 

Chaque classe Java se trouve dans un package. Un package étant un "dossier" dans une blibliothèque de classe. Par exemple la classe `System` se trouve dans le package `java.lang`. Son nom complet est `java.lang.System`

Pour l'utiliser :

```java
java.util.Scanner sc = new java.util.Scanner(System.in);
String name = sc.nextLine();
System.out.println("Bonjour, " + name);
```

Le nom complet est nécessaire lorsque l'on doit différencier deux classes différentes. Par exemple la classe `Date`:
- `java.util.Date`: ancienne classe pour la gestion des dates
- `java.sql.Date`: date pour travailler avec les base de données

```java
java.util.Date d1 = new java.util.Date();
java.sql.Date d2 = new java.sql.Date(System.currentTimeMillis());
```

#### `import` 

`import` permet d'importer une classe en utilisant son nom complet, et dans le code, utiliser le nom court de la classe.

Cette instruction ne peut pas être utilisé dans une méthode, il s'écrit uniquement au début du fichier

L'instruction ne charge pas les classes en mémoire, il indique au compilateur oú aller chercher la classe.

Il ne peut pas remplacer le nom complet s'il existe deux classes avec le même nom.

```java
// import classique
import java.util.Scanner;

Scanner sc = new Scanner(System.in);

// import de tous le package
import java.util.*;

Scanner sc = new Scanner(System.in);
ArrayList<String> list = new ArrayList<>();
```

L'import avec `*` n'importe que les classes du package, et pas celle des sous package.

#### Classpath 

Le `classpath` est l'itinéraire que Java parcourt pour trouver une classe au lancement du programme. 

- pour exécuter le programme depuis la ligne de commande, il est nécessaire d'indiquer explicitement le classpath à l'aide de l'option `-cp` ou `-classpath`
- Toutes les classes du projets et des lib ajoutées doivent se trouver dans le dossier figurant dans le classpath.

### Organisation du code dans le projet 

**Une classe - un fichier**
Chaque classe public est placer dans un fichier séparé portant le même nom de classe. Par exemple, une classe `Person` doit se trouver dans un fichier `Person.java`.

```java
// src/com/javarush/lesson05/Person.java

package com.codegym.lesson05;

public class Person {
    String name;
}
```

**Ressource**

Pour les images, fichiers text, celle ci sont placer dans un dossier séparé: `ressources` ou `res`.

```tree
MyFirstProject/
├── src/
│   └── com/javarush/lesson05/
│       └── Main.java
├── resources/
│   └── config.txt
```
