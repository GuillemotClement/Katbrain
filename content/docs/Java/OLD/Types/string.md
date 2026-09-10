---
date: 2026-06-12T21:22:36+02:00
---

# String

`""`: représente une chaîne vide.

Tous les objets Java peuvent être convertis en type `String`

```java
String name = "Gizmo";

String name1, name2, name3;

String name = "Anya", city = "New York", message = "Hello!";
```

---


## `+`: concaténation

```java
String s1 = "Amigo" + " the best";

int x = 2025;
String s3 = "Amigo" + x;
```

---

## Echappemet de caractères

| Séquence | Description      |
| -------- | ---------------- |
| `\n`     | Saut de ligne    |
| `\t`     | Tabulation       |
| `\\`     | Antislash        |
| ``"`     | Guillemet double |
| `\'`     | Guillemot simple |
| `\r`     | Retour chariot   |
| `\0`     | Caractères nul   |
| `\b`     | Retour arrière   |

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

## Chaîne multiligne

Java permet d'utiliser `"""` permettant d'écrire du texte multiligne sans échappement, en conservant la mise en forme. Utile pour le JSON, le SQL ou le HTML.

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

---

## `String.format()`: mise en forme avancée de chaîne

Permet de créer une chaîne à partir d'un modèle et d'insérer des valeurs à des positions données.

- `%s`: string
- `%d`: entier
- `%f`: float
- `%n`: saut de ligne
- `%b`: boolean

```java
String name = "Oleg";
int age = 25;
double balance = 12345.6789;

String info = String.format("Nom : %s, âge : %d, solde : %.2f euros.", name, age, balance);
System.out.println(info);
// Affichera : Nom : Oleg, âge : 25, solde : 12345.68 euros.
```

### Nombre à virgule avec précision fixe

```java
double price = 99.999;
System.out.println(String.format("Prix : %.2f euros.", price)); // Prix : 100.00 euros.
```

### Largeur de champ et alignement

```java
int n = 7;
System.out.println(String.format("Nombre : [%5d]", n));   // Nombre : [    7]
System.out.println(String.format("Nombre : [%-5d]", n));  // Nombre : [7    ]
```

- `[5d]`: largueur de champs 5, aligné à droite par défaut
- `[-5]`: largeur de champs 5, aligné à gauche

### Chaînes avec alignement

```java
String text = "Java";
System.out.println(String.format("[%10s]", text));  // [      Java]
System.out.println(String.format("[%-10s]", text)); // [Java      ]
```

### Pourcentage

```java
double percent = 0.125;
System.out.println(String.format("Terminé : %.1f%%", percent * 100)); // Terminé : 12.5%
```

### Mise en forme des dates

```java
import java.util.Date;
Date now = new Date();
System.out.println(String.format("Aujourd’hui : %tD", now)); // Aujourd’hui : 06/18/24
System.out.println(String.format("Heure : %tT", now));       // Heure : 15:42:07
```

### Localisation et séparateurs

Par défaut, la locale du système est utilisée. Pour définir une (par exemple, la virgule pour le séparateur de décimales)

```java
import java.util.Locale;
double price = 1234.56;
System.out.println(String.format(Locale.FRANCE, "%.2f", price)); // 1234,56
```

---
## Méthodes essentielles de String 

### `length()`: nombre de caractères d'une chaînes 

La méthode retourne le nombres de caractères de la chaînes. 

Elle permet de :
- vérifier si un utilisateur n'a pas saisi une chaîne vide 
- vérifier la longueur min/max d'un mot de passe 
- savoir combien de caractère il reste avant une limite (SMS par exemple)

Si une chaine `null` est passé à la méthode, cela provoque une erreur `NullPointerException`

```java
String name = "Vasilisa";
int length = name.length();
System.out.println("Nombre de lettres dans le prénom : " + length); // 8

// Vérification d'une chaine vide 
String input = "";
if (input.length() == 0)
{
    System.out.println("La chaîne est vide !");
}
```

### `substring()`: extraire une partie de chaine 

La méthode permet d'obtenir une sous chaine d'une chaine en indiquant les indices.

En passant un argument, on débute à cet index, jusqu'a la fin, si on indique deux argument, le second correspond à l'indice de fin non inclut.

La méthode retourne toujours une nouvelle chaîne, l'original de change pas.

