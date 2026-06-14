---
date: 2026-06-14T08:06:09+02:00
---
# Classes_enveloppes

Les types enveloppes sont des classes qui contiennent en leur sein la valeur d'un primitif et permettent de la manipuler comme un objet. Par exemple `Integer` pour `int`, `Double` pour `double`.
Ces classes fournissent des méthodes : `Integer.parseInt()`, `Double.isInfinite()`...

```java 
// Primitif
int a = 10;

// Objet enveloppe
Integer b = Integer.valueOf(10);
```

Les enveloppes permettent de stocker un `null`, d'appeler des méthodes, de passer des valeurs à une API qui n'accepte que des objets.

## Boxing et unboxing 

Lorsque que l'on créer manuellement un objet enveloppe, on prends un primitif et on l'encapsule dans un objet => boxing

Pour récupérer la valeur primitive, on bien faire de l'unboxing.

Les enveloppes sont plus lentes que les primitifs et consomment plus de mémoire. Dans les portions de code critiques, et lors de la manipulation de grand tableaux de nombres, il faut priviliégié les primitifs.

```java 
// boxing => on passe la valeur dans la classe enveloppe
int primitive = 42;
Integer wrapper = Integer.valueOf(primitive); // boxing

// unboxing => on récupère la valeur de la classe enveloppe
Integer wrapper = Integer.valueOf(42);
int primitive = wrapper.intValue(); // unboxing

// autoboxing => compilateur ajoute automatiaquement valueOf
int a = 10;
Integer b = a; // autoboxing (Integer.valueOf(a))

// unboxing auto 
Integer c = 20;
int d = c; // unboxing (c.intValue())
```

## Comparaison 

POur faire des comparaisons entre deux enveloppes, il faut utiliser `equals()` pour comparer les deux valeurs.

```java
// création des deux enveloppes
Integer x = 100;
Integer y = 100;
System.out.println(x.equals(y)); // true, comparaison par la valeur
```

## Utilisation 

**Conversion d'une chaîne en nombre**

```java
String text = "123";
int number = Integer.parseInt(text); // convertis la chaîne en nombre 
System.out.println(number); // 123
```

**Vérification particulière des nombres à virgule flottante**

```java
double d = 1.0 / 0;
System.out.println(Double.isInfinite(d)); // true

double nan = 0.0 / 0.0;
System.out.println(Double.isNaN(nan)); // true
```

**Vérification avec Character**

```java
char ch = 'A';
Character wrapper = ch; // autoboxing

System.out.println(Character.isLetter(ch)); // true
System.out.println(Character.isDigit(ch));  // false
System.out.println(Character.toLowerCase(ch)); // 'a'
```

**Conversion de string en bool**
```java
String s1 = "true";
String s2 = "false";
boolean b1 = Boolean.parseBoolean(s1);
boolean b2 = Boolean.parseBoolean(s2);

System.out.println(b1); // true
System.out.println(b2); // false
```