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

### `int`

`int` est le type pour stocker des nombres entiers.

- `int`: **-2 147 483 648** - **2 147 483 647**

```java
void main()
{
  int x = 5;
}
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

