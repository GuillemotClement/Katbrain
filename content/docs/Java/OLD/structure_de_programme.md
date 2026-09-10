---
date: 2026-06-12T14:31:22+02:00
---
# Structure_de_programme

Dans un programme Java, chaque service est une classe. Une classe gère par exemple les utilisateurs, une autre les calculs, une troisième le travail avec les fichiers, etc 

Pour un projet, on retrouve généralement cette structure:
- `Main.java`: contient le point d'entrée du programme
- `User.java`: service où sont stockées et traitées les données utilisateurs 
- `Calculator.java`: service des calculs 
- `FileHelper.java`: service des fichiers

## Classe 

Java est un langage orienté object, et tout est objet. Les types d'objets s'appellent des classes.

Une classe est une "boîte" où l'on vient ranger des variables, des méthodes.

```java
class Example
{
    // Ici se trouveront nos outils : variables et méthodes
}
```

Les classes contiennent généralement des variables et des fonctions.

Les variables sont appelé des **champs** et les fonction des **méthodes**.

Dans l'instruction :

```java
System.out.println();
```

- `System`: est une classe qui contient des méthodes pour travailler avec le système
- `out`: c'est un champ qui est un objet de la classe `PrintStream`
- `println`: c'est une méthode de la classe `PrintStream` qui affiche du texte à l'écran

## Méthode `main()`

Le programme minimal en Java ressemble à ceci :

```java
class Program
{
    public static void main(String[] args)
    {
        // Votre code ici
    }
}
```

Il contient au minimum une classe, qui doit définir une méthode `main()`.

Avec Java 21, il est possible d'écrire la méthode `main()`de manière abrégée. Le compilateur se charge de la transforme en bonne méthode.

```java
void main()
{
    Scanner console = new Scanner(System.in);
    int age = console.nextInt();
    System.out.println("Âge : " + age);
}
```

--- 

## Classe classique 

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

- une classe peut avoir plusieurs méthodes 
- une classe peut avoir plusieurs variables 
- les méthodes d'une classe peuvent s'appeler entre elles 
- les méthodes d'une classe peuvent accéder à des variables communes 
- Avant chaque méthode, on retrouve la portée 

### Champs - mémoire d'une classe

Dans une classe, on retrouve des variables, appelé **champs** (field). Ils permettent de stocker des valeurs.

```java
public class MathUtils
{
    // Variables statiques (globales pour la classe)
    static final double PI = 3.14159;
    static int callCounter = 0;
}
```

Les champs permettent à la classe de se souvenir de quelque chose entre différents appels de méthodes.

### Méthodes - actions d'une classe 

Les méthodes sont les compétences d'une classe. Si la classe est un employée, les méthodes sont ses savoir faire.

- afficher quelque chose à l'écran
- calculer la somme de deux nombres 
- recevoir des données en entrée et retourner un résultat 

```java
public class MathUtils
{
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
}
```

### Modificateur d'accès

On peut définit quelles parties d'une classes est accessibles depuis d'autres classes. On utilise les **modificateurs d'accès**.

- `public`: visible par tous. ces méthodes et champs peuvent être utilisés/appelés depuis n'importe où dans le programme
- `private`: visible uniquement depuis l'intérieur de la classe. Ce sont les détails internes qui ne doivent pas être accessibles aux autres.

```java 
public class MathUtils
{
    // Variables statiques (globales pour la classe)
    private static final double PI = 3.14159;
    private static int callCounter = 0;

    // Méthode statique : calcul de l’aire d’un cercle
    public static double circleArea(double radius)
    {
        callCounter++;
        return PI * radius * radius;
    }
}
```

Bonne pratique: on passe les champs en `private`, et on expose uniquement les méthodes nécessaire avec `public`.

### Méthodes et variables statique

Une classe est utilisée comme modèle pour créeer des objets. On écrit la classe, puis on créer des objets issue de cette classe avec `new`. On peut ensuite appeler des méthodes sur ces objets.

Il existe un deuxième cas d'usage d'une classe: un conteneur de variables et méthodes globales, que l'on peut appeler depuis n'importe où dans le programme. C'est ce que permet `static`. Il indique au compilateur que les méthodes et les champs sont rattaché à la classe elle-même. On peut les utiliser sans créer un objet.

```java 
Integer.parseInt();     // Méthode statique parseInt() de la classe Integer
String.valueOf();       // Méthode statique valueOf() de la classe String
Double.isInfinite();    // Méthode statique isInfinite() de la classe Double
Arrays.copy();          // Méthode statique copy() de la classe Arrays
```

La méthode `main()`est toujours déclarée statique, l'exécution du programme commence par elle, avant toute création d'objet.

`psvm`permet de créer une méthode `main()`avec l'ide
