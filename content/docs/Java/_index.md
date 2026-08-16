# Java

## Lancer un programme Java

```shell
# compilation
javac <file_name>.java

# lancement
java <file_name>
```

---

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

## Arithmétique

### Division

La division d'un entier par un autre entier produit toujours un entier. Le reste de la division est tronqué, la partie divisionnaire et ignorée.

Le résultat d'une division est toujours un nombre à virgule si au moins un des opérande est un `double`

```java
void main()
{
  int a = 5, b = 2;
  System.out.println(a / b); // 2 (le reste est ignoré)

  double aa = 5, bb = 2;
  System.out.println(aa / bb); // 2.5
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

```java
// déclaration
double pi = 3.1415926;
```

##### Formatage de sortie 

Par défaut, un `double` s'affiche avec pleins de zéro supperflus. Il est possible de formater la sortie

```java
double temp = 23.56789;
System.out.println(temp); // 23.56789

// 2 décimales
System.out.println(String.format("%.2f", temp)); // 23.57

// 1 décimale
System.out.println(String.format("%.1f%n", temp)); // 23.6
```

- `%.2f`: sortie avec 2 décimales
- `%.1f`: sortie avec 1 décimale


##### Comparaison de float 

```java
double a = 0.1 + 0.2;
double b = 0.3;
double epsilon = 0.000001; // permet de définir une tolérance pour la comparaison

if (Math.abs(a - b) < epsilon)
{
    System.out.println("Presque égal !"); // C’est plus sûr de comparer ainsi
}
```

`Math.abs()` permet de retourner la valeur absolue. On viens calculer la différence, et si inférieur à un millionième, on considère que les nombres sont égaux.

##### Valeurs spéciale de double

Le type `double` stocke des nombres et des valeurs particulières.

**`Infinity`**
En Java, la division par 0 ne lève pas d'exception. A la place, le résultat devient une valeur spécial 

```java
double result = 1.0 / 0.0;
System.out.println(result); // Infinity
```

**`-Infinity`**
Lorsque l'on divise un nombre négatif par 0, on obtient l'infini négatif 

```java
double result = -1.0 / 0.0;
System.out.println(result); // -Infinity
```

**`NaN`**
Correspond à tout ce qui n'est pas un nombre

```java
double result = Math.sqrt(-1);
System.out.println(result); // NaN
```

**Vérification des valeurs spéciales**

```java
System.out.println(Double.isInfinite(result));    // true, si infini
System.out.println(Double.isNaN(result));         // true, si NaN
```

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

#### Arrondi 

Modifie la valeur du nombre

##### `Math.round()` - arrondi à l'entier proche 

Prends un nombre (**float** ou **double**) et retourne l'entier le plus proche.

- `float`: retourne un `int` 
- `double`: retourne un `long`

```java
System.out.println(Math.round(2.3)); // 2
System.out.println(Math.round(2.7)); // 3
System.out.println(Math.round(2.5)); // 3
System.out.println(Math.round(-2.5)); // -2

// pour obtenir un int avec avec un double
int rounded = (int) Math.round(5.6); // 6
```

##### `Math.floor()` - arrondit vers le bas 

```java
System.out.println(Math.floor(2.7)); // 2.0
```

##### `Math.ceil()` - arrondit vers le haut 

```java
System.out.println(Math.ceil(2.1));  // 3.0
```

##### `Math.rint()` - arrondit vers l'entier le plus proche -> retourne un double 

Arrondit parfois à l'entier pair le plus proche -> aide à réduire l'accumulation d'erreur lors de gros calculs.

```java
System.out.println(Math.rint(2.5));  // 2.0 (oui, oui, ce n'est pas une faute de frappe!)
System.out.println(Math.rint(3.5));  // 4.0
```

##### Arrondis à une décimales donné

Il est souvent nécessaire d'arrondir non pas à l'entier, mais par exemple à deux décimales.

**Méthode 1: multiplication et division**

1. Multiplier par 100 (pour deux décimale)
2. Arrondir à l'entier avec `Math.round()`
3. Diviser par 100 

```java
double value = 3.14159;
double rounded = Math.round(value * 100.0) / 100.0;
System.out.println(rounded); // 3.14
```

#### Mise en forme 

Modifie l'apparence du nombre, mais pas la valeur. Celle ci reste en mémoire.

##### `DecimalFormat` - cas complexe

La classe `DecimalFormat` du package `java.text` permet de mettre en forme des nombres.

- `"0.00"`: toujours deux décimale
- `"0.###"`: jusqu'a trois décimale, les zéro superflues ne sont pas affichées
- `"#,##0.00"`: ajout des séparateur de milliers -> ex: `1,234.56`

```java
import java.text.DecimalFormat;

