# 05 - Console 

## Affichage 

### `System.out` - Affichage dans la console 

```java 
// Affichage et saut de ligne 
System.out.println("hello");

// Affichage sans saut de ligne 
System.out.print("Hello");
```

### Sortie formatée de `double`

Par dèfaut, un nombre à virgule sera afficher avec de nombreux zéro. Il est possible de venir formater la sortie.

```java 
double temp = 23.56789;
System.out.println(temp); // 23.56789

// 2 décimales
System.out.println(String.format("%.2f", temp)); // 23.57

// 1 décimale
System.out.println(String.format("%.1f%n", temp)); // 23.6
```

- `%.2f`: nombre avec 2 décimale
- `%.1f`: nombre avec 1 décimale


## Saisie au clavier 

### `System.in` - Lecture depuis la console 

Objet spécial qui permet de lire les données depuis le clavier, mais uniquement un caractère à la fois.

### `Scanner` 

Classe qui permet de lire des données depuis différente sources: console, fichiers, Internet. Pour lire des données depuis le clavier, il faut lui passer `System.in`, qui est la source de données.

L'objet de type `Scanner` se charge ensuite du reste.

```java 
Scanner console = new Scanner(System.in); // création de l'objet scanner en passant la source des données
String name = console.nextLine(); // récupération de saisie et stockage dans une variable name 
int age = console.nextInt(); // récupération d'une saisie 
```

#### `scanner.nextLine()` - Récupération d'une string 

Méthode qui permet de récupérer une `String`.

Lorsque le programme atteind cette ligne, il se met en pause et attends la saisie de l'utilisateur. Toutes la saisie sera stocker dans la variable.

```java
Scanner scanner = new Scanner(System.in);
String name = scanner.nextLine();
```

#### `scanner.nextInt()` - Récupération d'un int

Permet de récupérer une saisie de `int`. La saisie sera convertis en `int` Si la saisie ne peut pas être convertis, une erreur se produit.

```java 
Scanner scanner = new Scanner(System.in);
int age = scanner.nextInt();
```

#### `scanner.nextDouble()` - Récupération de float 

Permet de récupérer un nombre à virgule. La saisie sera convertis, et une erreur se lance si la conversion ne peut être réalisée.

```java
Scanner scanner = new Scanner(System.in);
double number = scanner.nextDouble();
```






