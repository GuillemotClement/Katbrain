---
---

# Record

Permet de simplifier les classe de DTO.
Les classes DTO sont des classes utiliser pour le stockage de la données.

La classe Record vient gérer :

- les champs `x` et `y` deviennent `private final`
- les getter sont générée automatiquement
- le constructeur est généré automatiquement
- `equals` / `hashCode`: compare les champs par valeur
- `toString`: retourne une chaine du type `Point=[x=1, y=2]`

Tous les champs de la classe record sont automatiquement `final`. Après la création de l'objet, on ne peut plus le modifier. Si on essaie d'ajouter un setter ou de rendre un champ non `final`, le compilateur l'empeche.

Les méthodes d'accés portent ne même nom que les champs.

```java
// classe DTO
public class Client {
    private final String name;
    private final int id;

    public Client(String name, int id) {
        this.name = name;
        this.id = id;
    }

    public String getName() { return name; }
    public int getId() { return id; }

    // equals, hashCode, toString ...
}

// classe Record
public record Client(String name, int id) { }

// utilisation
public class Main {
    public static void main(String[] args) {
        Client client = new Client("Ivan", 123);
        System.out.println(client.name()); // Ivan
        System.out.println(client.id());   // 123
        System.out.println(client);        // Client[name=Ivan, id=123]

        // comparaison, calcul de hash et affichage lisible
        Client c1 = new Client("Anna", 42);
        Client c2 = new Client("Anna", 42);

        System.out.println(c1.equals(c2));                 // true
        System.out.println(c1.hashCode() == c2.hashCode()); // true
        System.out.println(c1);
    }
}
```

## Cas d'usage 

- **DTO**: pour le transfert des données immuables entre les couches de l'application, les services, les microservices, ou les contrôleur REST (transfert de JSON)
- **Value Object**: objets définis uniquement par leur valeurs
- **Clés et valeurs dans les collections** lorsque l'implémentation de `equals` et `hashCode` est importante
- **Résultats de calculs** lorsque l'on doit renvoyer plusieurs valeurs d'une méthodes

---

## Collection et clés

Les objets Record peuvent être utilisés comme clés dans `HashMap`, éléments dans `HashSet`.

```java
public class Solution {
    public static void main(String[] args) {
        // Collection où la clé est l'utilisateur (record) et la valeur est le rôle (chaîne)
        Map<User, String> roles = new HashMap<>();

        // Ajoute plusieurs utilisateurs avec des identifiants uniques et leurs rôles
        roles.put(new User("Alice", 1L), "administrateur");
        roles.put(new User("Bob", 2L), "modérateur");
        roles.put(new User("Eve", 3L), "invité");

        // Crée un nouvel objet utilisateur avec les mêmes données que l'utilisateur déjà ajouté
        User lookup = new User("Bob", 2L);

        // Recherche de son rôle : HashMap utilise equals/hashCode, qui sont générés pour un record à partir des composants
        String role = roles.get(lookup);

        // Affiche le rôle trouvé à l'écran
        System.out.println(role);
    }
}

public record User(String name, long id){}
```

---

## Immutabilité

L'immuabilité c'est la propriété d'un objet selon laquelle son état ne peut pas être modifié après sa création. Les objets immuables protègent le programme contre des modifications accidentielles et rendent le code plus sûr.

- Tous les champs de l'objets sont `final`
- Pas de setter
- Toutes les méthodes qui renvoient des données internes renvoient soit des copies, soit des données elles-même immutables

Les classes `Record` ont été conçues précisement pour créer des stucture de données immutables.



---

## Méthode `equals`, `hashCode`, `toString`

Chaque classe dispose de ses trois méthodes :

- `equals(Object o)` : permet de vérifier l'egalité
- `hashCode()`: donne à l'objet une empreinte numerique utile au collections de type -> table de hachage
- `toString()`: retourne une repésentation textuelles pratique de l'objet

Dans une classe classique, il est nécessaire de l'implémenter à la main. Avec une classe `Record`, ces méthodes sont automatiquement générées.

```java
public record Point(int x, int y) {}

public class Demo {
    public static void main(String[] args) {
        Point p1 = new Point(1, 2);
        Point p2 = new Point(1, 2);

        System.out.println(p1.equals(p2)); // true
        System.out.println(p1.hashCode() == p2.hashCode()); // true
        System.out.println(p1); // Point[x=1, y=2]
    }
}
```

### equals

Cette méthode généré par la classe `Record` permet de vérifier si deux objets sont égaux. Sont considéré comme égaux:

- ils sont du même type
- tous leurs composants sont égaux

```java
public record User(String name, int age) {}

public class Demo {
    public static void main(String[] args) {
        User u1 = new User("Alice", 20);
        User u2 = new User("Alice", 20);
        User u3 = new User("Bob", 25);

        System.out.println(u1.equals(u2)); // true
        System.out.println(u1.equals(u3)); // false

        System.out.println(u1.hashCode() == u2.hashCode()); // true
        System.out.println(u1); // User[name=Alice, age=20]
    }
}
```

### hashCode()

Génère une code de hachage basé sur les champs de la classe `Record`.

Utiliser pour:

