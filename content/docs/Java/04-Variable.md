# 04 Variable 

## Adressage mémoire 

Chaque programme est chargé en mémoire vive avant son exécution. La RAM contient le code du programme, et les données du programme.

La mémoire d'un ordinateur est organisé comme un tableau excel. Chaque cellule contient un numéro unique. En connaissant ce numéro unique, il est possible d'accéder à la valeur, écrire dans cet emplacement, ...

Le programme et ses données sont stockées en mémoire pendant son exécution. Toutes la mémoire du pc est représentée sous forme de petite case - des octets. Chaque case à son numéro unique.

Lorsqu'une variable est déclaré dans le code du programme, un bloc mémoire libre lui est alloué. Selon le type de la variable, la taille de l'emplacement mémoire varie.

---

## `String` en mémoire 

Le type `String` est capable de contenir de grands volumes de données. Ce n'est pas un simple type de données, mais un objet.

Les données de type `String` sont placée dans un objet spéciale pour lequel de la mémoire est allouée. L'adresse de cet objet est placé dans la variable, pour laquelle de la mémoire est également allouée.

```java
String s1 = "Hello";
String s2 = s1;
s2 = s2 + " World";
System.out.println(s1); // "Hello"
System.out.println(s2); // "Hello World"
```

Les deux variables `s1` et `s2` référencent la même chaîne jusqu'au moment de la modification. Lorsque l'on vient faire la concaténation, une nouvelle chaîne est créer pour `s2`, tant dis que `s1` pointe toujours vers l'ancienne string.

---

## Inférence de type - `var`

`var` permet d'utiliser l'inférence de type. Le compilateur déduit automatiquement le type depuis la valeur d'une variable.

Le mot clé ne fonctionne que pour des variables dans des méthodes. Il est interdit de l'utiliser pour les paramètres de méthode, les champs de classe et les constante.

```java 
var age = 23;            // le compilateur déterminera le type du nombre 23 et substituera int age
var name = "Anna";       // le compilateur déterminera le type de "Anna" et substituera String name
var price = 99.99;       // le compilateur déterminera le type de 99.99 et substituera double price
```

`var` est utiliser:
- Quand le type de la valeur est évident 
- Quand le type est trop long, par exemple `HashMap<Integer, List<Calendar>>`

---

## Constante 

### `final` - Constante 

Le modificateur `final` permet de déclarer une constante. Une fois déclarée, une constante ne peut pas être modifée.

La valeur ne champ ne peut pas être modifiée aprés initialisation mais chaque objet à sa propre valeur.

```java 
final int DAYS_IN_WEEK = 7;
final double PI = 3.1415926535;
final String GREETING = "Salut, Java!";
```

---

### `static final` - constante de classe 

`static final` permet de déclarer une constante au niveau de la classe. On les déclares au niveau de la classe. Une seule constante pour toute la classe, indépendante des objets.

```java 
// ===============================
// exemple de d'utilisation 
// ===============================
public class MathUtils
{
    public static final double PI = 3.1415926535;

    public static double circleLength(double radius)
    {
        return 2 * PI * radius;
    }
}

// appel 
double len = MathUtils.circleLength(5);
System.out.println(len); // 31.4159...
```

---

### Différence entre static et static final 

```java 
// ======================================
// déclaration d'une classe avec des constantes
// ======================================
public class User
{
    public final String name;                      // Chaque User a son propre nom (final)
    public static final String COMPANY = "CodeGym"; // Une entreprise commune à tous (static final)

    public User(String name)
    {
        this.name = name;
    }
}

// =========================================
// utilisation de la classe 
// =========================================

User u1 = new User("John");
User u2 = new User("Peter");

System.out.println(u1.name);      // John
System.out.println(u2.name);      // Peter
System.out.println(User.COMPANY); // CodeGym
```

---

## Enum 

Un enum est un type de donnée spécial qui permet de déclarer un ensemble de constantes nommées. Chaque constante est associé à un nombre.

### Syntaxe de déclaration 

```java 
// =============================
// syntaxe 
// =============================
public enum Name
{
    CONSTANT1 ,
    CONSTANT2 ,
    CONSTANT3
}

// ================================
// enumération de jours 
// ================================
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

### Utilisation 

#### Déclaration d'une variable enum 

```java 
// =============================
// déclaration d'une varaible enum 
// =============================
DayOfWeek today = DayOfWeek.MONDAY;
```

`today` ne peut prendre qu'une valeur déclarée dans l'enum `DayOfWeek`.

#### Utilisation dans un switch 

```java 
// =============================
// utilisation avec switch 
// =============================
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

