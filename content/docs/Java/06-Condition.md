# 06 Condition 

## Opérateurs de comparaison

| Opérateur | Signification |
| --------- | ------------- |
| `==` | Égal |
| `!=` | Différent |
| `>` | Suérieur |
| `<` | Inférieur |
| `>=`| Supérieur ou égal |
| `<=` | Inférieur ou égal |


## `if`,  `else if`, `else`

```java
if (condition1)
{
    // S’exécute si condition1 est vrai
}
else if (condition2)
{
    // S’exécute si condition2 est vrai, et condition1 — faux
}
else
{
    // S’exécute si aucune des conditions ci-dessus ne convient
}

// ========================================
// exemple 
// ========================================
int hour = 13;
if (hour < 12)
{
    System.out.println("Bonjour !");
}
else if (hour < 18)
{
    System.out.println("Bon après-midi !");
}
else
{
    System.out.println("Bonsoir !");
}
```

## Comparaison de chaîne - `equals()`

La comparaison avec `==` ne fonctionne qu'avec des nombres entier. La méthode `equals()` compare le contenu des chaîne et non les références.

```java 
String password = console.nextLine();
if (password.equals("qwerty"))            // on appelle la méthode equals() et on lui passe la deuxième chaîne
{
    System.out.println("Vous êtes connecté !");
}
```

## Opérateur de comparaison et boolean 

Il est possible de stocker dans une variable le résulat d'une opèration conditionelle 

```java
int age = 20;
boolean isAdult = age >= 18;   // true (20 est supérieur ou égal à 18)
boolean isTeenager = age >= 13 && age < 18; // false (20 n'est pas inférieur à 18)
boolean isEven = age % 2 == 0; // true (20 est divisible par 2)
```

## Opérateur logique 

| Opérateur | Signification |
| --------- | ------------- |
| `&&` | ET | 
| `\|\|` | OU |
| `!` | NOT | 

```java 
// ============================
// utilisation ET 
// ============================
int age = 16;
boolean hasTicket = true;
boolean canAttend = age >= 14 && hasTicket; // true (16 est supérieur à 14 ET un billet est présent)

// ============================
// utilisatgion OU 
// ============================
boolean isAdmin = false;
boolean isModerator = true;
boolean canEdit = isAdmin || isModerator; // true (on peut modifier si au moins l'un des deux est true)

// =============================
// utilisation NOT 
// =============================
boolean isWeekend = false;
boolean shouldGoToWork = !isWeekend; // true (si ce n'est pas le week-end, on travaille)
```

## Opérateur ternaire 

Si la condition est vraie, alors l'expression 1 est évaluée, sinon c'est l'expression 2. Le résultat de l'opération sera affectée à la variable.

```java
// =========================
// syntaxe 
// =========================
condition ? expression 1 : Expression 2 

// ============================
// exemple 
// ============================
int a = 2;
int b = 3;
int min = a < b ?  a : b; 
// résultat = min = a = 2

// =============================
// affectation de valeur 
// =============================
int age = 25;
int money = age > 30 ? 100 : 50;

// ==============================
// calculer une valeur absolu 
// ==============================
int number = -5;
int abs = (number >= 0) ? number : -number;
System.out.println(abs); // 5

// ==============================
// opérateur ternaire et boolean 
// ==============================
// syntaxe normal 
boolean adult = (age >= 18) ? true : false;
// syntaxe avec ternaire
boolean adult = (age >= 18);
```

#### Ternaire multiple 

```java
String category = (age < 7) ? "préscolaire" :
                  (age < 18) ? "scolaire" :
                  (age < 65) ? "adulte" : "retraité";
```
## Comparaison avec des nombre flottants 

### Comparaison fiable de flottant

Le `double` n'est pas capable de stocker de manière précise une valeur. Une comparaison directe avec `==` peut provoquer des bug. Pour des compararaison, on vient comparer le module de la différence à un trés petit nombre (epsilon).

```jaja
double a = 0.1 + 0.2;
double b = 0.3;
double epsilon = 0.000001;

if (Math.abs(a - b) < epsilon)
{
    System.out.println("Presque égal !"); // C’est plus sûr de comparer ainsi
}
```

Ici on viens vérifier que la différence entre les nombres est inférieur à un millionième.

### Vérification des valeurs spéciale `double`

```java 
System.out.println(Double.isInfinite(result));    // true, si infini
System.out.println(Double.isNaN(result));         // true, si NaN
```

---

## Switch 

```java 
// ==================================
// syntaxe 
// ==================================
switch (expression)
{
    case value1:
        // actions si expression == value1
        break;
    case value2:
        // actions si expression == value2
        break;
    ...
    default:
        // actions si aucune correspondance avec un case
        break;
}
```

- `switch(expression)` : expression dont le résultat est comparé à chaque `case`
- `case valeur`: option comparée 
- `break`: termine le bloc 
- `default`: exécuter si aucune option ne match

Si l'opérateur `break` n'est pas indiquer dans un bloc, l'exécution du code "tombe" dans le bloc suivant.

### Pattern 

#### Menu CLI 

```java 
import java.util.Scanner;

public class CoffeeShop
{
    public static void main(String[] args)
    {
        Scanner console = new Scanner(System.in);

        System.out.println("Choisissez une boisson:");
        System.out.println("1 - Espresso");
        System.out.println("2 - Cappuccino");
        System.out.println("3 - Latte");
        int choice = console.nextInt();

        switch (choice)
        {
            case 1:
                System.out.println("Vous avez choisi un espresso.");
                break;
            case 2:
                System.out.println("Vous avez choisi un cappuccino.");
                break;
            case 3:
                System.out.println("Vous avez choisi un latte.");
                break;
            default:
                System.out.println("Cette boisson n’existe pas.");
                break;
        }
    }
}
```

#### Switch sur des chaîne 

La comparaison sur des chaîne est sensible à la casse.

```java 
import java.util.Scanner;

public class CommandMenu
{
    public static void main(String[] args)
    {
        Scanner console = new Scanner(System.in);

        System.out.println("Saisissez une commande (start, stop, pause):");
        String command = console.nextLine();

        switch (command)
        {
            case "start":
                System.out.println("Démarrage du programme!");
                break;
            case "stop":
                System.out.println("Arrêt du programme.");
                break;
            case "pause":
                System.out.println("Pause.");
                break;
            default:
                System.out.println("Commande inconnue.");
                break;
        }
    }
}
```

#### Switch sur des `char`

```java 
char grade = 'B';

switch (grade)
{
    case 'A':
        System.out.println("Excellent!");
        break;
    case 'B':
        System.out.println("Bien.");
        break;
    case 'C':
        System.out.println("Satisfaisant.");
        break;
    default:
        System.out.println("Essayez encore.");
        break;
}
```

### Regroupement de `case`

Si plusieurs valerus doivent avoir le même comportement, on peut venir les regrouper

```java 
int month = 1;

switch (month)
{
    case 12:
    case 1:
    case 2:
        System.out.println("Hiver");
        break;
    case 3:
    case 4:
    case 5:
        System.out.println("Printemps");
        break;
    case 6:
    case 7:
    case 8:
        System.out.println("Été");
        break;
    case 9:
    case 10:
    case 11:
        System.out.println("Automne");
        break;
    default:
        System.out.println("Mois inconnu");
        break;
}
```
