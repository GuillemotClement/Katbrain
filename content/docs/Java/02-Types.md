# Types 

## Nombres

| Type | Taille en octet | Cas d'utilisation |
| ---- | --------------- | ----------------- |
| `byte` | 1 | Utiliser en graphisme et la manipulation de fichier |
| `short` | 2 | Utilisé pour les données audio, composant de couleur |
| `int` | 4 | Type de base pour les entiers. |
| `long` | 8 | Utilsé pour les grandes valeurs |
| `float` | 4 | Utilisé en infographie ou pour traiter de gros volumes de données |
| `long` | 8 | Type par défaut pour les nombre à virgule |
| `BigInteger` | | Travail avec d'énorme nombres en cryptographie ou calculs astronomique |
| `BigDecimal` | | Classe pour des calculs exacts avec des nombres décimaux qui limite les perte de précision |

### Suffixes pour les nombres 

Il est parfois nécessaire d'indiquer de maniere explicite le type que l'on souhaite utiliser pour un nombre. 

- `L` ou `l`: `long` - `100000000L`
- `F` ou `f`: `float` - `3.14f`
- `D` ou `d`: `double` - généralement inutile car un nombre à virgule est par défaut un double.

L'utilisation des préfixes permet d'éviter des erreurs lors de l'affectation d'un grand nombre à une variable de type `long`:

```java 
long bigNumber = 9000000000L; // si on retire le L, il y aura une erreur de compilation
```

### Séparateur `_`

Lorsque les nombres sont longs, on peut utiliser des `_` pour améliorer la lisibilités.

```java 
int population = 146_700_000;
long stars = 100_000_000_000L;
```

### Arrondi des nombres 

#### `Math.round()` - arrondis à l'entier proche 

La méthode prends un nombre floattant et retourne l'entier le plus proche.

```java 
System.out.println(Math.round(2.3)); // 2
System.out.println(Math.round(2.7)); // 3
System.out.println(Math.round(2.5)); // 3
System.out.println(Math.round(-2.5)); // -2
```

Si on passe un `float`, retourne un `int`
Si on passe un `double`, retourne un `long`

```java 
float f = 5.8f;
int roundedF = Math.round(f); // 6

double d = 5.8;
long roundedD = Math.round(d); // 6

// forcer retour avec un `int`
int rounded = (int) Math.round(5.6); // 6
```

#### Arrondir à un nombre décimale

Il est souvent nécessaire d'arrondir à deux décimale par exemple.

**Astuce mathématique**

1. Multiplier par 100 
2. Arrondir l'entier 
3. Diviser par 100 

```java 
double value = 3.14159;
double rounded = Math.round(value * 100.0) / 100.0;
System.out.println(rounded); // 3.14
```

#### `Math.floor()` - arrondit vers le bas 

```java
System.out.println(Math.floor(2.7)); // 2.0
```

#### `Math.ceil()` - arrondit vers le haut 

```java
System.out.println(Math.ceil(2.1));  // 3.0
```

#### `Math.rint()` - arrondit entier proche avec un `double` de retourner

```java
System.out.println(Math.rint(2.5));  // 2.0 (oui, oui, ce n'est pas une faute de frappe!)
System.out.println(Math.rint(3.5));  // 4.0
```

### Mise en forme des nombres


#### `DecimalFormat`

La classe `DecimalFormat` du package `java.text` permet de mettre en forme un nombre.

```java 
// importation du package 
import java.text.DecimalFormat;

double value = 3.14159;

// création d'un objet 
DecimalFormat df = new DecimalFormat("0.00");
System.out.println(df.format(value)); // 3.14
```

| Modéle | Nombre | Résultat |
| ------ | ------ | -------- | 
| "0.00" | 2 | 2.00 |
| "0.00" | 2.5 | 2.50 |
| "0.00" | 2.567 | 2.56 |
| "0.##" | 2.567 | 2.567 | 
| "0.###" | 2.5 | 2.5 | 
| "#,##0.00" | 12345.678 | 12,345.68 |

**Exemple avec séparateur des milliers**