Dans le case, on écrit le nom de la constante de l'enum si le type de la variable est connu du compilateur.

### Itération des valeurs d'enum 

Chaque enum possède une méthode statique `values()` qui retourne un tableau de ses valeurs 

```java 
for (DayOfWeek day : DayOfWeek.values())
{
    System.out.println(day);
}
```

### Méthodes des enum 

#### `name()` - retourne le nom de la constante sous forme de String 

```java 
DayOfWeek day = DayOfWeek.FRIDAY;
System.out.println(day.name()); // "FRIDAY"
```

#### `ordinal()` - retourne indice ordinal de la constante 

```java 
System.out.println(DayOfWeek.MONDAY.ordinal()); // 0
System.out.println(DayOfWeek.FRIDAY.ordinal()); // 4
```

#### `valueOf(String name)` 

La méthode convertit une String en valeur d'enum. Si la String ne corresond pas, une exception `IllegalArgumentException` est levée.

```java 
DayOfWeek day = DayOfWeek.valueOf("MONDAY");
System.out.println(day); // MONDAY
```

### Enum avec champs, constructeur et méthode 

Il est possible d'enricher un enum avec des champs, des constructeurs, des méthodes. 

#### Jour de la semaine avec nom localisée 

```java 
public enum DayOfWeek
{
    // déclaration des constantes de l'enum 
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

// ======================
// utilisation 
// ======================
DayOfWeek day = DayOfWeek.WEDNESDAY;
System.out.println(day.getRussianName()); // "Mercredi"
```

---

## Switch moderne 

Switch à évoluer avec Java14. Il peut désormais retourner une expression, il utilise une syntaxe avec des flêches, le compilateur vérifie que les cas sont couvert.

```java 
// =========================
// syntaxe 
// =========================
switch (value)
{
   case A, B -> result1;
   case C -> {
      // plusieurs actions
      yield result2;
   }
   default -> defaultResult;
}

// ============================
// exemple d'utilisation 
// ============================
DayOfWeek day = DayOfWeek.MONDAY;

String message = switch (day)
{
    case MONDAY, FRIDAY, SUNDAY -> "Semaine courte ou jour de repos !";
    case TUESDAY                -> "Le mardi — une journée difficile.";
    case WEDNESDAY, THURSDAY    -> "Milieu de semaine !";
    case SATURDAY               -> "Youpi, samedi !";
    // default est obligatoire si toutes les possibilités ne sont pas couvertes
    default                     -> "Jour plutôt étrange...";
};

System.out.println(message);
```

- `switch(day)`: expression qui retourne une valeur 
- Aprés la fléche `->`, on indique le résultat pour ce `case`
- Plusieurs `case` peuvent être regroupé avec une virgule 
- Il n'y a plus de `break`
- On peut affecter directement le résultat dans une variable `message`


### Pattern 

#### Nombre

```java 
int code = 404;
String result = switch (code)
{
    case 200 -> "OK";
    case 400, 404 -> "Erreur côté client";
    case 500 -> "Erreur serveur";
    default -> "Code inconnu";
};
System.out.println(result);
```

#### String 

```java 
String command = "start";
String status = switch (command)
{
    case "start" -> "Démarrage !";
    case "stop" -> "Arrêt !";
    case "pause" -> "Pause...";
    default -> "Commande inconnue";
};
System.out.println(status);
```

#### Enum 

```java 
enum DayOfWeek
{
    MONDAY, TUESDAY, WEDNESDAY, THURSDAY, FRIDAY, SATURDAY, SUNDAY
}

DayOfWeek today = DayOfWeek.WEDNESDAY;

String mood = switch (today)
{
    case MONDAY -> "Difficile de se lever...";
    case FRIDAY -> "Le week-end approche !";
    case SATURDAY, SUNDAY -> "Youpi, repos !";
    default -> "Jour ouvré.";
};
System.out.println(mood);
```

### `yield`

Il est parfois nécessaire d'exécuter plusieurs actions pour un même `case`. On peut alors utiliser un bloc et le mot clé `yield`.

`yiel` permet d'indiquer la valeur qui sera retourner.

```java 
int n = 7;
String parity = switch (n % 2)
{
    case 0 -> "Pair";
    case 1 ->
    {
        System.out.println("Nombre impair détecté : " + n);
        yield "Impair";
    }
    default -> "Quelque chose d'étrange";
};
System.out.println(parity);
```

