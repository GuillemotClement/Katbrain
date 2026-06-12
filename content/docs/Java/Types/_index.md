# Type

## `int`

`int` permet de stocker les nombres entiers.

```java
// déclaration
int x;

// déclaration multiple
int a, b, c;

// affectation
int y = 10;

// affectation multiple
int q = 7, z = 10;
```



## `float`

Permet de stocker des nombres à virgule



---

## `String`

Tous les objets Java peuvent être convertis en type `String`.

```java
String name = "Gizmo";

String name1, name2, name3;

String name = "Anya", city = "New York", message = "Hello!";
```

### `+`: concaténation

```java
String s1 = "Amigo" + " the best";

int x = 2025;
String s3 = "Amigo" + x;
```

### Chaîne vide

`""` représente une chaîne vide.

### Échappement de caractères

```java
String quote = "Il a dit: \"Bonjour!\"";
System.out.println(quote); // Il a dit: "Bonjour!"
```

- `\n`: saut de ligne
- `\t`: tabulation
- `\\`: échappement de `\`
- `\"`: échappement de `"`

### `str.length()`: longueur de chaîne

```java
String name = "Andrey";
int length = name.length();
System.out.println(length); // 6, car il y a 6 lettres
```

### `str.toUpperCase()`: conversion en majuscule

```java
String original = "Bonjour";
System.out.println(original.toUpperCase()); // BONJOUR
```

### `str.toLowerCase()`: conversion en minuscule

```java
String original = "Bonjour";
System.out.println(original.toLowerCase()); // bonjour
```

### `str.trim(0)`: supprimer les espaces en début et fin de chaîne

```java
String messy = "   hello   ";
System.out.println(messy.trim()); // "hello"
```

---

## Conversion

### Conversion int -> String

#### `String.valueOf()`: conversion int -> string

```java
int number = 42;
String str = String.valueOf(number);  // str == "42"
```

#### Concaténation avec une chaîne vide

```java
int number = 42;
String str = "" + number;
```

### Conversion String -> nombre

Pour convertir une chaîne en nombre, la chaîne ne doit contenir que des nombres.

#### `Integer.parseInt(string)`: convertis un int en String

```java
String str = "123";
int number1 = Integer.parseInt(str);        //  number1 contient le nombre 123;

int number2 = Integer.parseInt("321");      //  number2 contient le nombre 321

int number3 = Integer.parseInt("321" + 0);  //  number3 contient le nombre 3210

int number4 = "321"; //  Ne se compile pas : variable de type int, mais valeur de type String
```

---