- Stocker de manière efficase dans des collections (`HashMap`, `HashSet`)
- Comparer rapidement deux objets
- Implémenter le contrat `equals/hashCode`: si deux objets sont égaux, ils doivent avoir le même hash code.

```java
import java.util.HashMap;
import java.util.Map;

public class Demo {
    public static void main(String[] args) {
        record Point(int x, int y) {}

        Map<Point, String> map = new HashMap<>();

        // ajout d'un objet dans le map
        Point p1 = new Point(3, 4);
        map.put(p1, "Hello!");

        // ajout d'un objet dans le map
        Point p2 = new Point(3, 4);
        System.out.println(map.get(p2)); // "Hello!" — fonctionne !
    }
}

System.out.println(p1.hashCode()); // Par exemple, 994
System.out.println(p2.hashCode()); // Également 994
```

### Redéfinir `toString()`

Dans le cas ou l'on souhaite redéfinir l'affichage des données de la classe Record

```java
public record Point(int x, int y) {
    @Override
    public String toString() {
        return "(" + x + "; " + y + ")";
    }
}

Point p = new Point(3, 5);
System.out.println(p); // (3; 5)
```

### Utilisation avec un HashMap 

```java
import java.util.HashMap;
import java.util.Map;

public class Demo {
    public static void main(String[] args) {
        record User(String name, int age) {}

        Map<User, Integer> visits = new HashMap<>();
        User ivan20 = new User("Ivan", 20);
        User ivan22 = new User("Ivan", 22);

        visits.put(ivan20, 5);
        visits.put(ivan22, 2);

        // Vérifions que la recherche par valeur fonctionne correctement
        System.out.println(visits.get(new User("Ivan", 20))); // 5
        System.out.println(visits.get(new User("Ivan", 22))); // 2
    }
}
```

---

## `Record` avec méthodes

Dans un `Record`, il est possible de déclarer des méthodes ordinaires, des méthodes statique et des constante.

```java
public record Point(int x, int y) {
    // Méthode supplémentaire
    public double distanceTo(Point other) {
        int dx = this.x - other.x;
        int dy = this.y - other.y;
        return Math.sqrt(dx * dx + dy * dy);
    }
}

Point p1 = new Point(0, 0);
Point p2 = new Point(3, 4);
System.out.println(p1.distanceTo(p2)); // 5.0

// méthode statique
public record Rectangle(int width, int height) {
    public int area() {
        return width * height;
    }

    public static Rectangle square(int size) {
        return new Rectangle(size, size);
    }
}

Rectangle r = Rectangle.square(5);
System.out.println(r.area()); // 25
```

### Constructeur compact et validation de données 

Le constructeur compact est crée automatiquement et assigne les paramètres aux champs. Mais parfois, on souhaite ajouter une vérificatition des données d'entrée.

Dans le constructeur, on peut venir ajouter une vérification de valeur :

```java
public record Point(int x, int y) {
    public Point {
        if (x < 0 || y < 0) {
            throw new IllegalArgumentException("Coordinates must be non-negative");
        }
        // Inutile d’écrire : this.x = x; this.y = y;
    }
}

Point p1 = new Point(3, 5); // OK
Point p2 = new Point(-1, 2); // Lève IllegalArgumentException !
```

### Constructeur

Il est possible de créer un constructeur statique dans le `Record` 

```java
public record Range(int from, int to) {
    public Range(int size) {
        this(0, size); // appelle le constructeur principal
    }
}
```

### Implémentation d'interface 

Un `Record` peut venir implémenter une interface 

```java
public interface Printable {
    void print();
}

public record Invoice(int amount) implements Printable {
    @Override
    public void print() {
        System.out.println("Montant : " + amount);
    }
}
```

### Implémentation de champs statique 

```java
public record Person(String name, int age) {
    public static final String SPECIES = "Homo sapiens";
}
````

### Pattern 

**Record avec méthode de calcul**
```java
public record Circle(double x, double y, double radius) {
    public double area() {
        return Math.PI * radius * radius;
    }

    public double distanceTo(Circle other) {
        double dx = x - other.x;
        double dy = y - other.y;
        return Math.sqrt(dx * dx + dy * dy);
    }
}
```

**Record avec validation**
```java
public record Email(String value) {
    public Email {
        if (value == null || !value.contains("@")) {
            throw new IllegalArgumentException("Adresse e-mail invalide : " + value);
        }
    }
}

Email e1 = new Email("test@example.com"); // OK
Email e2 = new Email("not-an-email"); // Lève IllegalArgumentException
```

**Record avec méthode statique supplémentaire**
```java
public record Temperature(double celsius) {
    public static Temperature fromFahrenheit(double fahrenheit) {
        return new Temperature((fahrenheit - 32) * 5 / 9);
    }

    public double toFahrenheit() {
        return celsius * 9 / 5 + 32;
    }
}

Temperature t = Temperature.fromFahrenheit(98.6);
System.out.println(t.celsius()); // 37.0
System.out.println(t.toFahrenheit()); // 98.6
```

**Arrondi automatique**
```java
public record Money(double amount) {
    public Money {
        amount = Math.round(amount * 100) / 100.0; // Arrondir aux centimes
    }
}
```

---