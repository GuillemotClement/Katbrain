# Projet Java 

## Structure d'un projet Java 

**Exemple d'un projet simple**
```tree
MyFirstProject/
├── .idea/           # fichiers de service d’IntelliJ IDEA, ne pas toucher
├── out/             # ici apparaissent les fichiers .class compilés
├── src/             # c’est ici que vit votre code source !
│   └── Main.java
|-- ressources/
|   |-- config.txt
|   |-- image.png
├── MyFirstProject.iml
└── README.md
```

### Dossier `src`

Dans ce dossier, on retrouve le code source. Toutes les classes y sont placées. Tous ce que l'on vient écrire se place dans ce dossier.

### Organisation du code dans un projet 

**Une classe = un fichier**

En Java, une classe public correspond à un fichier portant le même nom que la classe. Par exemple, une classe `Person` doit être dans un fichier `Person.java`.

Le nom de la classe doit être le même que le nom du fichier.

```java 
src/com/javarush/lesson05/Person.java

package com.codegym.lesson05;

public class Person {
    String name;
}
```

### Stockage des ressources 

Les images, fichiers texte, etc sont stocker dans un dossier séparé (`ressources` ou `res`).

---

## Packages `package`

Les classes sont regroupées par `package`. C'est comme un dossier du system file, mais pour les classes. Les packages permettent d'éviter les conflits de noms, permettent de structurer logiquement le code et gère l'accès aux classes et aux méthodes.

### Syntaxe de déclaration 

Au début de chaque fichier Java, avant les `import` et `class`, on vient définir le package :

```java
package com.codegym.lesson05;
```

Cela signifie: la classe de ce fichier appartient au package `com.codegym.lesson05`.

Les dossier du system file doivent correspondrent au nom du package. Avec l'exemple, le chemin du fichier sera `src/com/codegym/lesson05/Main.java`

---

## Nom complet d'une classe 

Chaque classe se trouve forément dans un package. Par exemple:
- La classe `Scanner` se trouve dans le package `java.lang`. Son nom complet est `java.lang.System`
- La classe `ArrayList` se trouve dans le package `java.util`. Son nom complet est `java.util.ArrayList`

Le nom complet d'une classe est constituer de **nom du package + point + nom de la classe**.

```java 
java.util.Scanner sc = new java.util.Scanner(System.in);
String name = sc.nextLine();
System.out.println("Bonjour, " + name);
```

Ici, on écrit explicitement `java.util.Scanner`. Le compilateur comprend de quelle classe il s'agit, même s'il y a d'autre classes `Scanner` dans le programme.

Le nom complet d'une classe est toujours unique.

```java 
// ===================================================================
// deux classe ayant le même nom, mais avec le nom complet différent
// ===================================================================
java.util.Date d1 = new java.util.Date();
java.sql.Date d2 = new java.sql.Date(System.currentTimeMillis());
```

---

## Instruction `import`

Cette intruction permet de simplifier l'utilisation des noms complet de classe.

```java 
// ========================
// importation de la classe 
// =========================
import java.util.Scanner;

// ==============================
// utilisation dans la classe 
//===============================
Scanner sc = new Scanner(System.in);
```

### Import classique -> une classe 

```java
import java.util.Scanner;
import java.util.ArrayList;
```

On peut ensuite utiliser des noms courts pour faire référence à la classe : `Scanner`, `ArrayList`

### Import de tout un package - `*`

Le `*` signifie "Autoriser l'utilisation de toutes les classes du package `java.util" sans nom complet".

Cette syntaxe n'importe que les classes du package `java.util`, et pas celles de ses sous-packages.

```java 
import java.util.*;

Scanner sc = new Scanner(System.in);
ArrayList<String> list = new ArrayList<>();
```

---

## Classpath 

Le `classpath` est l'itinéraire que Java parcourt pour trouver les classes lors du lancement du programme. C'est un peu comme une liste de dossiers où Java va chercher les fichiers `.class`.

Par défaut l'IDE ajoute lui même le dossier `src` au classpath. 





