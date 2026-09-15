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

### `char` -> `int`

```java 
public class CharToInt {
    public static void main(String[] args) {
        char ch = 'A';
        int code = ch; // Conversion implicite char → int

        System.out.println("Code du caractère '" + ch + "': " + code);
    }
}
```

### `int` -> `char`

```java 
public class IntToChar {
    public static void main(String[] args) {
        int code = 1040; // Code du caractère 'A cyrillique' en Unicode (alphabet cyrillique)
        char ch = (char) code; // Conversion explicite int → char

        System.out.println("Caractère avec le code " + code + ": " + ch);
    }
}
```

### `double` -> `int`

Lors d'une conversion de ce type, la partie fractionnaire ne sera pas conserver.

```java 
int i = 2;
double d = i; // Tout va bien !
System.out.println(d); // 2

double dd = 3.7;
int ii = (int) dd; // Il faut convertir explicitement le type double en type int !
System.out.println(ii); // 3, la partie fractionnaire a été tronquée
```

### `int` -> `double`

Convertion implicite sans perte

```java 
int apples = 5;
double applesWeight = apples; // int devient automatiquement double

System.out.println(applesWeight); // 5.0
```

### `int` -> `char`

```java
int code = 66;
char letter = (char) code; // 66 — c’est le caractère 'B'

System.out.println(letter); // B
```

### `double` -> `float`

```java
double d = 3.1415926535;
float f = (float) d; // une partie de la précision est perdue

System.out.println(f); // 3.1415927 (moins de chiffres après la virgule)
```

### Arrondir selon les règles arithmétique 

Il faut pas simplement couper la partie fractionnaire, mais arrondir à l'entier le plus proche avec `Math.round()`.

```java 
double price = 8.75;
int rounded = (int) Math.round(price);

System.out.println(rounded); // 9
```