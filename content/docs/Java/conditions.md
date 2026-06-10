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

## Opéerateur logique 

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