```java 
DecimalFormat df = new DecimalFormat("#,##0.00");
System.out.println(df.format(1234567.89)); // 1,234,567.89
```

**Exemple: affichage sans zéro superflus**

```java 
DecimalFormat df = new DecimalFormat("0.##");
System.out.println(df.format(3.1));   // 3.1
System.out.println(df.format(3.141)); // 3.14
System.out.println(df.format(3.145)); // 3.15
```

#### `String.format`

Pour des cas simple, il est utiliser `String.format`, c'est une façon intégrée de formater des chaînes, similaire à `printf` dans d'autre langage.

```java 
double value = 3.14159;
System.out.println(String.format("%.2f", value)); // 3.14
```














### `int` 

Permet de stocker des nombre entiers.

```java 
// ======================
// déclaration d'entier
// ======================
int a = 5;

int x = 5, b = 10, c = a + b;
```

### `double`

C'est le type par défaut pour les nombres à virgule.

```java 
// Déclarons une variable et lui affectons la valeur de pi
double pi = 3.1415926;

// On peut aussi déclarer sans initialisation
double averageSalary;
averageSalary = 91234.56;

// On peut calculer !
double pizzaPieces = 8;
double friends = 3;
double piecesPerFriend = pizzaPieces / friends; // 2.666... (et non 2)
```

### Valeurs spéciales de double 

#### `Infinity`

La division par 0 pour un `double` ne provoque pas d'exception. Le résultat devient alors une valeur spécial `Infinity`

```java 
double result = 1.0 / 0.0;
System.out.println(result); // Infinity
```

#### `-Infinity`

Si on divise un nombre négatif par 0, on obtient l'infini négative

```java 
double result = -1.0 / 0.0;
System.out.println(result); // -Infinity
```

#### `NaN`

Lorsque l'on vient réaliser une opération impossible, par exemple calculer la racine carré d'un nombre négatif, on obtient un `Not a Number`.

```java 
// ============================
// racine carré d'un négatif 
// ============================
double result = Math.sqrt(-1);
System.out.println(result); // NaN

// ===============================
// division 0.0 / 0.0 
// ===============================
double result = 0.0 / 0.0;
System.out.println(result); // NaN
```


---

## `char`

Le type `char` est utilisé pour stocker un seul caractères: lettre, chiffre, etc . La valeur est placer entre `'`.

Ce type contient un nombre 16 bits, où chaque valeur correspond à un seul caractères.

```java 
char letter = 'A';
char digit = '7';
char symbol = '?';
char cyrillic = '\u0416';
char euro = '€';
char smile = '☺'; // Oui, c'est aussi possible !
```

---

## `String`

Permet de stocker des chaîne de caracactères.

Le compilateur Java provoqueras une erreur si on tente d'utiliser une variable sans valeur.

```java 
// création de variable 
String text;
// déclaration
String message = "Hello!";
// déclaration multiple
String name = "Anya", city = "New York", message = "Hello!";
```

### Concaténation 

```java
String name = "Anya";                // name contient la chaîne Anya
String city = "New York";           // city contient la chaîne New York
String message = "Hello!" + city + name + city; // message contient la chaîne Hello!New YorkAnyaNew York
```

### Échappement de caractères spéciaux

| Notation | Signification |
| -------- | ------------- |
| `\n` | Saut de ligne |
| `\t` | Tabulation |
| `\\` | Anti-slash |
| `\"` | Guillemet dans une chaîne | 

```java
String multiline = "Ligne 1\nLigne 2";
System.out.println(multiline);

/* sortie 
Ligne 1
Ligne 2
*/ 
```

### `str.length()` - Longueur d'une chaîne 

```java 
String name = "Andrey";
int length = name.length();
System.out.println(length); // 6, car il y a 6 lettres
```

### `str.toUpperCase()` - Transformation en majuscule 

```java 
String original = "Bonjour";
System.out.println(original.toUpperCase()); // BONJOUR
```

### `str.toLowerCase()` - Transformation en minuscule 

```java 
String original = "Bonjour";
System.out.println(original.toLowerCase()); // bonjour
```