double value = 3.14159;

// on passe le formatage attendu dans l'instanciation de la classe
DecimalFormat df = new DecimalFormat("0.00");
System.out.println(df.format(value)); // 3.14

// exemple avec séparateur de millier
DecimalFormat df = new DecimalFormat("#,##0.00");
System.out.println(df.format(1234567.89)); // 1,234,567.89

// sans zéro superflus 
DecimalFormat df = new DecimalFormat("0.##");
System.out.println(df.format(3.1));   // 3.1
System.out.println(df.format(3.141)); // 3.14
System.out.println(df.format(3.145)); // 3.15
```

##### `String.format()` - cas simple

Méthode pour des cas simple. 

```java
double value = 3.14159;
System.out.println(String.format("%.2f", value)); // 3.14
```

- `%.2f`: affiche un nombre avec deux décimales

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

**Conversion implicite**

Java convertit lui même une valeur d'un type vers une autre si c'est sur et sans perte de données

Cela se produit lorsque l'on affecte une valeur d'un type plus petit à une variable d'un type plus grand. Par exemplt `int` -> `double`.

```java
// int -> double 
int apples = 5;
double applesWeight = apples; // int devient automatiquement double

System.out.println(applesWeight); // 5.0

// char -> int 
char letter = 'A';
int code = letter; // 'A' devient 65 (code du caractère dans Unicode)

System.out.println(code); // 65
```

**Conversion explicite**

La conversion explicite est requise lorsque l'on souhaite convertir une valeur d'un type plus grand vers plus petit, ou entre des types incompatible.

#### `double` -> `int`

Il n'y a pas d'arrondi, la partie décimale est perdue

```java
double price = 12.99;
int roundedPrice = (int) price; // la partie fractionnaire est simplement tronquée !

System.out.println(roundedPrice); // 12
```

#### `int` -> `double`

```java
int count = 10;
double avg = count; // élargissement implicite

System.out.println(avg); // 10.0
```

#### `int` -> `char`

```java
int code = 66;
char letter = (char) code; // 66 — c’est le caractère 'B'

System.out.println(letter); // B
```

#### `char` -> `int`

```java
char ch = '\u0416';
int code = ch;

System.out.println(code); // 1046
```

#### `double` -> `float`

```java
double d = 3.1415926535;
float f = (float) d; // une partie de la précision est perdue

System.out.println(f); // 3.1415927 (moins de chiffres après la virgule)
```

#### `int` -> `String` - `Integer.toString()`

```java
int x = 123;
String s = Integer.toString(x);
// ou tout simplement: String s = "" + x;
```

#### `String` -> `int` - `Integer.parseInt()`

```java
String s = "456";
int x = Integer.parseInt(s);
```

#### `Nombre` -> chaine - `String.valueOf()`

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

#### Conversion `double` et `int`

```java
int i = 2;
double d = i; // Tout va bien !
System.out.println(d); // 2

double dd = 3.7;
int ii = (int) dd; // Il faut convertir explicitement le type double en type int !
System.out.println(ii); // 3, la partie fractionnaire a été tronquée
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

