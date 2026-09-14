# Méthode 


Dans un programme Java, chaque service est une classe. Une classe gère les utilisateurs, une classe gère les calcules, une classe gère le travail avec les fichiers.

Dans un programme, on peut retrouve ce type de structure 

- `Main.java`: on retrouve le point d'entrée 
- `User.java`: gestion des données utilisateurs 
- `Calculator.java`: service des calculs 

## Classe 

En Java, tout est objet. Les types d'objets sont des classes.

Une classe correspond à un plan ou l'on définis les méthodes et les champs.

```java 
class Example
{
    // champs et méthodes
}
```

Une classe typique resemble à cela : 

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

## Méthode `main()`

C'est la méthode point d'entrée d'un programme Java. C'est pas cette méthode que le programme se lance. Le code minimal ressemble à cela:

```java 
class Program
{
    public static void main(String[] args)
    {
        // Votre code ici
    }
}
```

Il contient au minimum une classe qui doit définir une méthode `main`.

Avec Java 21, la syntaxe est simplifier, le compilateur se charge de trasnformer ensuite 

```java 
void main()
{
    Scanner console = new Scanner(System.in);
    int age = console.nextInt();
    System.out.println("Âge : " + age);
}
```

## Méthode 

Les méthodes sont des compétences d'une classe. Par exemple, afficher quelque chose.

### Structure d'une méthode 

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

## Modificateur d'accès

- `public`: visible par tous 
- `private`: visible uniquement de la classe

## Méthodes et variables statique 

`static` permet de déclarer des méthodes et des champs lié à une classe et pas à son instance. Il n'est pas nécessaire de déclarer un objet pour les utiliser, mais directement la classe 

```java 
Integer.parseInt();     // Méthode statique parseInt() de la classe Integer
String.valueOf();       // Méthode statique valueOf() de la classe String
Double.isInfinite();    // Méthode statique isInfinite() de la classe Double
Arrays.copy();          // Méthode statique copy() de la classe Arrays
```

## Méthode 

### Déclaration de méthode

```java 
returnType methodName(parameters)
{
    // ici, on écrit des instructions
}

// ========================
// méthode sans paramètres
// ========================
void printHello()
{
    System.out.println("Bonjour, le monde !");
}

// ============================
// méthode avec paramètres
// ============================
void printName(String name)
{
    System.out.println("Bonjour, " + name + " !");
}

// ==================================
// méthode à paramètres multiples
// ==================================
void printSum(int a, int b)
{
    System.out.println("Somme : " + (a + b));
}
```

- `returnType`: ce que la méthode retourne, `void` si rien n'est retourné
- `methodName`: le nom de la méthode 
- `parameters`: variable utiliser dans la méthode

### Appel de méthode 

Pour utiliser une méthode, il faut, une fois celle ci déclarée, venir l'appeler.

```java 
// =========================
// méthode static
// =========================
    public static void main(String[] args)
    {
        printHello();
        printName("Bob");
        printSum(10, 20);
    }
```

Si la méthode n'est pas `static`, il faut venir l'appeler via son objet.

```java 
// =========================
// méthode sur l'objet 
// =========================

```

--- 

## Valeur de retour `return`

Une méthode est capable de retourner des valeurs afin de traiter celle ci ensuite dans le code. Cela peut être un type `int`, `double`, `String`, `boolean`, un tableau, ou un objet. Si la méthode ne retourne rien, on utilise `void`.

```java 
int sum(int a, int b)
{
    // renvoie un int
}

String getGreeting(String name)
{
    // renvoie un String
}

boolean isEven(int number)
{
    // renvoie un boolean
}

void printHello()
{
    // ne renvoie rien - exécute simplement une action
}
```

### Opérateur `return`

L'opérateur `return` permet de retourner une valeur depuis une méthode. Lorsque l'exécution atteint la ligne avec le `return`, l'exécution de la méthode se termine, et la valeur est retourné et transmise à l'endroit oà la méthode à été appeler.

Lorsqu'une méthode retourne une valeur, on peut venir la stocker dans une variable, l'utiliser directement dans une méthode, ou la passer à une autre méthode.

```java 
// ========================
// utilisation d'une valeur retourner
// ========================
int result = sum(5, 7); // on le stocke dans une variable
System.out.println(result); // on affiche le résultat

System.out.println(sum(10, 20)); // on affiche directement le résultat

if (isEven(42))
{
    System.out.println("Le nombre est pair!");
}

// ===================================
// méthode qui retourne une chaîne 
// ===================================
String getGreeting(String name)
{
    return "Bonjour, " + name + "!";
}

// Utilisation :
String greeting = getGreeting("Alisa");
System.out.println(greeting); // Bonjour, Alisa !
```


