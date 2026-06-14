---
date: 2026-06-10T20:37:40+02:00
weight: 2
---

# Conditions

## If/else if/ else

```java
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

## Opérateur conditionnel

```java
// égalité
==
// différent
!=
// superieur
>
// supérieur ou égale
>=
// inférieur
<
// inférieur ou égal
<=
```

## `equals()`: Comparaison de chaîne

```java
String password = console.nextLine();
if (password.equals("qwerty"))            // on appelle la méthode equals() et on lui passe la deuxième chaîne
{
    System.out.println("Vous êtes connecté !");
}
```

## `boolean`

Peux prendre une valeur `true` ou `false`.

```java
int age = 20;
boolean isAdult = age >= 18;   // true (20 est supérieur ou égal à 18)
boolean isTeenager = age >= 13 && age < 18; // false (20 n'est pas inférieur à 18)
boolean isEven = age % 2 == 0; // true (20 est divisible par 2)
```

## Opérateur logique

- `&&`: ET
- `||`: OU
- `!`: NOT -> permet d'inverser

```java
int age = 16;
boolean hasTicket = true;
boolean canAttend = age >= 14 && hasTicket; // true (16 est supérieur à 14 ET un billet est présent)

boolean isAdmin = false;
boolean isModerator = true;
boolean canEdit = isAdmin || isModerator; // true (on peut modifier si au moins l'un des deux est true)

boolean isWeekend = false;
boolean shouldGoToWork = !isWeekend; // true (si ce n'est pas le week-end, on travaille)

int age = 17;
boolean hasTicket = false;
boolean isVip = true;

boolean canGo = (age >= 18 && hasTicket) || isVip; // true, parce que isVip = true
```

## Opérateur ternaire

Si la condition est vraie, l'expression 1 est évalué, sinon c'est la deuxiéme. On peut affecter son résultat a une variable.

Les deux valeurs doivent être du même type.

```java
int age = 25;
int money = age > 30 ? 100 : 50; // 100

// calcul la valeur absolu
int number = -5;
int abs = (number >= 0) ? number : -number;
System.out.println(abs); // 5
```

---

## Switch

Entre chaque `case`, on utilise le `break`.

Le switch prends en charge les types primitifs (`byte`, `short`, `char`, `int`), les énumérations `enum` et les `String`.

```java
import java.util.Scanner;

public class CommandMenu
{
    public static void main(String[] args)
    {
        Scanner console = new Scanner(System.in);

        System.out.println("Saisissez une commande (start, stop, pause):");
        String command = console.nextLine(); // récupération de la saisie

        // on passe la commande dans le switch
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

Pour regrouper des cases :

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

---

## Switch moderne

Avec Java 14+, la syntaxe de Switch est devenue plus moderne.

Avec un enum, le compilateur vient vérifier si tutes les valeurs sont traitée. Le compilateur n'autorisera pas la construction du projet sans `default`.

La logique par défaut est également inverse. Par défaut, il n'y a pas de risque de passer au `case`suivant.

```java
DayOfWeek day = DayOfWeek.MONDAY;

// switch est devenue une expression qui retourne une valeur 
String message = switch (day)
{
    case MONDAY, FRIDAY, SUNDAY -> "Semaine courte ou jour de repos !";
    case TUESDAY                -> "Le mardi — une journée difficile.";
    case WEDNESDAY, THURSDAY    -> "Milieu de semaine !";
    case SATURDAY               -> "Youpi, samedi !";
    // default est obligatoire si toutes les possibilités ne sont pas couvertes
    default                     -> "Jour plutôt étrange...";
};

System.out.println(message);

// NOMBRE =====================================
int code = 404;
String result = switch (code)
{
    case 200 -> "OK";
    case 400, 404 -> "Erreur côté client";
    case 500 -> "Erreur serveur";
    default -> "Code inconnu";
};
System.out.println(result);

// String =====================================
String command = "start";
String status = switch (command)
{
    case "start" -> "Démarrage !";
    case "stop" -> "Arrêt !";
    case "pause" -> "Pause...";
    default -> "Commande inconnue";
};
System.out.println(status);
```

- `->`: le résultat retourné par le case 
- plusieurs case peuvent etre regroupée par des virgules 
- il n'y a plus de break 
- la variable `message` est directement affecté.

### `yield` 

On souahite parfois exécuter plusieurs actions sur un même `case`, par exemple un calcul complexe ou journalier. Pour cela, on utilise un bloc `{ ... }` et le mot clé `yield`

```java
int n = 7;

String parity = switch (n % 2)
{
    case 0 -> "Pair";
    case 1 ->
    {
        System.out.println("Nombre impair détecté : " + n);
        yield "Impair";
    }
    default -> "Quelque chose d'étrange";
};
System.out.println(parity);
```

Dans ce bloc, il doit impérativement avoir un `yield` qui retourne une valeur pour ce `case`.

### Utilisation avec enum et chaine 

On as un enum 

```java 
enum DayOfWeek
{
    MONDAY, TUESDAY, WEDNESDAY, THURSDAY, FRIDAY, SATURDAY, SUNDAY
}
```

On vient l'utiliser dans un nouveau `switch`

```java
// on viens utiliser l'enum 
DayOfWeek today = DayOfWeek.WEDNESDAY;

// on switch sur l'enum 
String mood = switch (today)
{
    case MONDAY -> "Difficile de se lever...";
    case FRIDAY -> "Le week-end approche !";
    case SATURDAY, SUNDAY -> "Youpi, repos !";
    default -> "Jour ouvré.";
};
System.out.println(mood);
```
