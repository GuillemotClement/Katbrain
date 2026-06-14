---
date: 2026-06-14T11:02:44+02:00
---
# Enum

Un enum est un type de donnée spéciale qui permet de déclarer un ensemble de constantes nommées. Chaque élément de l'énum est un nom unique associé à un nombre.

`enum` indique au compilateur que l'on déclare une énumération.

Le nom des valeurs est écrit dans UPPER_SNAKE_CASE.

L'énumération peut être déclaré dans un fichier séparé, dans un classe (si besoin d'une énumération privée pour cette classe), ou encore dans une méthode.

```java
// Fichier DayOfWeek.java
public enum DayOfWeek {
    MONDAY,			// 0
    TUESDAY,		// 1
    WEDNESDAY,		// 2
    THURSDAY,		// 3
    FRIDAY,			// 4
    SATURDAY,		// 5
    SUNDAY			// 6
}
```

## Utilisation d'un enum 

```java
DayOfWeek today = DayOfWeek.MONDAY;
```
`today` ne peut prendre que l'une des valeurs déclarée dans l'enum `DayOfWeek`. 

On peut venir utiliser un `switch` pour vérifier les valeurs. Dans le case, on passe la valeur de `today` qui sera une valeur contenu dans l'enum.

Sous le capot, les constante de l'enum sont convertis en valeur numérique.

```java
switch (today)
{
    case MONDAY:
        System.out.println("Ouh, lundi...");
        break;
    case FRIDAY:
        System.out.println("Youpi, vendredi !");
        break;
    default:
        System.out.println("Un jour ordinaire.");
}
```

## `values()`: afficher les valeurs de l'enum

Chaque enum possède une méthode statique `values()` qui retourne un tableau de toutes ses valeurs 

Cela permet d'afficher rapidement un menu, générer des options par exemple.

```java 
for (DayOfWeek day : DayOfWeek.values())
{
    System.out.println(day);
}
```

---

## `name()`: retourne le nom de la constante sous forme de chaîne 

```java
DayOfWeek day = DayOfWeek.FRIDAY;
System.out.println(day.name()); // "FRIDAY"
```

--- 

## `ordinal()`: index de la constante 

Retourne l'indice de la constante dans l'enum

Il ne fuat pas stocker ni comparer des enum avec cette méthode. L'ordre pouvant changer.

```java
System.out.println(DayOfWeek.MONDAY.ordinal()); // 0
System.out.println(DayOfWeek.FRIDAY.ordinal()); // 4
```

---

## `valueOf(String name)`: convertis en chaîne la valeur de l'énumération 

Convertit une string en valeur d'énumration si une telle constante existe.

Si la string ne correspond pas, une exception `IllegalArgumentException`

```java
DayOfWeek day = DayOfWeek.valueOf("MONDAY");
System.out.println(day); // MONDAY
```

---

## Enum avec champs, constructeur et méthodes 

Il est possible d'enrichir des enum avec des champs, des constructeurs, des méthodes. 

```java
public enum DayOfWeek
{
    MONDAY("Lundi"),
    TUESDAY("Mardi"),
    WEDNESDAY("Mercredi"),
    THURSDAY("Jeudi"),
    FRIDAY("Vendredi"),
    SATURDAY("Samedi"),
    SUNDAY("Dimanche");

    private final String russianName;

    // Constructeur (private par défaut)
    DayOfWeek(String russianName)
    {
        this.russianName = russianName;
    }

    public String getRussianName()
    {
        return russianName;
    }
}

// UTILISATION ========================
DayOfWeek day = DayOfWeek.WEDNESDAY;
System.out.println(day.getRussianName()); // "Mercredi"
```