### `str.trim()` - Nettoyer les espaces 

```java 
String messy = "   hello   ";
System.out.println(messy.trim()); // "hello"
```
---

## `boolean`

Contient une valeur `true` ou `false`. 

```java
boolean isAdult = true; 
boolean hasMoney = false; 
```

---

## Conversion de types 

Java est fortement typé. Le compilateur n'autorise pas de stocker une valeur d'une type dans une variable d'un autre type. Cependant, il est possible de convertir pour autoriser ce type d'opération.

### `int` -> `String`

Il est souvent nécessaire d'obtenir une repésentation textuelle d'un nombre: pour affichage, enregistrement dans un fichier, envoie sur un réseau, etc. En Java, plusieurs méthodes existe.

#### `String.valueOf()` - Convertion `int` -> `String`

C'est la méthode la plus répandu. La méthode convertis un nombre en `String` qui correspond au type de l'objet passé en argument.

```java
int number = 42;
String str = String.valueOf(number);  // str == "42"
```

#### Concaténation avec une `String` vide 

Ancienne méthode. Cette approche est rapide pour les cas simple, mais est moins explicite pour celui qui vient lire le code.

```java
int number = 42;
String str = "" + number;
```

#### Conversion implicite en `String`

Toutes les variables, objets et expressions Java peuvent se convertir en `String`. Cela se produit automatiquement lorsque l'on concatène un `String` avec un autre type.

```java
int a = 5;
String name = "Anya" + a;            //  name contient la chaîne Anya5

int a = 5;
String city = a + "New York" + a;   //  city contient la chaîne 5New York5

int number = 10;
String code = "Yo";
String message = "Hello! " + number + code; //  message contient la chaîne Hello! 10Yo
```

### `String` -> Nombre 

#### `Integer.parseInt(string)` - `String` -> `int`

Cette méthode permet de convertir un `int` en `String`

```java 
String str = "123";
int number1 = Integer.parseInt(str);        //  number1 contient le nombre 123;

int number2 = Integer.parseInt("321");      //  number2 contient le nombre 321

int number3 = Integer.parseInt("321" + 0);  //  number3 contient le nombre 3210

int number4 = "321"; //  Ne se compile pas : variable de type int, mais valeur de type String
```

### `char` -> `int`

```java 
public class CharToInt {
    public static void main(String[] args) {
        char ch = 'A';
        int code = ch; // Conversion implicite char → int

        System.out.println("Code du caractère '" + ch + "': " + code);
    }
}
```

### `int` -> `char`

```java 
public class IntToChar {
    public static void main(String[] args) {
        int code = 1040; // Code du caractère 'A cyrillique' en Unicode (alphabet cyrillique)
        char ch = (char) code; // Conversion explicite int → char

        System.out.println("Caractère avec le code " + code + ": " + ch);
    }
}
```

### `double` -> `int`

Lors d'une conversion de ce type, la partie fractionnaire ne sera pas conserver.

```java 
int i = 2;
double d = i; // Tout va bien !
System.out.println(d); // 2

double dd = 3.7;
int ii = (int) dd; // Il faut convertir explicitement le type double en type int !
System.out.println(ii); // 3, la partie fractionnaire a été tronquée
```

### `int` -> `double`

Convertion implicite sans perte

```java 
int apples = 5;
double applesWeight = apples; // int devient automatiquement double

System.out.println(applesWeight); // 5.0
```

### `int` -> `char`

```java
int code = 66;
char letter = (char) code; // 66 — c’est le caractère 'B'

System.out.println(letter); // B
```

### `double` -> `float`

```java
double d = 3.1415926535;
float f = (float) d; // une partie de la précision est perdue

System.out.println(f); // 3.1415927 (moins de chiffres après la virgule)
```

### Arrondir selon les règles arithmétique 

Il faut pas simplement couper la partie fractionnaire, mais arrondir à l'entier le plus proche avec `Math.round()`.

```java 
double price = 8.75;
int rounded = (int) Math.round(price);

System.out.println(rounded); // 9
```


