---
date: 2026-06-11T11:26:38+02:00
---
# Number

## `int`: nombre entier 

Permet de stocker des nombres entiers positif, ou négatif.

| Type    | Taille, octet | Utilisation |
| ------- | ------------- | ----------- |
| `byte`  | 1             | petite valeur, graphisme et manipulation de fichier |
| `short` | 2             | donnée audio, composant de couleur |
| `int`   | 4             | type de base | 
| `long`  | 8             | stockage de milliards ou billions |

## Nombre à vrigule 

Permet de stocker les nombres à virgule 

| Type     | Taille, octet | Utilisation |
| -------- | ------------- | ----------- |
| `float`  | 4             | léger et moins précis, infographie, traitement de gros volumes de données, économie mémoire |
| `double` | 8             | type par défaut |


### Déclaration et initialisation `double` 

```java
// Déclarons une variable et lui affectons la valeur de pi
double pi = 3.1415926;

// On peut aussi déclarer sans initialisation
double averageSalary;
averageSalary = 91234.56;

// On peut calculer !
double pizzaPieces = 8;
double friends = 3;
double piecesPerFriend = pizzaPieces / friends; // 2.666... (et non 2)
```

### Formatage `double`

```java 
double temp = 23.56789;
System.out.println(temp); // 23.56789

// 2 décimales
System.out.println(String.format("%.2f", temp)); // 23.57

// 1 décimale
System.out.println(String.format("%.1f%n", temp)); // 23.6
```

### Précision 

Avec les calculs sur des nombres à virgule, il faut faire attention à la précision lorsque le nombre ne peut pas être représenté.

#### Comparaison de nombre flottant 

Une comparaison direct avec `==` est à éviter. On compare le module de la différence à un très petit nombre `epsilon`.

```java
double a = 0.1 + 0.2;
double b = 0.3;
double epsilon = 0.000001;

// si la différence entre les nombres est inférieur a un millionième, on considére que les nombres sont égaux
// Math.abs retourne la valeur absolu de la valeur passée
if (Math.abs(a - b) < epsilon)
{
    System.out.println("Presque égal !"); // C’est plus sûr de comparer ainsi
}
```

### Valeurs spéciale 

Les `double` peuvent stocker des valeurs spéciales. Elle apparaissent dans des situations spécifique 

#### `Infinity` 

```java
double result = 1.0 / 0.0;
System.out.println(result); // Infinity
```

En Java, la division par 0 ne provoque pas d'erreur. Elle retourne une valeur `Infinity`

#### `-Infinity`

Si on divise un nombre négatif par 0, on obtient `-Infinity`

```java
double result = -1.0 / 0.0;
System.out.println(result); // -Infinity
```

#### `NaN`: Not a number 

```java 
double result = Math.sqrt(-1);
System.out.println(result); // NaN

double result = 0.0 / 0.0;
System.out.println(result); // NaN
```

#### Vérification 

Java propose des fonctions pour vérifier ces valeurs

```java
System.out.println(Double.isInfinite(result));    // true, si infini
System.out.println(Double.isNaN(result));         // true, si NaN
```

---

## Type spéciaux 

- `BigInteger`: travail avec de grand nombres - cryptographie, calculs astronomiques
- `BigDecimal`: classe pour les calculs exacts avec les nombres décimaux qui permet de réduire les imprécisions.

---

## Suffixes de nombre

Dans certains situations, il faut indiquer explicitement le type que l'on souhaite utiliser pour un nombre. 

- `L` - `l`: type `long` (`10000000L`)
- `F` - `f`: type `float` (`3.14f`)
- `D` - `d`: type `double`

Sans utiliser de suffixe, un entier est considérer comme un `int`, un nombre à virgule comme un `double`.

Le suffixe permet d'éviter une erreur lors de l'affectation d'un grand nombre 

```java 
long bigNumber = 9000000000L; // si on retire le L, il y aura une erreur de compilation
```

---

## `_`: Séparateur 

Lorsque les nombres sont longs, le séparateur permet d'améliorer la lisibilité

```java 
int population = 146_700_000;
long stars = 100_000_000_000L;
```