---

## Tableau 

Les tableaux sont des objets spéciaux dans lesquels ont peux venir y stocker plusieurs valeurs.

La taille du tableau ne peut pas être modifiées après sa création.

Tous les éléments du tableaux doivent avoir le même type.

Lors de la création du tableau, deux blocs de mémoire sont allouées: l'un stocke le tableau, et l'autre pour la variable qui stocke son adrese.

La valeur initiale des cellules est `0`, `null` si la cellule stocke une adresse, `false` pour un boolean

### Déclaration d'un tableau

```java
// création d'un array
int[] array = new int[100];
```

- `int[]`: type -> tableau d'int 
- `array`: nom 
- `new int[100]`: créer un tableau de 100 élément de type `int`

### Manipulation

```java
// création du tableau
int[] a = new int[10];
// affectation d'une valeur
a[2] = 4;				// Nous écrivons la valeur 4 dans la cellule d’indice 2.
// accés au valeur du tableau
a[9] = a[2] + a[5];		// Nous écrivons dans la cellule d’indice 9 la somme des valeurs stockées dans les cellules 2
                        // (4) et 5 (0).
```

### `length` - longueur d'un tableau 

Un tableau possède une propriété spéciale `length` qui permet d'obtenir la longueur du tableau.

```java
// syntaxe
int[] array = new int[100];
array.length;

// itérer sur un tableau 
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

### `null`

`null` est une référence vide. Lorsqu'une variable de type objet est crée, sa valeur initiale est `null`: une référence vers rien.

Seule les types primitifs ont une valeurs par défaut.

```java
String name; 	// name contient null
name = "Alex";  // name contient une référence vers l'objet/chaîne "Alex"
name = null; 	// name contient null
```

Il est impossible d'appeler des méthodes sur un objet si sa référence est `null`, l'objet n'existe pas.

```java
int[] numbers = new int[10];		// {0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
String[] strings = new String[10];  // {null, null, null, null, null, null, null, null, null, null}
User[] users = new User[10];		// {null, null, null, null, null, null, null, null, null, null}
```

### Initialisation rapide de tableau 

Le compilateur peut déterminer le type du conteneur à partir du type de la variable-tableau.

```java
// syntaxe longue
int[] months = new int[12];
months[0] = 31; // janvier
months[1] = 28; // février
months[2] = 31; // mars
months[3] = 30; // avril
months[4] = 31; // mai
months[5] = 30; // juin
months[6] = 31; // juillet
months[7] = 31; // août
months[8] = 30; // septembre
months[9] = 31; // octobre
months[10] = 30; // novembre
months[11] = 31; // décembre

// initialisation rapide 
int[] months = new int[] { 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 };

// initialisation encore plus rapide 
int[] months = { 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 };

String[] months = { "Janvier", "Février", "Mars", "Avril", "Mai", "Juin", "Juillet", "Août", "Septembre", "Octobre", "Novembre", "Décembre" };
```

### Boucle `for-each` - parcourir un tableau 

```java
// itérer sur les éléments du tableau -> contient une copie des éléments
int sum = 0;
for (int score : scores)
{
    sum += score;
}
System.out.println("Somme de tous les points: " + sum);