```java
// obtenir les trois premier lettre 
String name = "Vasilisa";
String firstThree = name.substring(0, 3); // "Vas"
System.out.println(firstThree);

// obtenir l'extension d'un fichier 
String fileName = "document.pdf";
int dotIndex = fileName.indexOf(".");
String extension = fileName.substring(dotIndex + 1); // "pdf"
System.out.println(extension);

// obtenir les 4 derniers caractères 
String cardNumber = "1234567890123456";
String lastFour = cardNumber.substring(cardNumber.length() - 4); // "3456"
System.out.println("Les 4 derniers chiffres : " + lastFour);
```

### `indexOf()`: chercher un caractère ou une sous chaine 

La méthode recherche l'indice de la première occurence d'un caractères ou d'une sous-chaîne donné. 

Si trouvé, la méthode retourne l'indice, sinon elle retourne `-1`

```java
// trouver le premier point dans un email 
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

// chercher l'extension d'un fichier 
String fileName = "report.final.version.docx";
int lastDot = fileName.lastIndexOf('.');
String extension = fileName.substring(lastDot + 1);
System.out.println("Extension du fichier : " + extension); // "docx"
```

### `charAt()`: obtenir un caractère par l'indice 

La méthode retourne une valeur de type `char`.

```java
// vérifier le premier caractère d'une chaîne 
String city = "Minsk";
char first = city.charAt(0); // 'M'
System.out.println("Première lettre : " + first);

// vérifier si la chaine commence par une majuscule 
String word = "Java";
if (Character.isUpperCase(word.charAt(0)))
{
    System.out.println("Le mot commence par une majuscule !");
}

// parcourir tous les caractères d'une chaine 
String text = "Bonjour";
for (int i = 0; i < text.length(); i++)
{
    System.out.println("Caractère #" + i + ": " + text.charAt(i));
}
```

### `toCharArray()`: convertis une chaîne en tableau de caractères 

Permet de convertir une chaîne en tableau de `char`. Utile pour des traitement par caractères, le tri, la vérification ...

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

### `replace()`: remplacer les sous-chaînes 

Remplate toutes les occurence de la sous chaine passer en premier argument par le second argument. 

Elle retourne une nouvelle chaîne, l'originale ne change pas.

Pour des règles plus complexe, on utilise `replaceAll()` avec une regex.

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

### `trim()`& `strip()`: supprimer les espaces superflus

Les deux méthode susppriment les caractères invisible au début et en fin de chaine:
- `trim()`: méthode classique, supprime les espaces, tab, retour à la ligne et certain caractères de controle, mais pas tous les espaces Unicode 
- `strip()`: méthode moderne, prends en compte tous les types d'espaces selon le standard Unicode. Cette méthode est à priviliéger.

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

## Comparaison de chaîne 

Les strings sont des objets, et lorsque l'on tente de tester avec `==`, on compare la référence, et pas la valeur.

### `equals()`: comparaison du contenu d'une chaîne 

La méthode permet de comparer les strings par caractères, sensible à la casse.

Si une des deux strings vaut `null`, cela provoque une erreur.

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

### `equalsIgnoreCase()`: comparaison sans tenir compte de la casse 

```java
String email1 = "User@Example.com";
String email2 = "user@example.com";
if (email1.equalsIgnoreCase(email2))
{
    System.out.println("Les adresses e-mail correspondent !");
}
```

### `compareTo()`: comparer la longueur des chaînes 

La méthode retourne: 
- `-1`: si la première string est plus petite
- `0`: égale 
- `1`: si la premiere string est plus grande 

```java 
"apple".compareTo("banana"); // -1
System.out.println("apple".compareTo("apple"));  // 0
System.out.println("banana".compareTo("apple")); // 1

// trier un tableau de chaîne 
String[] fruits = {"banana", "apple", "pear"};
Arrays.sort(fruits); // compareTo() est utilisé en interne
System.out.println(Arrays.toString(fruits)); // [apple, banana, pear]

// compareToIgnoreCase()
System.out.println("Java".compareToIgnoreCase("java")); // 0
```

### `startsWith()` & `endsWith()`: vérification début et fin de string 

Les deux méthodes prenne une string en argument. Retour `true` ou `false` selon le résultat du match 

```java
String fileName = "document.pdf";
String url = "https://www.google.com";

System.out.println(fileName.startsWith("doc"));  // true
System.out.println(fileName.endsWith(".txt"));   // false
System.out.println(url.startsWith("https://"));  // true
```