---

## Arrondi - modification de la valeur  

### `Math.round()`: arrondis à l'entier proche 

Prends un nombre à virgule et retourne un entier.

```java
float f = 5.8f;
int roundedF = Math.round(f); // 6

double d = 5.8;
long roundedD = Math.round(d); // 6

// conversion explicite 
int rounded = (int) Math.round(5.6); // 6
```

### `Math.floor(): arrondis vers le bas

```java
System.out.println(Math.floor(2.7)); // 2.0
```

### `Math.ceil()`: arrondit vers le haut  

```java
System.out.println(Math.ceil(2.1));  // 3.0
```

### `Math.rint()`: arrondit a l'entier proche et retourne un `double`

```java
System.out.println(Math.rint(2.5));  // 2.0 
System.out.println(Math.rint(3.5));  // 4.0
```

### Arrondis à un nombre décimal donné

Il faut souvent arrondir non pas à l'entier, mais à deux décimal par exemple. Cet opération est faite à la main :

```java 
double value = 3.14159;
double rounded = Math.round(value * 100.0) / 100.0;
System.out.println(rounded); // 3.14
```

## Mise en forme des nombres - affichage

### `DecimalFormat`: mise en forme 

La classe `DecimalFormat` permet de gérer l'affichage d'un nombre

```java 
import java.text.DecimalFormat;

double value = 3.14159;

DecimalFormat df = new DecimalFormat("0.00"); // on passe le formatage souhaité
System.out.println(df.format(value)); // 3.14

// séparateur des milliers 
DecimalFormat df = new DecimalFormat("#,##0.00");
System.out.println(df.format(1234567.89)); // 1,234,567.89

// affichage sans zéro superflus 
DecimalFormat df = new DecimalFormat("0.##");
System.out.println(df.format(3.1));   // 3.1
System.out.println(df.format(3.141)); // 3.14
System.out.println(df.format(3.145)); // 3.15
```

- `0.00`: toujours deux décimale
- `0.###`: jusqu'a trois décimale, les zéro supperflue ne sont pas affichés
- `#,##0.00`: ajoute des séparateurs de milier


### `String.format` 

Permet de mettre en forme une chaîne

```java 
double value = 3.14159;
System.out.println(String.format("%.2f", value)); // 3.14
```

- `%.2f`: nombre avec deux décimal 

---

## Conversion 

### Conversion implicite

La conversion implicite c'est lorsque Java convertit lui même les valeur d'un type vers un autre, sans perte de données.

Cela se projet lorsque l'on affecte la valeur d'un type plus petit vers une variable avec un type plus grand (`int` -> `double`, `char` -> `int`, `float` -> `double`).

#### `int` -> `double`

```java
int apples = 5;
double applesWeight = apples; // int devient automatiquement double

System.out.println(applesWeight); // 5.0
```

#### `char` -> `int`

```java
char letter = 'A';
int code = letter; // 'A' devient 65 (code du caractère dans Unicode)

System.out.println(code); // 65
```

### `int` -> `char`

```java
int code = 8364;
char symbol = (char) code;

System.out.println(symbol); // €
```


### Conversion explicite 

Ce type de conversion est nécessaire lorsque l'on convertis la valeur d'un type plus grand vers un type plus petit, ou entre des types incompatibles.
Ce type de conversion peux engendrer des pertes de données.

#### `double` -> `int`

```java
double price = 12.99;
int roundedPrice = (int) price; // la partie fractionnaire est simplement tronquée !

System.out.println(roundedPrice); // 12
```

#### `int` -> `char`

```java
int code = 66;
char letter = (char) code; // 66 — c’est le caractère 'B'

System.out.println(letter); // B
```

#### `double` -> `float`

```java
double d = 3.1415926535;
float f = (float) d; // une partie de la précision est perdue

System.out.println(f); // 3.1415927 (moins de chiffres après la virgule)
```

#### `int` -> `byte`

Ce conversion provoque une perte de donnée

```java
int big = 300;
byte small = (byte) big;

System.out.println(small); // 44 (!)
```