// iterer avec index -> permet de modifier les éléments
// exemple: augmenter toutes les valeurs de 1
for (int i = 0; i < grades.length; i++) {
    grades[i] = grades[i] + 1;
}
```

#### Pattern

**Somme des éléments du tableau**

```java
int sum = 0;
for (int i = 0; i < grades.length; i++) {
    sum += grades[i]; // équivaut à sum = sum + grades[i];
}
System.out.println("Somme des notes: " + sum);
```

**Recherche de la valeur maximal**

```java
int max = grades[0]; // commençons par le premier élément
for (int i = 1; i < grades.length; i++) {
    if (grades[i] > max) {
        max = grades[i];
    }
}
System.out.println("Note maximale: " + max);
```

**Recherche de la valeur minimale**

```java
int min = grades[0]; // commençons par le premier élément
for (int i = 1; i < grades.length; i++) {
    if (grades[i] < min) {
        min = grades[i];
    }
}
System.out.println("Note minimale: " + min);
```

**Calcul de la moyenne**

```java
int sum = 0;
for (int i = 0; i < grades.length; i++) {
    sum += grades[i];
}
// pour obtenir un nombre décimal pour la moyenne
double average = (double) sum / grades.length; // il faut absolument convertir en double !
System.out.println("Note moyenne: " + average);
```

**Saisie d'un tableau au clavier**

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

**Affichage du tableau en sens inverse**

```java
for (int i = grades.length - 1; i >= 0; i--) {
    System.out.println("Note n°" + (i + 1) + ": " + grades[i]);
}
```

### Tableau à deux dimensions 

```java
// déclaration 
int[][] matrix;
double[][] gradesTable;
string[][] chessBoard;

// création d'un tableau 
matrix = new int[3][4]; // 3 lignes, 4 colonnes

// déclaration et création 
int[][] matrix = new int[3][4];

// déclaration, création et initialisation 
int[][] example = {
    {1, 2, 3},
    {4, 5, 6},
    {7, 8, 9}
};

// accès aux valeur 
// le premier index correspond à la ligne 
// le second la colonne 
// Deuxième ligne (indice 1), troisième colonne (indice 2)
matrix[1][2] = 99;

// écriture et lecture 
int[][] data = new int[5][2];
data[1][1] = 5;         // écriture
int value = data[1][1]; // lecture

// remplir un tableau à deux dimensions 
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

// échange de ligne 
int[][] data = new int[2][5];
int[] row1 = data[0]; // stocke la première ligne
int[] row2 = data[1]; // stocket la seconde ligne 

// Matrice importante avec des données
int[][] matrix = {
  {1, 2, 3, 4, 5},
  {5, 4, 3, 2, 1}
};

int[] tmp = matrix[0];
matrix[0] = matrix[1];
matrix[1] = tmp;

// affichage du tableau a deux dimensions 
// boucle externe
for (int row = 0; row < matrix.length; row++)
{
    // boucle interne
    for (int col = 0; col < matrix[row].length; col++)
    {
        System.out.print(matrix[row][col] + "\t");
    }
    System.out.println(); // saut de ligne
}
```

### Tableaux irréguliers (Jagged Arrays)

Tableaux qui permetent d'avoir des lignes de longueurs différente. 

```java
//syntaxe 
// création du tableau principal
int[][] jaggedArray = new int[3][]; // tableau de trois lignes

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

// syntaxe courte 
int[][] jaggedArray = new int[][]
{
    new int[] { 1, 2 },
    new int[] { 3, 4, 5, 6 },
    new int[] { 7, 8, 9 }
};

// syntaxe très courte
int[][] jaggedArray =
{
    { 1, 2 },
    { 3, 4, 5, 6 },
    { 7, 8, 9 }
};

// parcourir le tableau 
for (int i = 0; i < jaggedArray.length; i++)
{
    System.out.println("Ligne " + i + ":");
    for (int j = 0; j < jaggedArray[i].length; j++)
    {
        System.out.print(jaggedArray[i][j] + " ");
    }
    System.out.println();
}

// parcourir avec for-each 
for (int[] row : jaggedArray)
{
    for (int value : row)
    {
        System.out.print(value + " ");
    }
    System.out.println();
}
```

### Tableau multi-dimension 

```java
// le nombre de crochets indique le nombre de dimensions
int[][][] cube = new int[2][3][4]; // 2 couches, 3 lignes, 4 colonnes
cube[0][1][2] = 99;

// parcourir le tableau 
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

### Classe `Array` 

Cette classe fournis un ensemble de méthode statique permettant de travailler avec des tableaux.

Pour importer ces méthodes 

