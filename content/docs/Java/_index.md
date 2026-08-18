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

### `var` - inférence de type 

Java fournis `var` qui vient faire une inférence de type, et d'éviter de dèfinir le type à la main.

Il fonctionne uniquement pour des variables locales, dans une méthode.

```java
var age = 23;            // le compilateur déterminera le type du nombre 23 et substituera int age
var name = "Anna";       // le compilateur déterminera le type de "Anna" et substituera String name
var price = 99.99;       // le compilateur déterminera le type de 99.99 et substituera double price

// tableau
var numbers = new int[] { 1, 2, 3, 4 };

// méthode
var input = console.nextLine(); // input est une String (la méthode retourne String)
```

---

## `final` - Constante 

Le mot clé `final` permet de déclarer une constante. Celle ci ne peut plus être modifier après son initialisaiton.

Par convention, le nom est en majuscule.

```java
final int DAYS_IN_WEEK = 7;
final double PI = 3.1415926535;
final String GREETING = "Salut, Java!";
```

### `static final` - constante de classe

- `static`: la variable appartient à la classe -> une seule pour toutes
- `final`: la valeur ne peut plus être modifier -> constante

Elles sont déclaré en début de classe, avant les méthodes 

```java
public class MathUtils
{
    public static final double PI = 3.1415926535;

    public static double circleLength(double radius)
    {
        return 2 * PI * radius;
    }
}

// utilisation 
double len = MathUtils.circleLength(5);
System.out.println(len); // 31.4159...

//exemple
public class User
{
    // constante de l'objet
    public final String name;
    // constante de la classe                      // Chaque User a son propre nom (final)
    public static final String COMPANY = "CodeGym"; // Une entreprise commune à tous (static final)

    public User(String name)
    {
        this.name = name;
    }
}

User u1 = new User("John");
User u2 = new User("Peter");

System.out.println(u1.name);      // John
System.out.println(u2.name);      // Peter
System.out.println(User.COMPANY); // CodeGym
```

---

## Enum

Une énumération est un type de donnée spéciale qui permet de déclarer un ensemble de constantes nommées.

Les enums appoortent ces avantages:
- sécurité des types
- lisibilité
- facilité de maintenance 
- fonctionne avec switch 
- extensible
- réduit les erreurs

Les enums sont déclarer:
- dans un fichier séparé, par exemple `DayOfWeek.java`
- dans une classe si besoin d'une énumération privée uniquement pour cete classe
- dans une méthode

```java
// Modèle générique de déclaration d’une énumération
public enum Name
{
    CONSTANT1 ,
    CONSTANT2 ,
    CONSTANT3
}

// déclaration 
// Fichier DayOfWeek.java
public enum DayOfWeek {
    MONDAY,			// 0
    TUESDAY,		// 1
    WEDNESDAY,		// 2
    THURSDAY,		// 3
    FRIDAY,			// 4
    SATURDAY,		// 5
    SUNDAY			// 6
}

// déclaration d'une variable enum 
// today ne peut prendre que l'une des valeurs déclarée dans l'enum DayOfWeek
DayOfWeek today = DayOfWeek.MONDAY;

// utilisation dans un switch 
// dans les case, on écrit le nom de la constante
switch (today)
{
    case MONDAY:
        System.out.println("Ouh, lundi...");
        break;
    case FRIDAY:
        System.out.println("Youpi, vendredi !");
        break;
    default:
        System.out.println("Un jour ordinaire.");
}

// itération sur les valeurs de l'enum 
// chaque enum possède une méthode statique values() qui retourne un tableau de toutes ces valeurs
for (DayOfWeek day : DayOfWeek.values())
{
    System.out.println(day);
}

// exemple dans le code =====================================
public enum DayOfWeek
{
    MONDAY, TUESDAY, WEDNESDAY, THURSDAY, FRIDAY, SATURDAY, SUNDAY
}

System.out.println("Saisissez le jour de la semaine (par exemple, MONDAY) :");
Scanner console = new Scanner(System.in);
// l'utilisateur saisit un jour de la semaine et convertis en majuscule
String input = console.nextLine().toUpperCase();
// conversion en valeur d'enum
DayOfWeek day = DayOfWeek.valueOf(input);
// evaluation de la variable pour afficher le bon message
switch (day)
{
    case MONDAY:
        System.out.println("Début de la semaine de travail !");
        break;
    case FRIDAY:
        System.out.println("Bientôt le week-end !");
        break;
    case SATURDAY:
    case SUNDAY:
        System.out.println("Youpi, c’est le week-end !");
        break;
    default:
        System.out.println("Journée de travail ordinaire.");
}
```

