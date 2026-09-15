# Classe Enveloppe 


Ce sont des classes qui contiennent en leur sein la valeur d'un primitif et permettent de la manipuler comme un objet.

Un primitif est toujours une valeur concrète: on ne peut pas lui affecter de `null`. Un objet peut ne pas exister et porter une valeur vide.
Un envelopppe fournis également des méthode, par exemple `Integer.parseInt()` qui convertit une String en nombre.

```java 
// ========================================
// Convertir un int en enveloppe Integer
// ========================================
// Primitif
int a = 10;

// Objet enveloppe
Integer b = Integer.valueOf(10);
```

---

## Liste des classes enveloppes 

| Type primitif | Classe enveloppe |
| ------------- | ---------------- |
| `byte` | `Byte` |
| `short` | `Short` |
| `int` | `Integer` |
| `long` | `Long` | 
| `float` | `Float`|
| `double` | `Double` |
| `char` | `Character` | 
| `boolean` | `Boolean` |

--- 

## Boxing et unboxing 

### Boxing 

Lorsque l'on vient créer manuellement un objet enveloppe, on prends un primitif et on viens l'encapsuler dans un objet 

```java 
int primitive = 42;
Integer wrapper = Integer.valueOf(primitive); // boxing
```

### Unboxing 

Pour récupérer sa valeur primitve, on vient réaliser un unboxing 

```java 
Integer wrapper = Integer.valueOf(42);
int primitive = wrapper.intValue(); // unboxing
```

### Autoboxing 

Le compilateur viens ajouter lui même l'appel à `valueOf()` si on affecte un primmitif à une variable enveloppe 

```java 
int a = 10; // primitif
Integer b = a; // autoboxing (Integer.valueOf(a)) -> création de l'enveloppe
```

### Unboxing automatique 

Lorsqu'on utilise un objet enveloppe là où un primitif est requis, le compilateur ajoute 

```java 
Integer c = 20; // envelope
int d = c; // unboxing (c.intValue()) -> récupéperation de la valeur 
```

---

## Pièges 

### `equals()` Comparaison des enveloppes 

L'utilisation de `==` ne permet pas de comparer deux enveloppes. Il faut utiliser la méthode `equals()`

```java 
Integer x = 100;
Integer y = 100;
System.out.println(x == y);      // true, valeur dans le cache
System.out.println(x.equals(y)); // true, comparaison par la valeur
```

### Unboxing d'enveloppe null

`NullPointerException` sera lancer si on tente de faire l'unboxing d'une enveloppe `null`.

```java 
Integer value = null;
int primitive = value; // Erreur ! NullPointerException
```

---

## Pattern 

### Conversion `String` -> nombre 

```java 
String text = "123";
int number = Integer.parseInt(text);
System.out.println(number); // 123
```

### Vérification des valeurs particulières des nombres flottants

```java 
double d = 1.0 / 0;
System.out.println(Double.isInfinite(d)); // true

double nan = 0.0 / 0.0;
System.out.println(Double.isNaN(nan)); // true
```

### Character 

```java 
char ch = 'A';
Character wrapper = ch; // autoboxing

System.out.println(Character.isLetter(ch)); // true
System.out.println(Character.isDigit(ch));  // false
System.out.println(Character.toLowerCase(ch)); // 'a'
```

### Boolean 

```java 
Boolean flag = null; // autorisé
flag = Boolean.TRUE; // constante spéciale

System.out.println(flag); // true
```

### Conversion `String` -> `Boolean`

```java 
String s1 = "true";
String s2 = "false";
boolean b1 = Boolean.parseBoolean(s1);
boolean b2 = Boolean.parseBoolean(s2);

System.out.println(b1); // true
System.out.println(b2); // false
```
