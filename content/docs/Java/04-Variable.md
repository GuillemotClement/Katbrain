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