- `enum`: indique au compilateur une déclaration d'enum 

On viens déclarer entre les `{}` les noms des variantes (constante) séparé par des virgules.

### Méthode d'enum

#### `name()` - retourne le nom de la constante

Retourne le nom de la constante sous forme de chaîne, tel qu'il est écrit dans le code

```java
DayOfWeek day = DayOfWeek.FRIDAY;
System.out.println(day.name()); // "FRIDAY"
```

#### `ordinal()` - retourne l'indice 

Retourne l'indice ordinal de la constante (à partir de zéro)

```java
System.out.println(DayOfWeek.MONDAY.ordinal()); // 0
System.out.println(DayOfWeek.FRIDAY.ordinal()); // 4
```

#### `valueOf()` 

Convertit une chaîne en valeur d'énumération si une telle constante existe 

```java
DayOfWeek day = DayOfWeek.valueOf("MONDAY");
System.out.println(day); // MONDAY
```

#### `values()`

Retourne le tableau de toutes les valeurs de l'énumération 

```java
DayOfWeek[] days = DayOfWeek.values();
```

### Champs, constructeur et méthodes

On peut ajouter des champs, des constructeurs et des méthodes.

```java
public enum DayOfWeek
{
    MONDAY("Lundi"),
    TUESDAY("Mardi"),
    WEDNESDAY("Mercredi"),
    THURSDAY("Jeudi"),
    FRIDAY("Vendredi"),
    SATURDAY("Samedi"),
    SUNDAY("Dimanche");

    private final String russianName;

    // Constructeur (private par défaut)
    DayOfWeek(String russianName)
    {
        this.russianName = russianName;
    }

    public String getRussianName()
    {
        return russianName;
    }
}

// utilisation 
DayOfWeek day = DayOfWeek.WEDNESDAY;
System.out.println(day.getRussianName()); // "Mercredi"
```

Chaque valeur d'un enum peut porter ses propres données, dans ce cas, un nom localisé





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

#### Chaîne multi-ligne  - Text Blocks

Permet de créer du texte multi-ligne sans échappements, en conserveant la mise en forme. Idéale pour le JSON, SQL et HTML

```java
// Littéral multiligne (Text Block)
String json = """
    {
        "name": "Alice",
        "age": 30,
        "skills": ["Java", "SQL", "Cloud"]
    }
    """;
```

#### Concaténation manuel

La concaténation permet d'assembler des string.

```java
void main()
{
  String name = "Anya";                // name contient la chaîne Anya
  String city = "New York";           // city contient la chaîne New York
  String message = "Hello!" + city + name + city; // message contient la chaîne Hello!New YorkAnyaNew York
}

```

#### `String.format()` - mise en forme avancée

`String.format()` permet de créer une chaîne à partir d'un modèle, et d'insérer des valeurs à des positions données.

```java
// syntaxe
String result = String.format("Modèle", values);
```

- `%s`: string 
- `%d`: entier 
- `%f`: float
- `%n`: saut de ligne

```java
String name = "Oleg";
int age = 25;
double balance = 12345.6789;

String info = String.format("Nom : %s, âge : %d, solde : %.2f euros.", name, age, balance);
System.out.println(info);
// Affichera : Nom : Oleg, âge : 25, solde : 12345.68 euros.

String result = String.format("Nom : %s, âge : %d, solde : %.2f euros", name, age, balance);
// %s — chaîne, %d — entier, %.2f — nombre avec 2 décimales

// nombre à virgule avec précision fixe 
double price = 99.999;
System.out.println(String.format("Prix : %.2f euros.", price)); // Prix : 100.00 euros.

// largeur de champ et alignement 
// [5d] -> largueur de champ 5 aligné à droite par defaut
// [-5d] -> largeur de champ de 5, aligné à gauche
int n = 7;
System.out.println(String.format("Nombre : [%5d]", n));   // Nombre : [    7]
System.out.println(String.format("Nombre : [%-5d]", n));  // Nombre : [7    ]

// pourcentage
double percent = 0.125;
System.out.println(String.format("Terminé : %.1f%%", percent * 100)); // Terminé : 12.5%
```

#### Mise en forme des dates

```java
import java.util.Date;
Date now = new Date();
System.out.println(String.format("Aujourd’hui : %tD", now)); // Aujourd’hui : 06/18/24
System.out.println(String.format("Heure : %tT", now));       // Heure : 15:42:07
```

#### Localisation et séparateur 

Par défaut, la locale du système est utilisée. Pour passer une locale 

```java
import java.util.Locale;
double price = 1234.56;
System.out.println(String.format(Locale.FRANCE, "%.2f", price)); // 1234,56
```

