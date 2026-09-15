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