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

Si la chaîne vaut `null`, l'appel à la méthode provoque une erreur `NullPointerException`.

```java 
String name = "Andrey";
int length = name.length();
System.out.println(length); // 6, car il y a 6 lettres
```

#### Vérification d'une chaîne vide 

```java 
String input = "";
if (input.length() == 0)
{
    System.out.println("La chaîne est vide !");
}
```

### `substring()` - extraite une partie de chaîne 

Cette méthode permet d'obtenir une sous-chaîne.

La méthode retourne toujours une nouvelle chaîne et l'originale de change pas.

En cas d'utilisation d'indice incorrect, cela provoque une erreur `StringIndexOutOfBoundsException`.

```java 
str.substring(startIndex); // à partir de l'index jusqu'a la fin 
str.substring(startIndex, endIndex); // partir de l'index de départ et jusqu'à l'index de fin non inclut
```

#### Obtenir les trois premier caractères 

```java 
String name = "Vasilisa";
String firstThree = name.substring(0, 3); // "Vas"
System.out.println(firstThree);
```

#### Obtenir l'extension du fichier 

```java 
String fileName = "document.pdf";
int dotIndex = fileName.indexOf(".");
String extension = fileName.substring(dotIndex + 1); // "pdf"
System.out.println(extension);
```

#### Quatre derniers caractères 

```java 
String cardNumber = "1234567890123456";
String lastFour = cardNumber.substring(cardNumber.length() - 4); // "3456"
System.out.println("Les 4 derniers chiffres : " + lastFour);
```

### `indexOf()` - retourne l'index du caractère ou une sous-chaîne

Cette méthode recherche l'indice de la premiere occurence du caractère ou de la sous-chaine donnée. Si trouvé retourne la position, sinon `-1`.

La méthode `lastIndex()` retourner la dernière occurence.

Pour rechercher un caractère, on utilise des `'` et pour une sous-chaîne des `"`

#### Trouvé le premier point dans un email 

```java
String email = "ivan.petrov@mail.com";
int dotIndex = email.indexOf('.');
System.out.println("Premier point à la position : " + dotIndex); // 4
```

#### Trouver une sous-chaîne 

```java
String text = "J’adore Java !";
int index = text.indexOf("Java");
System.out.println(index); // 8
```

#### Trouver un caractère après une position donnée 

```java 
String s = "abracadabra";
int firstA = s.indexOf('a'); // 0
int secondA = s.indexOf('a', firstA + 1); // 3
System.out.println("La deuxième 'a' à la position : " + secondA);
```

#### Rechercher l'extension d'un fichier 

```java 
String fileName = "report.final.version.docx";
int lastDot = fileName.lastIndexOf('.');
String extension = fileName.substring(lastDot + 1);
System.out.println("Extension du fichier : " + extension); // "docx"
```

### `charAt()` - obtenir le caractère à un indice 

Cette méthode retourne le caractère de la chaîne à l'indice passer. Elle retourne une valeur de type `char`.

L'utilisation d'un indice hors plage provoque une erreur `StringIndexOutOfBoundsException`.

#### Vérifier la premiere lettre d'une chaîne 

```java 
String city = "Minsk";
char first = city.charAt(0); // 'M'
System.out.println("Première lettre : " + first);
```

#### Vérifier si la chaîne commence par une majuscule 

```java 
String word = "Java";
if (Character.isUpperCase(word.charAt(0)))
{
    System.out.println("Le mot commence par une majuscule !");
}
```

#### Parcourir tous les caractères d'une chaîne 

```java 
String text = "Bonjour";
for (int i = 0; i < text.length(); i++)
{
    System.out.println("Caractère #" + i + ": " + text.charAt(i));
}
```

### `toCharArray()` - convertis une String en tableau de char 

La méthode permet de convertir une `String` en tableau de caractère `char[]`. Utiliser pour le traitement caractère par caractère, le tri, la vérification ... 

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

### `replace()` - remplace une sous-chaîne

La méthode `replace(CharSequence target, CharSequence replacement)` remplace toutes les occurences d'une sous-chaîne `target` par `replacement`. Elle retourne une nouvelle chaîne 

```java 
String sentence = "J’aime la programmation en Java.";
String newSentence = sentence.replace("Java", "Java 25");
System.out.println(newSentence);
// Sortie: J’aime la programmation en Java 25.

String email = "support@company.com";
String cleanEmail = email.replace("@", "[at]");
System.out.println(cleanEmail);
// Sortie: support[at]company.com
```

Pour des règles plus complexe, on peut utiliser `replaceAll()` avec une regex.


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

Cette méthode permet de supprimer les caractère invisible en début et fin de chaîne.

```java 
String messy = "   hello   ";
System.out.println(messy.trim()); // "hello"
```

### `strip()` - nettoyage moderne 

Cette méthode fait la même chose que `trim()` mais gère tous les espaces Unicode. Cette méthode est à privilieger.

```java 
String s2 = " \u2005  Java 11  \u2005 "; // \u2005 — est un espace Unicode
System.out.println("trim(): " + s2.trim());
System.out.println("strip(): " + s2.strip());
// Sortie:
// trim():  Java 11
// strip(): Java 11
```

---

## Pattern

### Vérifier la longueur d'un mot de passe 