#### Echappement de caractères

```java
System.out.println("Bonjour, \"Utilisateur\"!");
// Sortie: Bonjour, "Utilisateur"!

System.out.println("C:\\Program Files\\MyApp");
// Sortie: C:\Program Files\MyApp

System.out.println("Ligne 1\nLigne 2");
// Sortie:
// Ligne 1
// Ligne 2

System.out.println("J'aime\tla\ttabulation!");
// Sortie:
// J'aime         la    tabulation!
```

- `\n`: saut de ligne
- `\t`: tabulation
- `\\`: \
- `\"`: "
- `\'`: '
- `\r`: retour chariot
- `\0`: caractère null
- `\b` : retour arriere

#### Méthode de String

Chacune de ses méthodes retourne une nouvelle chaîne sans modifier l'original

##### `length()` - nombre de caractères d'une chaîne

Retourne le nombre de caractère d'une chaîne.

```java
String name = "Vasilisa";
int length = name.length();
System.out.println("Nombre de lettres dans le prénom : " + length); // 8

// vérification d'une chaîne vide
String input = "";
if (input.length() == 0)
{
    System.out.println("La chaîne est vide !");
}

// vérification de mot de passe
String password = "qwerty";
if (password.length() < 8)
{
    System.out.println("Le mot de passe est trop court !");
}
else
{
    System.out.println("Le mot de passe est valide.");
}
```

##### `substring()` - extraire une partie de chaîne

- `str.substring(startIndex)`: à partir de la position `startIndex` jusqu'a la fin de la chaîne 
- `str.substring(startIndex, endIndex)`: à partir de `startIndex` jusqu'a `endIndex` non inclut

```java
// trois premiere lettre
tring name = "Vasilisa";
String firstThree = name.substring(0, 3); // "Vas"
System.out.println(firstThree);

// obtenir l'extension du fichier
String fileName = "document.pdf";
int dotIndex = fileName.indexOf(".");
String extension = fileName.substring(dotIndex + 1); // "pdf"
System.out.println(extension);

// 4 derniere caracteres
String cardNumber = "1234567890123456";
String lastFour = cardNumber.substring(cardNumber.length() - 4); // "3456"
System.out.println("Les 4 derniers chiffres : " + lastFour);
```

##### `indexOf()` - recherche de caractère ou sous chaîne 

Recherche la position de la première occurence d'un caractère ou d'une sous-chaîne donné

- si non trouvé, retourne `-1`
- si trouvé, retourne l'index

```java
// premier point d'un email 
String email = "ivan.petrov@mail.com";
int dotIndex = email.indexOf('.');
System.out.println("Premier point à la position : " + dotIndex); // 4

// trouver une sous chaîne
String text = "J’adore Java !";
int index = text.indexOf("Java");
System.out.println(index); // 8

// trouver un caractère après une position donnée
String s = "abracadabra";
int firstA = s.indexOf('a'); // 0
int secondA = s.indexOf('a', firstA + 1); // 3
System.out.println("La deuxième 'a' à la position : " + secondA);
```

##### `lastIndexOf()` - trouver la dernière occurence

```java
// recherche extension de fichier 
String fileName = "report.final.version.docx";
int lastDot = fileName.lastIndexOf('.');
String extension = fileName.substring(lastDot + 1);
System.out.println("Extension du fichier : " + extension); // "docx"
```

##### `charAt()` - obtenir un charactère par indice 

Retourne le caractère à son indice. Retourne une valeur de type `char`

```java
//vérifier la premère lettre d'une chaîne 
String city = "Minsk";
char first = city.charAt(0); // 'M'
System.out.println("Première lettre : " + first);

// vérifier si la chaîne commence par une majuscule
String word = "Java";
if (Character.isUpperCase(word.charAt(0)))
{
    System.out.println("Le mot commence par une majuscule !");
}

// parcourir tous les caractères d'une chaîne
String text = "Bonjour";
for (int i = 0; i < text.length(); i++)
{
    System.out.println("Caractère #" + i + ": " + text.charAt(i));
}
```

##### `toCharArray()` - conversion d'une chaîne en array

Permet de transformer une chaîne en tableau de caractèrees. Utile pour du traitement caractère par caractère, trie, vérification

```java
String text = "Hello";
char[] characters = text.toCharArray();

for (char c : characters)
{
    System.out.println(c);
}
// Sortie:
// H
// e
// l
// l
// o
```

##### `replace()` - remplacer une sous-chaîne

Remplace toutes les occurences `target` par `replacement`. Elle retourne une nouvelle chaîne, l'originale ne change pas.

