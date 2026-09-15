# `String`

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

---

## Concaténation 

### `+` - concaténation simple 

```java
String name = "Anya";                // name contient la chaîne Anya
String city = "New York";           // city contient la chaîne New York
String message = "Hello!" + city + name + city; // message contient la chaîne Hello!New YorkAnyaNew York
```
### `String.format()` - mise en forme avancée des chaînes 

Cette méthode permet de créer des chaînes à partir d'un modèle et d'insérer des valeurs à des positions données.

```java 
// ================================
// syntaxe 
// ================================
String result = String.format("Modèle", values);
```

On utilise des caractères spéciaux pour définir le type de valeurs attendus, et son emplacement.

- `%s`: String 
- `%d`: entier 
- `%f`: nombre à virgule
- `%n`: saut de ligne 

```java 
String name = "Oleg";
int age = 25;
double balance = 12345.6789;

String info = String.format("Nom : %s, âge : %d, solde : %.2f euros.", name, age, balance);
System.out.println(info);
// Affichera : Nom : Oleg, âge : 25, solde : 12345.68 euros.
```

#### Nombres à virgule avec précision fixe 

```java 
double price = 99.999;
System.out.println(String.format("Prix : %.2f euros.", price)); // Prix : 100.00 euros
```

#### Largeur de champ et alignement 

- `[5d]`: largeur de champ 5, aligné à droite par défaut 
- `[-5d]`: largeur de champ 5, aligné à gauche 

```java 
int n = 7;
System.out.println(String.format("Nombre : [%5d]", n));   // Nombre : [    7]
System.out.println(String.format("Nombre : [%-5d]", n));  // Nombre : [7    ]
```

#### Chaîne avec alignement

```java 
String text = "Java";
System.out.println(String.format("[%10s]", text));  // [      Java]
System.out.println(String.format("[%-10s]", text)); // [Java      ]
```

#### Tableau avec alignement 

```java 
String header = String.format("%-10s | %5s | %8s", "Nom", "Points", "Temps");
String row1 = String.format("%-10s | %5d | %8.2f", "Oleg", 95, 10.5);
String row2 = String.format("%-10s | %5d | %8.2f", "Anna", 100, 9.75);

System.out.println(header);
System.out.println(row1);
System.out.println(row2);

/* Sortie :
Nom        | Points |    Temps
Oleg       |    95  |    10.50
Anna       |   100  |     9.75
*/
```

#### Pourcentage 

Pour afficher le `%`, on utilise `%%`

```java 
double percent = 0.125;
System.out.println(String.format("Terminé : %.1f%%", percent * 100)); // Terminé : 12.5%
```

---

## Localisateur  et séparateurs 

Par défaut, la locale du système est utilisée. Pour définir une, il faut venir passer une locale.

```java 
import java.util.Locale;
double price = 1234.56;
System.out.println(String.format(Locale.FRANCE, "%.2f", price)); // 1234,56
```
---

## Caractères spéciaux et échappement

| Notation | Signification |
| -------- | ------------- |
| `\n` | Saut de ligne |
| `\t` | Tabulation |
| `\\` | Anti-slash |
| `\"` | Guillemet dans une chaîne | 
| `\'` | Apostrophe |
| `\r` | Retour chariot | 
| `\0` | Caractère nul | 
| `\b` | Retour arrière - efface le caractère précédent | 

```java
String multiline = "Ligne 1\nLigne 2";
System.out.println(multiline);

/* sortie 
Ligne 1
Ligne 2
*/ 

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

---

## Chaîne multilignes 

Java à introduit des blocs de texte qui commence par des triple guillemets `"""` et permettent d'écrire du texte multiligne sans échappement, en conservant la mise en forme. Idéale pour du JSON, SQL et HTML.

```java 
// Littéral multiligne (Text Block)
String json = """
    {
        "name": "Alice",
        "age": 30,
        "skills": ["Java", "SQL", "Cloud"]
    }
    """;

System.out.println(json);
```

---

## Méthode de String 

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