```java
import java.util.Arrays;
```

#### `Arrays.sort()` - triage 

La méthode trie "en place". Elle modifie le tableau d'origine et ne retourne pas de nouveau tableau.
Pour conserver l'ordre initial, il faut créer une copie avant le triage.

```java
// syntaxe
Arrays.sort(array);
Arrays.sort(array, startIndex, endIndex);

// trie tableau d'entier
int[] scores = {5, 2, 9, 1, 7};
Arrays.sort(scores); // Tri croissant

System.out.println("Tableau trié: " + Arrays.toString(scores));
// Affichera: [1, 2, 5, 7, 9]

// trie tableau de String 
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

#### `Arrays.fill()` - remplissage 

La méthode permet de remplir le tableau avec la même valeur 

```java
//syntaxe
Arrays.fill(array, value);
Arrays.fill(array, startIndex, endIndex, value);

int[] marks = new int[5];
Arrays.fill(marks, 3); // Tous les éléments valent désormais 3
System.out.println(Arrays.toString(marks)); // [3, 3, 3, 3, 3]

// remplir une partie de tableau 
int[] arr = new int[10];
Arrays.fill(arr, 2, 5, 7); // Remplit les éléments d’indice 2 à 4 inclus (5 exclu)
System.out.println(Arrays.toString(arr));
// [0, 0, 7, 7, 7, 0, 0, 0, 0, 0]

// remplir un tableau de String 
String[] guests = new String[4];
Arrays.fill(guests, "Vide");
System.out.println(Arrays.toString(guests)); // [Vide, Vide, Vide, Vide]
```

#### `Arrays.copyOf()` - copie 

Créer un nouveau tableau et copie les éléments depuis l'original. Si la nouvelle longueur est supérieur à l'originale, la queue est remplie par des valeurs par défaut.

```java
// syntaxe
Arrays.copyOf(originalArray, newLength);

int[] original = {1, 2, 3};
int[] copy = Arrays.copyOf(original, 5);
System.out.println(Arrays.toString(copy)); // [1, 2, 3, 0, 0]

// réduction de tableau 
int[] shortCopy = Arrays.copyOf(original, 2);
System.out.println(Arrays.toString(shortCopy)); // [1, 2]
```

#### `Arrays.copyOfRange()` 

```java
// syntaxe
Arrays.copyOfRange(originalArray, startIndex, endIndex);

int[] arr = {10, 20, 30, 40, 50};
int[] mid = Arrays.copyOfRange(arr, 1, 4); // Copiera les éléments d’indice 1 à 3
System.out.println(Arrays.toString(mid)); // [20, 30, 40]
```

#### `Arrays.equels()` | `Arrays.deepEquals - comparaison 

Pour comparer deux tableaux, il faut utiliser l'une des deux méthodes

```java
// syntaxe
Arrays.equals(array1, array2);
Arrays.deepEquals(matrix1, matrix2);

// tableau unidimensionnels
int[] a = {1, 2, 3};
int[] b = {1, 2, 3};
System.out.println(Arrays.equals(a, b));

// tableau dimension multiple 
int[][] matrix1 = {{1, 2}, {3, 4}};
int[][] matrix2 = {{1, 2}, {3, 4}};

System.out.println(Arrays.equals(matrix1, matrix2));     // false!
System.out.println(Arrays.deepEquals(matrix1, matrix2)); // true
```

#### `Arrays.toString()` | `Arrays.deepToString()` - affichage

L'affichage direct d'un tableau donne une chaîne illisible.

```java
// syntaxe
Arrays.toString(array);
Arrays.deepToString(matrix);

// tableau simple
int[] arr = {1, 2, 3};
System.out.println(Arrays.toString(arr)); // [1, 2, 3]

// tableau multidimension
int[][] matrix = {{1, 2}, {3, 4}};
System.out.println(Arrays.deepToString(matrix)); // [[1, 2], [3, 4]]
```

---