```java
replace(CharSequence target, CharSequence replacement)

String sentence = "J’aime la programmation en Java.";
String newSentence = sentence.replace("Java", "Java 25");
System.out.println(newSentence);
// Sortie: J’aime la programmation en Java 25.

String email = "support@company.com";
String cleanEmail = email.replace("@", "[at]");
System.out.println(cleanEmail);
// Sortie: support[at]company.com
```

##### `trim()` | `trip()` - suppression des espaces superflus 

- `trim()`: supprime les espaces, tabulations, retour à la ligne
- `strip()`: méthode moderne, prends en compte tous les types d'espaces. A privilieger

```java
String s1 = "   Bonjour, monde !   ";
System.out.println(s1.trim());
// Sortie: "Bonjour, monde !"

String s2 = " \u2005  Java 11  \u2005 "; // \u2005 — est un espace Unicode
System.out.println("trim(): " + s2.trim());
System.out.println("strip(): " + s2.strip());
// Sortie:
// trim():  Java 11
// strip(): Java 11
```

##### `toUpperCase()` | `toLowerCase()` - majusucle et minuscule 

```java
  String original = "Bonjour";
  System.out.println(original.toUpperCase()); // BONJOUR
  System.out.println(original.toLowerCase()); // bonjour
```

#### Comparaison de chaîne 

##### `equals()` - comparaison de chaîne 

```java
String s1 = "Java";
String s2 = new String("Java");
System.out.println(s1.equals(s2)); // true

// comparaison de mot de passe
String inputPassword = "Secret123";
String realPassword = "Secret123";
if (inputPassword.equals(realPassword))
{
    System.out.println("Accès autorisé !");
}
else
{
    System.out.println("Mot de passe incorrect.");
}
```

##### `equalsIgnoreCase()` - comparaison sans casse

```java
String name1 = "Ivan";
String name2 = "ivan";
System.out.println(name1.equalsIgnoreCase(name2)); // true

// comparaison email 
String email1 = "User@Example.com";
String email2 = "user@example.com";
if (email1.equalsIgnoreCase(email2))
{
    System.out.println("Les adresses e-mail correspondent !");
}
```

##### `compareTo()` - comparaison lexicographique 

Effectue une comparaison lexicographique (ordre du dictionnaire). Retourne un nombre négatif si la premiere chaine est plus petite, 0 egales, et positif si plus grande 

```java
System.out.println("apple".compareTo("banana")); // < 0
System.out.println("apple".compareTo("apple"));  // 0
System.out.println("banana".compareTo("apple")); // > 0

System.out.println("cat".compareTo("catalog")); // < 0 ("cat" est plus courte)
System.out.println("catalog".compareTo("cat")); // > 0

// trier un tableau de chaîne 
String[] fruits = {"banana", "apple", "pear"};
Arrays.sort(fruits); // compareTo() est utilisé en interne
System.out.println(Arrays.toString(fruits)); // [apple, banana, pear]

// compareToIgnoreCase()
System.out.println("Java".compareToIgnoreCase("java")); // 0
```

##### `startsWith()` | `endsWith()` - vèrifier debut ou fin d'une chaîne 

Vérifient le début ou la fin d'une chaîne en retournant `true` ou `false`

```java
String fileName = "document.pdf";
String url = "https://www.google.com";

System.out.println(fileName.startsWith("doc"));  // true
System.out.println(fileName.endsWith(".txt"));   // false
System.out.println(url.startsWith("https://"));  // true
```

##### `contains()` - recherche de sous chaîne

Permet de vérifier la présence d'une sous chaîne. Sensible à la casse

```java
String text = "Bienvenue dans le monde de Java !";
System.out.println(text.contains("monde"));   // true
System.out.println(text.contains("C++"));   // false
```

##### `split()` - découpage de chaîne 

Permet de découper une chaîne selon un séparateur et retourne un tableau `String[]`

```java
// dècoupage par virgule
String names = "Alex,Maria,Ivan,Elena";
String[] nameArray = names.split(",");
for (String name : nameArray)
{
    System.out.println(name.trim()); // trim() supprime d’éventuels espaces
}
// Sortie:
// Alex
// Maria
// Ivan
// Elena

// découpage par espace
String sentence = "J'étudie Java";
String[] words = sentence.split(" ");
for (String word : words)
{
    System.out.println(word);
}
// Sortie:
// J'étudie
// Java
```

#### Construiction de chaîne

##### `StringBuilder` - construction de chaîne rapide

La classe `StringBuilder` du package `java.lang` est un outil permettant d'assembler et modifier efficacement des chaîne. Elle est mutable: on peut ajouter, supprimer et insérer des caractères et sous chaîne sans créer de nouvel objet à chaque opération.

