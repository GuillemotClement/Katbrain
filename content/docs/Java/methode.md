---
date: 2026-06-12T17:01:46+02:00
---

## Structure_de_programme

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

---

## Méthode 

Les méthodes sont déclaréré dans une classe.

Pour améliorer la lisibilité du code, une méthode réalise une tâche.

Le nom de la méthode doit refléter son action: `sayHello()`, `calculateArea`.

### Déclaration 

```java 
returnType methodName(parameters)
{
    // ici, on écrit des instructions
}
```

- `returnType`: le type de valeur retourné par la méthode: `int`, `void`(si elle ne retourne rien), `String`
- `methodName`: nom de la méthode 
- `parameters`: paramètre passer à la méthode 


```java
// déclaration e méthode sans paramètres
void printHello()
{
    System.out.println("Bonjour, le monde !");
}

// déclaration avec paramètres
void printName(String name)
{
    System.out.println("Bonjour, " + name + " !");
}

// déclaration avec paramètres multiples 
void printSum(int a, int b)
{
    System.out.println("Somme : " + (a + b));
}
```

### Appel de méthode 

Pour utiliser une méthode, il faut venir l'appeler. 

#### Méthode static 

Si la méthode se trouve dans la même classe et est déclarée `static`, on peut simplement utiliser son nom :

```java 
printHello();
printName("Alisa");
printSum(3, 5);
```

#### Méthode non static 

Si la méthode n'est pas `static`, il faut l'appeler via un objet.

---

## Return 

Le type de la valeur retournée doit être indiqué lors de la déclaration de la méthode.

Le type peut être `int`, `double`, `String`, `boolean`, un type personnalisé, un tableau, un objet ..
Si la méthode ne retourne rien, on utilise `void`.

Pour retourner une valeur depuis une méthode, on utilise `return`. Lorsque le programme arrive sur cette instruction, la valeur est retournée, et l'exécution de la fonction se termine.

Lorsqu'une méthode retourne une valeur, on peut venir la stocker dans une variable, l'utiliser directement dans une expression, ou la passer à une autre méthode.


```java
return_value_type methodName(parameters)
{
    // corps de la méthode
}

int sum(int a, int b)
{
    return a + b;
}

// utilisation d'une méthode
int result = sum(5, 7); // on le stocke dans une variable
System.out.println(result); // on affiche le résultat

System.out.println(sum(10, 20)); // on affiche directement le résultat

if (isEven(42))
{
    System.out.println("Le nombre est pair!");
}

// return void 
void printPositive(int number)
{
    if (number <= 0)
    {
        System.out.println("Le nombre n'est pas positif!");
        return; // on sort simplement de la méthode
    }
    System.out.println("Nombre: " + number);
}
```

---

## Passage de paramètre 

En Java, tous les paramètres sont passés par valeur. 

Pour les types primitifs (`int`, `double`, `boolean`, etc) c'est la valeur elle même qui est copée.

Pour les types de références (tableaux, objets), c'est la valeur de référence, l'adresse de l'objet mémoire, qui est copiée et non l'objet lui même.

```java 
// passage de types primitifs
public class Demo
{
    public static void main(String[] args)
    {
        int number = 5;
        changeValue(number);
        System.out.println(number); // 5
    }

    public static void changeValue(int n)
    {
        n = 42;
    }
}
```

C'est la valeur 5 qui est affiché. Une copie de la valeur est passé à la fonction, et c'est la copie qui est modifé, et n'est pas retourner par la méthode.

```java
// passage de type référence
public class Demo
{
    public static void main(String[] args)
    {
        int[] numbers = {1, 2, 3};
        changeFirst(numbers);
        System.out.println(numbers[0]); // 99
    }

    public static void changeFirst(int[] arr)
    {
        arr[0] = 99;
    }
}
```

Une copie de la référence est passer à la fonction. Comme c'est une référence, la méthode peut modifier la valeur stocker à la l'adresse de la référence.

Pour échanger des valeurs, on viendras utiliser un tableau. Dans ce cas, on modifie en utilisant les références passer dans la méthode.

```java
public class Demo
{
    public static void main(String[] args)
    {
        int[] arr = {5, 10};
        swap(arr);
        System.out.println(arr[0] + " " + arr[1]); // Attendu : 10 5
    }

    public static void swap(int[] arr)
    {
        int temp = arr[0];
        arr[0] = arr[1];
        arr[1] = temp;
    }
}
```

Pour l'utilisation des objets 

```java
class Box
{
    int value;
}

public class Demo
{
    public static void main(String[] args)
    {
        Box box = new Box();
        box.value = 7;
        changeBox(box);
        System.out.println(box.value); // 42
    }

    public static void changeBox(Box b)
    {
        b.value = 42;
    }
}
```
On vient modifier le champs de l'objet vers lequel pointe la référence.

