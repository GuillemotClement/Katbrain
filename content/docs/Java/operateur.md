---
date: 2026-06-11T09:50:25+02:00
---

# Operateur

## Opération arithmétique

#### Division

Le résultat d'une division est toujours un nombre floattant si au moins un des opérande est un `double`.

Si les deux opérande sont des `int`, la partie décimale ignorée

```java
int a = 5, b = 2;
System.out.println(a / b); // 2 (le reste est ignoré)

double aa = 5, bb = 2;
System.out.println(aa / bb); // 2.5
```

On peut forcer la conversion vers des doubles pour obtenir un résultat décimal 

```java
int totalApples = 7;
int numberOfFriends = 2;

double applesPerFriend  =(double) totalApples / (double) numberOfFriends;
System.out.println(applesPerFriend); // 3.5
```

#### Modulo

Permet d'obtenir le reste d'une division.

Peut servir pour définir si un nombre est pair ou impair.

```java
int a = 5 % 2; // 1
int b = 20 % 4; //0

int pair = 4 % 2; // 0
int impair = % % 2; // 1
```

#### Incrémentation et décrémentation

```java
int x = 5;
x++; // 6
x--; // 5
```

---