Méthodes principales 
- `append()`: ajout à la fin de la chaîne
- `insert(index, ...)`: insère à partir de l'index passer
- `delete(start, end)`: supprime de start a end exclus
- `replace(start, end, str)`: remplace une partie de la chaîne
- `reverse()`: inverse la chaîne
- `toString()`: convertis en chaîne classique
- `setLength(newLen)`: raccourcis ou complete la chaine à la longueur definis
- `toString()`: permet de transformer en string

```java
// création 
StringBuilder sb = new StringBuilder(); // vide
StringBuilder sb2 = new StringBuilder("Valeur initiale");

// utilisation 
StringBuilder sb = new StringBuilder();
sb.append("Bonjour, ");
sb.append("monde!");
System.out.println(sb); // Bonjour, monde!

sb.insert(9, "Java "); // inserons "Java " après "Bonjour, "
System.out.println(sb); // Bonjour, Java monde!

sb.replace(9, 13, "autre"); // remplaçons "Java" par "autre"
System.out.println(sb); // Bonjour, autre monde!

sb.reverse();
System.out.println(sb); // !ednom ertua ,ruojnoB

sb.toString() // transformation en String

// comparaison 
if (sb1.toString().equals(sb2.toString()))
{
    // le contenu est identique
}
```

Dans certains scénario, l'utilisation de la classe est adaptée que `String`:
- Modifications fréquentes d'une chaîne (ajout, supression) dans une boucle ou lors de l'assemblage de gros textes
- Assemblage de chaîne depuis un tableau/d'une liste (CSV, HTML, rapport)
- Anayse et traitement de texte avec un grand nombre d'opération sur la chaîne

```java
// assembler une chaîne depuis un tableau 
String[] names = {"John", "Peter", "Maria"};
StringBuilder sb = new StringBuilder();

for (int i = 0; i < names.length; i++)
{
    sb.append(names[i]);
    if (i < names.length - 1)
    {
        sb.append(", ");
    }
}
System.out.println(sb.toString());
```

##### `StringBuffer` 

Ajoute une couche de sécurité pour le multithreading. Si plusieurs threads peuvent modifier la même chaîne, il faut utiliser cette classe.


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

### Classes enveloppes

Il est parfois nécessaire d'utiliser un primitif comme un objet. Dans ce cas, les classes enveloppes sont utilisée.

Ce sont des classes qui contiennent en leur seins la valeur d'un primitif et permettent de la manipuler comme un objet.
Par exemple, pour `int`, la classe `Integer`. Ces classes fournissent des méthodes comment `Integer.parseInt()`

```java
// Primitif
int a = 10;

// Objet enveloppe
Integer b = Integer.valueOf(10);
```

##### Boxing et unboxing 

Lorsque l'on créer manuellement un objet enveloppe, on prends un primitif et on l'encapsule dans un objet.

```java
int primitive = 42;
Integer wrapper = Integer.valueOf(primitive); // boxing
```

Pour récuperer la valeur primitif, on effectue un unboxing

```java
Integer wrapper = Integer.valueOf(42);
int primitive = wrapper.intValue(); // unboxing
```

Le compilateur est capable de réaliser ses opération automatiquement 

```java
int a = 10; // primitif
Integer b = a; // autoboxing
Integer c = Integer.valueOf(20);
int d = c; // unboxing
```

#### Comparaison 

Pour les comparaison, il est nécessaire d'utiliser `equals()`

```java
Integer x = 100;
Integer y = 100;
System.out.println(x.equals(y)); // true, comparaison par la valeur
```

#### Utilisation 

```java
// conversion d'une string en nombre
String text = "123";
int number = Integer.parseInt(text);
System.out.println(number); // 123

// vérification des valeurs particulière des nombres à virgule
double d = 1.0 / 0;
System.out.println(Double.isInfinite(d)); // true

double nan = 0.0 / 0.0;
System.out.println(Double.isNaN(nan)); // true

// char 
char ch = 'A';
Character wrapper = ch; // autoboxing

System.out.println(Character.isLetter(ch)); // true
System.out.println(Character.isDigit(ch));  // false
System.out.println(Character.toLowerCase(ch)); // 'a'

// boolean 
Boolean flag = null; // autorisé
flag = Boolean.TRUE; // constante spéciale

System.out.println(flag); // true

// conversion de chaîne en bool 
String s1 = "true";
String s2 = "false";
boolean b1 = Boolean.parseBoolean(s1);
boolean b2 = Boolean.parseBoolean(s2);

System.out.println(b1); // true
System.out.println(b2); // false
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

### Switch 

```java
switch (expression)
{
    case value1:
        // actions si expression == value1
        break;
    case value2:
        // actions si expression == value2
        break;
    ...
    default:
        // actions si aucune correspondance avec un case
        break;
}

