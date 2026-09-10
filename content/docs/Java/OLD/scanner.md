---
date: 2026-06-11T09:53:24+02:00
---
# Scanner

La classe `Scanner` (`java.util.Scanner`) sait lire des données depuis différentes sources: console, fichier, internet.

Pour lire les données du clavier, on viens lui passer en argument `System.in`, qui représente la source de données. L'objet `Scanner` se charge ensuite de la lecture.

```java
void main()
{
    // instanciation de l'objet Scanner
    // prends en argument la source à lire
    Scanner console = new Scanner(System.in);
    // on stocke dans name la saisie utilisateur
    String name = console.nextLine(); // récupèration de string
    int age = console.nextInt(); // récupération de int

    System.out.println("Name: " + name);
    System.out.println("Age: " + age);
}
```

## `Scanner.nextLine()`: récupérer une string

Lorsque le programme arrive sur cette ligne, il se met en pause jusqu'a la saisie de l'utilisateur. Tout ce qui sera saisie par l'utilisateur sera capturé.

```java
void main()
{
    Scanner console = new Scanner(System.in);
    String name = console.nextLine(); // récupèration de string

    System.out.println("Name: " + name);
}
```

## `Scanner.nextInt()`: récupérer un int

Permet de récupérer un `int`. La saisie sera automatiquement convertis en `int`.

Si la saisie ne peut être convertis, une erreur se produit, et le programme s'arrête.

```java
void main()
{
    Scanner console = new Scanner(System.in);
    int age = console.nextInt(); // récupération de int

    System.out.println("Age: " + age);
}
```

## `Scanner.nextDouble()`: récupérer un float

Permet de récupérer un `double`. Si la saisit ne peut être convertis, une erreur se produit.

```java
Scanner console = new Scanner(System.in);

System.out.println("Entrez la température extérieure:");
double temperature = console.nextDouble(); // On lit directement un double

System.out.println("Il fait actuellement: " + temperature + " degrés.");
```