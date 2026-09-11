# 03 Arithmétique 

## Opérateur 

### Division des nombres entiers 

La division d'un entier par un entier produit toujours un entier. Le reste de la division est tronqué.

```java 
int a = 5 / 2; // 2
```

### Reste de la division des entiers 

Permet d'obtenir le reste d'une division d'un entier par un entier.

```java 
int a = 5 % 2; //1

// check nombre pair 
(10 % 2) == 0 // pair
```

## Incrément et décrément 

Permet d'augmenter ou de réduire de 1 la valeur.

```java 
// incrémentation 
a++;

// décrémentation 
a--;
```

## Arithmétique avec `double`

Toutes les opérations habituelles fonctionnent comme avec `int`.

```java 
double distance = 100.5;
double time = 2.0;
double speed = distance / time; // 50.25

System.out.println("Vitesse moyenne: " + speed); // Vitesse moyenne: 50.25
```

Le résultat d'une division sera toujours un nombre floattant si au moins un des opérandes est un `double`.

```java 
int a = 5, b = 2;
System.out.println(a / b); // 2 (le reste est ignoré)

double aa = 5, bb = 2;
System.out.println(aa / bb); // 2.5
```