// example 
import java.util.Scanner;

public class CoffeeShop
{
    public static void main(String[] args)
    {
        // récuération de la saisie
        Scanner console = new Scanner(System.in);

        System.out.println("Choisissez une boisson:");
        System.out.println("1 - Espresso");
        System.out.println("2 - Cappuccino");
        System.out.println("3 - Latte");
        
        // stockage du choix dans la variable
        int choice = console.nextInt();

        // le switch évalue le choix de l'user
        switch (choice)
        {
            case 1:
                System.out.println("Vous avez choisi un espresso.");
                break;
            case 2:
                System.out.println("Vous avez choisi un cappuccino.");
                break;
            case 3:
                System.out.println("Vous avez choisi un latte.");
                break;
            // si aucun choix ne match, ce case est exécuter 
            default:
                System.out.println("Cette boisson n’existe pas.");
                break;
        }
    }
}

// switch sur des chaîne => sensible à la casse
import java.util.Scanner;

public class CommandMenu
{
    public static void main(String[] args)
    {
        Scanner console = new Scanner(System.in);

        System.out.println("Saisissez une commande (start, stop, pause):");
        String command = console.nextLine();

        switch (command)
        {
            case "start":
                System.out.println("Démarrage du programme!");
                break;
            case "stop":
                System.out.println("Arrêt du programme.");
                break;
            case "pause":
                System.out.println("Pause.");
                break;
            default:
                System.out.println("Commande inconnue.");
                break;
        }
    }
}

// switch sur char
char grade = 'B';

switch (grade)
{
    case 'A':
        System.out.println("Excellent!");
        break;
    case 'B':
        System.out.println("Bien.");
        break;
    case 'C':
        System.out.println("Satisfaisant.");
        break;
    default:
        System.out.println("Essayez encore.");
        break;
}

// regroupement de case 
int month = 1;

switch (month)
{
    case 12:
    case 1:
    case 2:
        System.out.println("Hiver");
        break;
    case 3:
    case 4:
    case 5:
        System.out.println("Printemps");
        break;
    case 6:
    case 7:
    case 8:
        System.out.println("Été");
        break;
    case 9:
    case 10:
    case 11:
        System.out.println("Automne");
        break;
    default:
        System.out.println("Mois inconnu");
        break;
}
```

### Switch moderne 

Avec > Java 14, le switch est devenu une expression :
- Il peut désormais renvoyer une valeur 
- nouvelle syntaxe avec une `->`
- plusieurs `case` séparées par des virgules pour une logique identique
- le compilateur vérifie que tous les cas sont couvert

```java
// syntaxe
switch (value)
{
   case A, B -> result1;
   case C -> {
      // plusieurs actions
      yield result2;
   }
   default -> defaultResult;
}

// example de code 
// déclaration de l'enum
public enum DayOfWeek
{
    MONDAY, TUESDAY, WEDNESDAY, THURSDAY, FRIDAY, SATURDAY, SUNDAY
}

DayOfWeek day = DayOfWeek.MONDAY;

// variable qui récupère la valeur issue du switch
// après le ->, on indique le résultat stocker dans la variable message
// plusieurs case séparé par une virgule
String message = switch (day)
{
    case MONDAY, FRIDAY, SUNDAY -> "Semaine courte ou jour de repos !";
    case TUESDAY                -> "Le mardi — une journée difficile.";
    case WEDNESDAY, THURSDAY    -> "Milieu de semaine !";
    case SATURDAY               -> "Youpi, samedi !";
    // default est obligatoire si toutes les possibilités ne sont pas couvertes
    default                     -> "Jour plutôt étrange...";
};

System.out.println(message);

// exemple avec nombre
int code = 404;
String result = switch (code)
{
    case 200 -> "OK";
    case 400, 404 -> "Erreur côté client";
    case 500 -> "Erreur serveur";
    default -> "Code inconnu";
};
System.out.println(result);

// exemple avec chaîne
String command = "start";
String status = switch (command)
{
    case "start" -> "Démarrage !";
    case "stop" -> "Arrêt !";
    case "pause" -> "Pause...";
    default -> "Commande inconnue";
};
System.out.println(status);
```

#### Bloc `yield`

Pour exécuter plusieurs actions pour un même case, on peut utiliser un bloc avec `yield`.

Dans le bloc, il doit avoir obligatoirement un `yield` qui retourne une valeur pour ce case.

```java
int n = 7;
String parity = switch (n % 2)
{
    case 0 -> "Pair";
    case 1 ->
    {
        System.out.println("Nombre impair détecté : " + n);
        yield "Impair";
    }
    default -> "Quelque chose d'étrange";
};
System.out.println(parity);
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