### `contains()`: recherche d'une sous chaîne 

La méthode est sensible à la casse. Venir normaliser les chaîne en les passant en miniscule avant de l'utiliser.

```java 
String text = "Bienvenue dans le monde de Java !";
System.out.println(text.contains("monde"));   // true
System.out.println(text.contains("C++"));   // false
```

### `toLowerCase()` & `toUpperCase()`: conversion de chaîne 

```java
String title = "Java Programming";
String lower = title.toLowerCase();
String upper = title.toUpperCase();

System.out.println(lower); // java programming
System.out.println(upper); // JAVA PROGRAMMING
```

### `split()`: découpage de string en parties 

Découpe la chaîne selon un séparateur et retourne un `String[]`.

```java
// par virgule 
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

// par espaces 
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

## StringBuilder & StringBuffer 

En Java, la classe `String` est immutable, cela signifie qu'une fois créer, une chaîne ne peut pas être modifiée. A chaque fois que l'on vient modifier une string avec une concaténation, un nouvel objet est crée, et l'ancien est supprimé.

Ces opérations cumulée peuvent coûter en mémoire.



## `StringBuilder`: constructeur de chaîne 

La classe `StringBuilder` est un outil pour assembler et modifier les string. Elle est mutable, on peut ajouter, supprimer, insérer des caractères et sous string sans créer de nouvel objet à chaque opération.

- `append()`: ajoute à la fin de la chaine 
- `insert(index, ...)`: insère une valeur à la position indiquée 
- `delete(start, end)`: supprime les caractère de start à end non inclus 
- `replace(start, end, str)`: remplace une partie de chaine 
- `reverse()`: inverse la chaine 
- `toString()`: convertir en `String`
- `setLength(newLen)`: raccouric ou complète la string à la longueur souhaité

La classe est utiliser dans les cas:
- Modification fréquente d'une chaîne dans une boucle, ou lors d'assemblages de gros texte 
- Assemblage d'une chaîne depuis un tableau/liste (CSV, HTML, rapport) 
- Analyse et traitement de texte avec un grand nombre d'opérations sur chaîne 


```java
// instanciation 
StringBuilder sb = new StringBuilder();

// ajout d'une string 
sb.append("Bonjour, ");
sb.append("monde!");
System.out.println(sb); // Bonjour, monde!

// insère 
sb.insert(9, "Java "); // inserons "Java " après "Bonjour, "
System.out.println(sb); // Bonjour, Java monde!


sb.replace(9, 13, "autre"); // remplaçons "Java" par "autre"
System.out.println(sb); // Bonjour, autre monde!

sb.reverse();
System.out.println(sb); // !ednom ertua ,ruojnoB
```

### Assemblage de chaine depuis un tableau 

```java
String[] names = {"John", "Peter", "Maria"};
StringBuilder sb = new StringBuilder();

for (int i = 0; i < names.length; i++)
{
    sb.append(names[i]); // ajout dans l'instance de StringBuilder
    if (i < names.length - 1)
    {
        sb.append(", ");
    }
}
System.out.println(sb.toString());
```

### Comparaison 

```java
if (sb1.toString().equals(sb2.toString()))
{
    // le contenu est identique
}
```

## `StringBuffer`: sécurité pour multithreading 

`StringBuffer` est plus lent, mais est thread-safe (synchronisé). 

Si l'application utilise un seul thread, on garde `StringBuilder`.

--

## Conversion 

### Conversion int -> String

#### `String.valueOf()`: conversion int -> string

```java
int number = 42;
String str = String.valueOf(number);  // str == "42"
```

#### Concaténation avec une chaîne vide

```java
int number = 42;
String str = "" + number;
```

### Conversion String -> nombre

Pour convertir une chaîne en nombre, la chaîne ne doit contenir que des nombres.

#### `Integer.parseInt(string)`: convertis un int en String

```java
String str = "123";
int number1 = Integer.parseInt(str);        //  number1 contient le nombre 123;

int number2 = Integer.parseInt("321");      //  number2 contient le nombre 321

int number3 = Integer.parseInt("321" + 0);  //  number3 contient le nombre 3210

int number4 = "321"; //  Ne se compile pas : variable de type int, mais valeur de type String
```