---

## Modificateur d'accès 

Les **modificateurs d'accès** permettent de définir l'accès aux méthodes et champs d'une classe.

| Modificateur | Visibilité |
| ------------ | ---------- | 
| `public`| Partout où la classe est visible (autres packages, autres fichiers) |
| `private`| Uniquemet dans une classe | 
| sans modificateur | Uniquement à l'intérieur du même package -> dans les classe du même répertoire | 

```java 
public class User
{
    public String name;           // visible par tous
    private int age;              // visible uniquement à l'intérieur de la classe User

    public void sayHello()
    {
        System.out.println("Bonjour, je m'appelle " + name);
    }

    private void secretMethod()
    {
        System.out.println("C'est une méthode secrète !");
    }
}
```

- `name`: champs visible de partout où l'on peut utiliser la classe `User`
- `age`: visible uniquement dans la classe `User`
- `sayHello()`: méthode publique, elle peut être appelée depuis n'importe quel autre classe 
- `secretMethod()`: méthode privé, elle ne peut pas être appelée depuis l'extérieur

Dans une appliction réel, on as une classe décrivant un compte bancaire. On ne souhaite pas que n'importe qui puisse modfier le solde directement. La variable de solde sera donc `private`, et des méthodes dédiées permettront de le manipuler.

Mettres tous les éléments en `public` est à proscrire. Cela permet à n'importe qui d'accéder directement aux éléments. Cela peut provoquer des bugs.

Bonne pratique: mettre tout en privée, et changer en public uniquement si nécessaire.

---

## Portée des variables

La portée des variables c'est la zone du code où une variable "existe" et peut être utilisée. En dehors de cette zone, la variable disparait.

Il existe plusieurs types de variables selon portée :
- **Variables locales**: déclarée dans une méthode ou un bloc de code 
- **Paramètres de méthode**: déclarée entre les parenthèses de la méthode 
- **Champs de classe**: déclarée dans la classe, mais en dehors des méthodes.

---

## Shadowing 

La masquage est une situation ou l'on déclare une variable, ou un paramètre avec le même nom qu'a l'extérieur.
Dans le bloc, le nouveau nom masque l'ancien, et ne peut plus accéder directement à la valeur externe.

```java
class ShadowDemo
{
    int value = 10; // champ de classe

    void printValue()
    {
        System.out.println(value);  // 10 — affiche le champ de classe
        int value = 5; // la variable locale masque le champ de classe
        System.out.println(value); // affiche 5, pas 10
    }
}
```

Pour accéder à un champ de classe statique, on utilise le nom de la classe comme préfixe : 

```java
class ShadowDemo
{
    static int value = 10; // champ de classe statique

    void printValue()
    {
        System.out.println(value);      // 10 — champ de classe
        int value = 5;
        System.out.println(value);      // 5 — variable locale
        System.out.println(ShadowDemo.value); // 10 — champ de classe statique, accès via 'ShadowDemo'
    }
}
```

S'il faut accéder à un champ de classe non statique, on utilise le mot clé `this`. Il désigne l'instance courante de l'objet 

```java
class ShadowDemo
{
    int value = 10;

    void printValue()
    {
        System.out.println(value);      // 10 — champ de classe
        int value = 5;
        System.out.println(value);      // 5 — variable locale
        System.out.println(this.value); // 10 — champ de classe, accès via 'this'
    }
}
```

## Mise en pratique: modificateurs d'accès et portée 

Système de gestion des étudiants. On déclare une classe `Student`

```java
public class Student
{
    public String name;        // nom de l'étudiant (visible par tous)
    private int age;           // âge (visible uniquement à l'intérieur de la classe)

    public Student(String name, int age)
    {
        this.name = name;
        this.age = age;
    }

    public void sayHello()
    {
        System.out.println("Bonjour, je m'appelle " + name);
    }

    private void printSecret()
    {
        System.out.println("Mon âge : " + age);
    }

    public void revealSecret()
    {
        printSecret(); // on peut appeler une méthode privée à l'intérieur de la classe
    }
}
```

On peut ensuite venir utiliser cette classe 

```java
public class Main
{
    public static void main(String[] args)
    {
        // instanciation de la classe avec la valeur de nom et d'âge 
        Student s = new Student("John", 20);
        s.sayHello();       // OK : méthode publique
        s.revealSecret();   // OK : méthode publique qui appelle une privée en interne

        s.age = 30;      // Erreur ! Le champ age est privé

        s.printSecret(); // Erreur ! La méthode printSecret est privée
    }
}
```