## Méthode

### Classe

Dans un programme Java, chaque service est une classe. Une classe gère par exemple les utilisateus, une autres les calculs, une autre pour le travail avec les fichiers.

Exemple d'une structure typique d'un projet 
- `Main.java`: on y retrouve le point d'entrée du projet
- `User.java`: service où est stocker et traitées les données utilisateur
- `Calculator.java`: service des calculs 
- `FileHelper.java`: spécialiste des fichiers

```java
System.out.println("Bonjour à tous !");
```

- `System`: classe qui contient des méthodes pour travailler avec le system
- `out`: champ qui est un objet de la classe `PrintStream`
- `println`: méthode de la classe `PrintStream` qui affiche à l'écran 

Un programme minimal Java ressemble à ceci :

```java
class Program
{
    // syntaxe < 21
    public static void main(String[] args)
    {
        // Votre code ici
    }

    // syntaxe moderne 
    void main()
    {
        // code
    }
}
```

Il contient au minimum une classe, qui doit définir une méthode `main`

Une classe classique en Java ressemble à cela 

```java
public class MathUtils
{
    // Variables statiques (globales pour la classe)
    static final double PI = 3.14159;
    static int callCounter = 0;

    // Méthode statique : calcul de l’aire d’un cercle
    public static double circleArea(double radius)
    {
        callCounter++;
        return PI * radius * radius;
    }

    // Méthode statique : trouver le maximum de deux nombres
    public static int max(int a, int b)
    {
        callCounter++;
        return (a > b) ? a : b;
    }

    // Méthode statique : combien de fois les méthodes ont été appelées
    public static int getCallCount()
    {
        return callCounter;
    }

    // Accès aux champs et méthodes depuis la méthode main()
    public static void main(String[] args)
    {
        System.out.println("Aire du cercle : " + circleArea(5));
        System.out.println("Maximum : " + max(10, 42));
        System.out.println("Les méthodes ont été appelées " + getCallCount() + " fois");
    }
}
```

**Champs**
Ce sont des "variables" de la classe. Ils permettent à une classe de se souvenir de quelque chose entre les différents appels de méthodes.

**Méthodes**
Ce sont des fonctions de la classe. Elles permettent à la classe d'effectuer des actions.

**Modificateurs**
Permet de définir comment est accessible un champ ou une méthode
- `public`: visible de tous
- `private`: visible uniquement en interne de la classe

Les champs sont `private` et les méthode nécessaire sont passé en `public`

**Static**
Indique qu'un champ ou une méthode est rattacher à la classe. On peut les utiliser sans instancier la classe.

### Méthodes

Les méthodes sont déclaré dans une classe.

#### Déclaration 

```java
// déclaration d'une méthode
returnType methodName(parameters)
{
    // ici, on écrit des instructions
}

// méthode sans paramètre
void printHello()
{
    System.out.println("Bonjour, le monde !");
}

// méthode avec paramètres
void printName(String name)
{
    System.out.println("Bonjour, " + name + " !");
}

// méthodes avec plusieurs paramètres
void printSum(int a, int b)
{
    System.out.println("Somme : " + (a + b));
}
```

- `returnType`: ce que retourne la méthode. `void` si la méthode ne retourne rien
- `methodName`: le nom de la méthode
- `parameters`: variable accessible dans la méthode

#### Appel de méthode

```java
// appel de méthode 
public class MethodsDemo
{
    public static void main(String[] args)
    {
        // appel des méthodes de la classe
        printHello();
        printName("Bob");
        printSum(10, 20);
    }

    static void printHello()
    {
        System.out.println("Bonjour, le monde !");
    }

    static void printName(String name)
    {
        System.out.println("Bonjour, " + name + " !");
    }

    static void printSum(int a, int b)
    {
        System.out.println("Somme : " + (a + b));
    }
}
```

#### Return 

Permet de retourner une valeur d'une méthode. Le type du retour doit être indiquer à la déclaration de la méthode.

Lorsque la méthode atteint le `return`, elle stope son exécution, et renvoie la valeur indiquée et la transmet à l'endroit d'où elle à été appelée.

Le type de la valeur retouner doit correspondre au type déclarée de la méthode.

```java
int sum(int a, int b)
{
    return a + b;
}

// utilisation de la valeur retournée
int result = sum(5, 7); // on le stocke dans une variable
System.out.println(result); // on affiche le résultat

System.out.println(sum(10, 20)); // on affiche directement le résultat

if (isEven(42))
{
    System.out.println("Le nombre est pair!");
}

// utilisation dans un void 
void printPositive(int number)
{
    if (number <= 0)
    {
        System.out.println("Le nombre n'est pas positif!");
        return; // on sort simplement de la méthode
    }
    System.out.println("Nombre: " + number);
}
```

