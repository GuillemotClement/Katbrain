# Types 

## Emplacement mémoire

| Type | Taille en octet |
| ---- | --------------- |
| `byte` | 1 |
| `short` | 2 | 
| `int` | 4 | 
| `long` | 8 | 
| `float` | 4 |
| `long` | 8 | 

## `int` 

Permet de stocker des nombre entiers.

```java 
// ======================
// déclaration d'entier
// ======================
int a = 5;

int x = 5, b = 10, c = a + b;
```

---

## `String`

Permet de stocker des chaîne de caracactères.

Le compilateur Java provoqueras une erreur si on tente d'utiliser une variable sans valeur.

```java 
// création de variable 
String text;
// déclaration
String message = "Hello!";
// déclaration multiple
String name = "Anya", city = "New York", message = "Hello!";
```

### Concaténation 

```java
String name = "Anya";                // name contient la chaîne Anya
String city = "New York";           // city contient la chaîne New York
String message = "Hello!" + city + name + city; // message contient la chaîne Hello!New YorkAnyaNew York
```

### Échappement de caractères spéciaux

| Notation | Signification |
| -------- | ------------- |
| `\n` | Saut de ligne |
| `\t` | Tabulation |
| `\\` | Anti-slash |
| `\"` | Guillemet dans une chaîne | 

```java
String multiline = "Ligne 1\nLigne 2";
System.out.println(multiline);

/* sortie 
Ligne 1
Ligne 2
*/ 
```

### `str.length()` - Longueur d'une chaîne 

```java 
String name = "Andrey";
int length = name.length();
System.out.println(length); // 6, car il y a 6 lettres
```

### `str.toUpperCase()` - Transformation en majuscule 

```java 
String original = "Bonjour";
System.out.println(original.toUpperCase()); // BONJOUR
```

### `str.toLowerCase()` - Transformation en minuscule 

```java 
String original = "Bonjour";
System.out.println(original.toLowerCase()); // bonjour
```

### `str.trim()` - Nettoyer les espaces 

```java 
String messy = "   hello   ";
System.out.println(messy.trim()); // "hello"
```
---

## `boolean`

Contient une valeur `true` ou `false`. 

```java
boolean isAdult = true; 
boolean hasMoney = false; 
```

---

## Conversion de types 

Java est fortement typé. Le compilateur n'autorise pas de stocker une valeur d'une type dans une variable d'un autre type. Cependant, il est possible de convertir pour autoriser ce type d'opération.

### `int` -> `String`

Il est souvent nécessaire d'obtenir une repésentation textuelle d'un nombre: pour affichage, enregistrement dans un fichier, envoie sur un réseau, etc. En Java, plusieurs méthodes existe.

#### `String.valueOf()` - Convertion `int` -> `String`

C'est la méthode la plus répandu. La méthode convertis un nombre en `String` qui correspond au type de l'objet passé en argument.

```java
int number = 42;
String str = String.valueOf(number);  // str == "42"
```

#### Concaténation avec une `String` vide 

Ancienne méthode. Cette approche est rapide pour les cas simple, mais est moins explicite pour celui qui vient lire le code.

```java
int number = 42;
String str = "" + number;
```

#### Conversion implicite en `String`

Toutes les variables, objets et expressions Java peuvent se convertir en `String`. Cela se produit automatiquement lorsque l'on concatène un `String` avec un autre type.

```java
int a = 5;
String name = "Anya" + a;            //  name contient la chaîne Anya5

int a = 5;
String city = a + "New York" + a;   //  city contient la chaîne 5New York5

int number = 10;
String code = "Yo";
String message = "Hello! " + number + code; //  message contient la chaîne Hello! 10Yo
```

### `String` -> Nombre 

#### `Integer.parseInt(string)` - `String` -> `int`

Cette méthode permet de convertir un `int` en `String`

```java 
String str = "123";
int number1 = Integer.parseInt(str);        //  number1 contient le nombre 123;

int number2 = Integer.parseInt("321");      //  number2 contient le nombre 321

int number3 = Integer.parseInt("321" + 0);  //  number3 contient le nombre 3210

int number4 = "321"; //  Ne se compile pas : variable de type int, mais valeur de type String
```