```java 
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

### Extraire le prénom d'un nom complet 

```java 
String fullName = "Ivanov Ivan Ivanovich";
int firstSpace = fullName.indexOf(' ');
String name = fullName.substring(firstSpace + 1, fullName.indexOf(' ', firstSpace + 1));
System.out.println("Prénom : " + name); // "Ivan"
```

### Vérifier qu'une chaîne débute par une lettre donnée 

```java 
String surname = "Petrov";
if (surname.charAt(0) == 'P')
{
    System.out.println("Le nom de famille commence par la lettre P");
}
```

### Obtenir le domaine d'un email 

```java 
String email = "vasya.pupkin@gmail.com";
int at = email.indexOf('@');
String domain = email.substring(at + 1);
System.out.println("Domaine : " + domain); // "gmail.com"
```

### Trouver les occurences d'une lettre dans une chaîne 

```java 
String s = "abracadabra";
int pos = s.indexOf('a');
while (pos != -1)
{
    System.out.println("La lettre 'a' est trouvée à la position : " + pos);
    pos = s.indexOf('a', pos + 1); // on cherche à partir de la dernière position trouvée
}
```

---

## Comparaison de String 

Les String sont des objets, et non des types primitifs. On ne peut pas comparer deux chaîne avec `==` car cela compare la reference, mais pas la valeur.

### `equals()` - comparaison de String 

Cette méthode permet de comparer des String. Sensible à la casse. 

Si l'une des deux chaîne est `null`, la méthode provoque une erreur `NullPOinterException`.

```java 
String s1 = "Java";
String s2 = new String("Java");
System.out.println(s1.equals(s2)); // true
```

#### Comparaison de mot de passe 

```java 
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

### `equalsIgnoreCase()` - comparaison sans casse 

```java 
String name1 = "Ivan";
String name2 = "ivan";
System.out.println(name1.equalsIgnoreCase(name2)); // true
```

#### Comparaison adresse email 

```java 
String email1 = "User@Example.com";
String email2 = "user@example.com";
if (email1.equalsIgnoreCase(email2))
{
    System.out.println("Les adresses e-mail correspondent !");
}
```

### `compareTo()` - comparaison lexicographique

Effectue une comparaison (ordre de dictionnaire). Retourne un nombre négatif si la premiere chaîne est plus petite, `0` si égale et un nombre positifi si plus grande.

```java 
System.out.println("apple".compareTo("banana")); // < 0
System.out.println("apple".compareTo("apple"));  // 0
System.out.println("banana".compareTo("apple")); // > 0
```

#### Trier un tableau de String 

```java 
String[] fruits = {"banana", "apple", "pear"};
Arrays.sort(fruits); // compareTo() est utilisé en interne
System.out.println(Arrays.toString(fruits)); // [apple, banana, pear]
```

### `compareToIgnoreCase()` - comparaison lexicographique sans casse 

```java 
System.out.println("Java".compareToIgnoreCase("java")); // 0
```

### `startsWith()` - vérifie le début de chaîne 

```java 
String fileName = "document.pdf";

System.out.println(fileName.startsWith("doc"));  // true
```

### `endsWith()` - vérifie la fin de chaîne 

```java 
String fileName = "document.pdf";

System.out.println(fileName.endsWith(".txt"));   // false
```

### `split()` - découpage de chaîne 

Permet de découper ume chaîne selon un séparateur (regex) et retourne un tableau `String[]`

#### Séparation par virgule 

```java 
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
```

#### Séparation par espaces 

```java 
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

---

## Optimisation des String 

Les `String` sont immuable. Ce qui signifie qu'une fois crées, une chaîne ne peut pas être modifée. A chaque modification, on créer une nouvelle chaîne, et l'ancienne est conserver en mémoire jusqu'a ce que le garbage collector vienne la supprimer. Si ces opérations sont nombreuse, cela peut provoquer des ralentissement.

### `StringBuilder` - constructeur de chaîne rapide 

La classe `StringBuilder` du package `java.lang` est outil permettant d'assembler et modifier efficassement des String. Elle est mutable: on peut ajouter, supprimer, insérer des caractères et sous chaîne sans créer de nouvelle objet à chaque opération.

```java 
// ==============================
// création 
/ ===============================
StringBuilder sb = new StringBuilder(); // vide
StringBuilder sb2 = new StringBuilder("Valeur initiale");
```

| Méthode | Description | Utilisation | 
| ------- | ----------- | ----------- | 
| `append(...)` | Ajout en fin de chaîne | `sb.append("Java")` |
| `insert(index, ...)` | Insérer une valeur à la position | `sb.insert(0, "Hello ")` |
| `delete(start, end)` | Supprimer les caractère de start à end exclus | `sb.delete(0, 5)` |
| `replace(start, end, str)` | Remplace une partie de la chaîne par une autre | `sb.replace(0, 4, "Hi")` |
| `reverse()` | Inverse la chaîne | `sb.reverse()` |
| `toString()` | Conversion en String | `String s = sb.toString()` |
| `setLength(newLen)` | Raccourcis ou complete la chaine | `sb.setLength(3)` |

```java 
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
```

#### Assemblage de chaîne depuis un tableau 

```java 
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

### `StringBuffer` - constructeur avec sécurité pour le multithreading

Mêne chose que `StringBuilder` mais avec une sécurite en plus. 