#### Passage de paramétre par valeur et par référence

- **par valeur**: la fonction reçoit une copie de la valeur de la variable. Si la fonction modifie la valeur, l'orginal de change pas (type primitif)
- **par référence**: la fonction reçoit une référence (pointeur) vers l'original. Les modifications dans la fonction se repercutent sur l'original (tableaux, objet)

```java
// type primitif
public class Demo
{
    public static void main(String[] args)
    {
        int number = 5;
        changeValue(number); // copie par valeur
        System.out.println(number); // 5
    }

    public static void changeValue(int n)
    {
        n = 42; // modification de la copie de la valeur
    }
}

// passage par référence
public class Demo
{
    public static void main(String[] args)
    {
        int[] numbers = {1, 2, 3};
        changeFirst(numbers);
        System.out.println(numbers[0]); // 99
    }

    public static void changeFirst(int[] arr)
    {
        arr[0] = 99; // passage par référence -> modif de l'original
    }
}
```

### Modificateur d'accès

- `public`: visible de tous
- `private`: visible uniquement en interne de la classe
- sans modificateur: interne au package

```java
public class User
{
    public String name;           // visible par tous
    private int age;              // visible uniquement à l'intérieur de la classe User

    public void sayHello()
    {
        System.out.println("Bonjour, je m'appelle " + name);
    }

    private void secretMethod()
    {
        System.out.println("C'est une méthode secrète !");
    }
}
```

### Portée des variables

La portée c'est la zone du code où une variable existe et peut être utilisée. 

- Variable locale: déclarée dans une fonction -> vit que dans la méthode/bloc ou elle est déclarée
- Paramètre de méthode: déclarer dans les parenthéses de la fonction -> dans une méthode
- Champs de classe: déclarée dans la classe -> dispo pour toutes les méthode de la classe

#### Shadowing

Le masquage est une situation où l'on viens déclarer une variable avec le méme nom qu'a l'exterieur. Dans ce bloc, la variable externe est masquer

```java
class ShadowDemo
{
    int value = 10; // champ de classe

    void printValue()
    {
        System.out.println(value);  // 10 — affiche le champ de classe
        int value = 5; // la variable locale masque le champ de classe
        System.out.println(value); // affiche 5, pas 10
    }
}

// acces au champ de classe statique
class ShadowDemo
{
    static int value = 10; // champ de classe statique

    void printValue()
    {
        System.out.println(value);      // 10 — champ de classe
        int value = 5;
        System.out.println(value);      // 5 — variable locale
        System.out.println(ShadowDemo.value); // 10 — champ de classe statique, accès via 'ShadowDemo'
    }
}

// acces champ de classe non statique 
class ShadowDemo
{
    int value = 10;

    void printValue()
    {
        System.out.println(value);      // 10 — champ de classe
        int value = 5;
        System.out.println(value);      // 5 — variable locale
        System.out.println(this.value); // 10 — champ de classe, accès via 'this'
    }
}
```

---

## Exceptions

Dans un programme, si on ne traite pas une exception, le programme se termine de manière anormale. Les exceptions ne sont pas des erreurs de compilation, mais des problémes qui apparaissent pendant l'exécution du programme.

`Exception` est un objet crée au moment où un problème survient pendant l'exécution du programme.

### `Errors`

Problémes fatals et irrécupérables dus à des défaillances de la JVM:
- `OutOfMemoryError`: mémoire épuisée
- `StackOverflowError`: débordement de pile

Il ne faut pas tenter de gérer ce type d'erreurs dans le programme.

### `Exceptions`

Ce sont les problèmes que le programme doit gérer. Elles surviennent à cause d'erreur de logique ou de facteur externe:
- `NullPointerException`: tentative d'utiliser un `null` comme un objet
- `ArrayIndexOutOfBoundsException`: dépassement des limites d'un tableau 
- `IOException`: erreur lors du travail avec des fichiers

En Java, il existe deux types d'exceptions:
- **Checked exceptions**: le compilateur exige qu'elle soient gérées
- **Unchecked exceptions**: le compilateur n'exige pas leur gestion

### `try` - `catch`

Le bloc `try` - `catch` permet d'attraper une exception et d'éviter le crash du programme en gérant proprement l'erreur.

```java
try
{
    // Code susceptible de lancer une exception
}
catch (ExceptionType variableName)
{
    // Code pour traiter l’exception
}
```