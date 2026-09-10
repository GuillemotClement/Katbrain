---
---

# Interface

Une interface contient des signature de méthode devant être implémanté par une classe.

Une classe peut implémenter plusieurs interface. 

Une interface est un type spécial en Java qui définit un ensemble de méthodes que les classes ayant souscrit à cette interface doivent implémenter.

L'interface đécrit **quoi faire** mais pas **comment faire**. si une classe implémente une interface, elle doit implémenter toutes ces méthodes.

Il est possible d'accrocher plusieurs interface à une classe.

### Syntaxe de déclaration 

Déclaration d'une interface `Movable`. On retrouve une méthode déclarée dedans avec uniquement sa signature. 

Les méthodes d'une interface sont par défaut `public abstract`. L'interface peut contenir des constante `public static final` mais pas de champ ordinaires.

```java
public interface Movable {
    void move(int x, int y);
    int MAX_SPEED = 100; // public static final par défaut
}
```

### Implémentation d'une interface par une classe

La classe implémente l'interface `Movable`. Elle doit implément la méthode définit dans l'interface qu'elle implémente.

```java
public class Robot implements Movable {
    @Override
    public void move(int x, int y) {
        System.out.println("Le robot se déplace vers le point (" + x + ", " + y + ")");
    }
}
```

### Utilisation 

On dispose d'une interface `Movable` et que l'on souhaite plusieurs classes qui puisse se déplacer.

On déclare l'interface

```java
public interface Movable {
    void move(int x, int y);
}
```

On implémente l'interface dans une classe 

```java
public class Robot implements Movable {
    @Override
    public void move(int x, int y) {
        System.out.println("Le robot se déplace vers le point (" + x + ", " + y + ")");
    }
}
```

On utilise l'interface

```java
public class Main {
    public static void main(String[] args) {
        Movable m = new Robot(); // Variable de type interface !
        m.move(10, 20); // Affichera : Le robot se déplace vers le point (10, 20)
    }
}
```

On peut déclarer une variable de type interface `Movable` et lui affecter un objet de classe qui implémente cette interface.

### Interface dans la lib standard Java

- `Comparable<T>` : interface pour comparer des objets
- `Runnable`: interface pour exécuter une thread
- `Serializqble`: interface marqueur indiquant qu'un objet peut être sérialiser
- `List`, `Set`, `Map`: interface de collection

```java
public class Person implements Comparable<Person> {
    String name;
    int age;

    // Constructeur et autres méthodes...

    @Override
    public int compareTo(Person other) {
        return this.age - other.age;
    }
}
```

L'objet `Person` peuvent désormait être trié car ils implémentent l'interface `Comparable`.


---

## Classe qui utilise une interface et une classe abstraite 

```java
public interface Printable {
    void print();
}

public abstract class Machine {
    public void turnOn() {
        System.out.println("La machine est allumée.");
    }

    public abstract void work();
}

public class SmartPrinter extends Machine implements Printable {
    @Override
    public void work() {
        System.out.println("L'imprimante intelligente fonctionne...");
    }

    @Override
    public void print() {
        System.out.println("L'imprimante intelligente imprime...");
    }
}
```
- `Machine` est une classe abstraite 
- `Printable` est une interface

---

## Impléementaton multiple d'interface 

```java
public interface Scannable {
    void scan();
}

public interface Printable {
    void print();
}

public abstract class Machine {
    public void turnOn() {
        System.out.println("La machine est allumée.");
    }

    public abstract void work();
}


public class MultiFunctionPrinter extends Machine implements Printable, Scannable {
    @Override
    public void work() {
        System.out.println("L'imprimante multifonction fonctionne...");
    }

    @Override
    public void print() {
        System.out.println("L'imprimante multifonction imprime...");
    }

    @Override
    public void scan() {
        System.out.println("L'imprimante multifonction numérise...");
    }
}
```

---

## Implémenter plusieurs interface dans une classe 

```java
public interface Movable {
    void move(int x, int y);
}

public interface Soundable {
    void makeSound();
}

public class Dog implements Movable, Soundable {
    private String name;

    public Dog(String name) {
        this.name = name;
    }

    @Override
    public void move(int x, int y) {
        System.out.println(name + " court vers (" + x + ", " + y + ")");
    }

    @Override
    public void makeSound() {
        System.out.println(name + " dit : Wouf wouf !");
    }
}

public class Cat implements Movable, Soundable {
    private String name;

    public Cat(String name) {
        this.name = name;
    }

    @Override
    public void move(int x, int y) {
        System.out.println(name + " se faufile vers (" + x + ", " + y + ")");
    }

    @Override
    public void makeSound() {
        System.out.println(name + " dit : Miaou !");
    }
}
```

On peut ensuite venir créer des fonctions qui prenne une valeur qui implémente l'interface 

```java
// les deux fontions prennent une valeur qui implémente l'interface
public static void testMovable(Movable m) {
    m.move(10, 20);
}

public static void testSoundable(Soundable s) {
    s.makeSound();
}

public static void main(String[] args) {
    Dog rex = new Dog("Rex");
    Cat murka = new Cat("Luna");

    testMovable(rex);       // Rex court vers (10, 20)
    testSoundable(murka);   // Luna dit : Miaou !
}
```

---

## Interface fonctionnelles: `@FunctionallInterface`

Une interface fonctionnelle est une interface qui contient une seule méthode abstraite. Une interface fonctionelle décrit exactement une opération. 

L'annotation `@FunctionallInterface` permet de mnarquer une interface fonctionnelle de manière explicite


```java
@FunctionalInterface
public interface Operation {
    int apply(int a, int b);
}
```

Il est possible d'ajouter des méthodes `default` et `static` autant que l'on souahite.

```java
@FunctionalInterface
public interface FancyOperation {
    int apply(int a, int b);

    default void printInfo() {
        System.out.println("Je suis une opération fancy !");
    }

    static void description() {
        System.out.println("Interface fonctionnelle pour l'arithmétique.");
    }
}
```

### Exemple d'utilisation 

On veut décrire une opération sur deux nombres

```java
@FunctionalInterface
public interface Operation {
    int apply(int a, int b);
}
```

On peut ensuite venir implémenter cette interface de différentes manières 

```java
// implémentation depuis une classe ordinaire
public class SumOperation implements Operation {
    @Override
    public int apply(int a, int b) {
        return a + b;
    }
}

// UTILISATION 
Operation sum = new SumOperation();
System.out.println(sum.apply(2, 3)); // 5

// implémentation depuis une classe anonyme 
Operation multiply = new Operation() {
    @Override
    public int apply(int a, int b) {
        return a * b;
    }
};
System.out.println(multiply.apply(2, 3)); // 6
```

---

## Interface dans l'architecture Java 

En Java, une interface est une contrat. C'est la promesse que toute la classe implémentant l'interface supporte un certain comportement. 

### Couche service et DAO 

On as une interface pour travailler avec les utilisateurs 

```java
public interface UserRepository {
    User findById(int id);
    void save(User user);
}
```

Selon les cas, on peut implémenter cette interface de différentes manières : 
- `DatabaseUserRepository`: stocke les users dans une base de données
- `InMemoryUserRepository`: stocke les utilisateurs en mémoire (test par exemple)
- `FileUserRepository`: enregistre les utilisateurs dans un fichier 

Le code qui travaille avec les utilisateur ne dépend que de l'interface 

```java
public class UserService {
  // implémente l'inface -> on peut utiliser les méthodes sans se préoccuper de l'implémentation 
    private final UserRepository userRepository;

    // Injection de dépendance via le constructeur
    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    public void registerUser(User user) {
      // on peut utiliser les méthode promise par l'interface
        userRepository.save(user);
    }
}
```

### Injection de dépendances 

`DI` ou injection d'interface (Dependency Injection) est un pattern par lequel les dépendances sont fournie à l'objet depuis l'exterieur, généralement via un constructeur ou un setter. Cela permet de construire des applications flexibles, testable et extensible.

Avec les interfaces, on peut fournir n'importe quelle implémentation sans changer le code principal 

```java
public interface NotificationSender {
    void send(String message);
}

public class EmailNotificationSender implements NotificationSender {
    @Override
    public void send(String message) {
        System.out.println("Envoi d'e-mail : " + message);
    }
}

public class SmsNotificationSender implements NotificationSender {
    @Override
    public void send(String message) {
        System.out.println("Envoi de SMS : " + message);
    }
}

// Classe qui utilise NotificationSender
public class NotificationService {
    private final NotificationSender sender;

    // injection de dépendance avec le constructeurt
    public NotificationService(NotificationSender sender) {
        this.sender = sender;
    }

    public void notifyUser(String message) {
        sender.send(message);
    }
}
```

## Pattern 

### Observer 

Pattern qui permet à une objet (le sujet observé) de notifier d'autre objet (les observateur) des changements de son état 

```
+------------------+         +------------------------+
|   Subject        |<------->|   Observer             |
+------------------+         +------------------------+
| +addObserver()   |         | +update()              |
| +removeObserver()|         +------------------------+
| +notifyObservers()|
+------------------+
```

```java
import java.util.ArrayList;
import java.util.List;

// Interface d'observateur
public interface Observer {
    void update(String event);
}

// Interface de sujet
public interface Subject {
    void addObserver(Observer observer);
    void removeObserver(Observer observer);
    void notifyObservers(String event);
}

// Implémentation du sujet
public class NewsAgency implements Subject {
    private List<Observer> observers = new ArrayList<>();

    @Override
    public void addObserver(Observer observer) {
        observers.add(observer);
    }

    @Override
    public void removeObserver(Observer observer) {
        observers.remove(observer);
    }

    @Override
    public void notifyObservers(String event) {
        for (Observer observer : observers) {
            observer.update(event);
        }
    }
}

// Implémentation de l'observateur
public class NewsReader implements Observer {
    private String name;

    public NewsReader(String name) {
        this.name = name;
    }

    @Override
    public void update(String event) {
        System.out.println(name + " a reçu la nouvelle : " + event);
    }
}

// Classe principale pour exécuter l'exemple
public class ObserverExample {
    public static void main(String[] args) {
        // Nous créons une "agence de presse" (sujet)
        NewsAgency agency = new NewsAgency();

        // Nous créons des observateurs
        Observer alice = new NewsReader("Alice");
        Observer bob = new NewsReader("Bob");

        // Nous abonnons les observateurs aux actualités
        agency.addObserver(alice);
        agency.addObserver(bob);

        // Nous envoyons une actualité
        agency.notifyObservers("Une nouvelle version de Java est sortie !");

        // Nous retirons un observateur et envoyons une autre actualité
        agency.removeObserver(bob);
        agency.notifyObservers("Prochaine actualité pour les abonnés");
    }
}
```

### Strategy 

Pattern qui permet de choisir un algo de comportement selon l'exécution, sans modifier le code client

```
+------------------+
|   Context        |
+------------------+
| -strategy: Strat.|
| +setStrategy()   |
| +execute()       |
+------------------+
         |
         v
+------------------+
|   Strategy       |<-------------------------+
+------------------+                          |
| +execute()       |                          |
+------------------+                          |
         ^                                    |
         |                                    |
+------------------+   +------------------+   |
|   ConcreteA      |   |   ConcreteB      |---+
+------------------+   +------------------+
| +execute()       |   | +execute()       |
+------------------+   +------------------+
```

```java
public interface PaymentStrategy {
    void pay(int amount);
}

public class CreditCardPayment implements PaymentStrategy {
    @Override
    public void pay(int amount) {
        System.out.println("Paiement de " + amount + " RUB par carte bancaire");
    }
}

public class PaypalPayment implements PaymentStrategy {
    @Override
    public void pay(int amount) {
        System.out.println("Paiement de " + amount + " RUB via PayPal");
    }
}

public class OnlineStore {
    private PaymentStrategy paymentStrategy;

    public void setPaymentStrategy(PaymentStrategy strategy) {
        this.paymentStrategy = strategy;
    }

    public void checkout(int amount) {
        paymentStrategy.pay(amount);
    }
}

// Utilisation:
OnlineStore store = new OnlineStore();
store.setPaymentStrategy(new CreditCardPayment());
store.checkout(1000);

store.setPaymentStrategy(new PaypalPayment());
store.checkout(500);
```

### Command

Pattern qui encapsule une requête sous forme d'objet, permettant de passer des actions en paramètres.

```java
public interface Command {
    void execute();
}

public class LightOnCommand implements Command {
    @Override
    public void execute() {
        System.out.println("Lumière allumée !");
    }
}

public class LightOffCommand implements Command {
    @Override
    public void execute() {
        System.out.println("Lumière éteinte !");
    }
}

public class RemoteControl {
    private Command command;

    public void setCommand(Command command) {
        this.command = command;
    }

    public void pressButton() {
        command.execute();
    }
}

// Utilisation:
RemoteControl remote = new RemoteControl();
remote.setCommand(new LightOnCommand());
remote.pressButton(); // Lumière allumée !

remote.setCommand(new LightOffCommand());
remote.pressButton(); // Lumière éteinte !
```

--- 

## Expressions lambda 

Une expression lambda est une forme compacte d'écriture de l'implémentation de la méthode abstraite d'une interface fonctionnelle.

Avant Java8, il était nécessaire de créer des classes anonyme pour implémenter un comportement.

```java
// interface fonctionelle 
@FunctionalInterface
interface Operation {
    int apply(int a, int b);
}

// avec une classe anonyme -> ancienne syntaxe
Operation sum = new Operation() {
    @Override
    public void apply(int a, int b) {
        return a + b;
    }
};

// avec expression lambda 
Operation sum = (a, b) -> a + b; // on implémente l'interface et on passe directement l'expression
System.out.println(sum.apply(3, 5)); // 8
```

### Syntaxe 

```java
// syntaxe
(paramètres) -> expression
// ou
(paramètres) -> { bloc de code }

// sans paramètre
Runnable r = () -> System.out.println("Bonjour, lambda!");
r.run();

// parametre
Consumer<String> printer = s -> System.out.println("Vous avez passé: " + s);
printer.accept("Java");

// plusieurs parametres
Comparator<Integer> cmp = (a, b) -> a - b;
System.out.println(cmp.compare(10, 5)); // 5

//corps multi ligne 
// le premier type est le resultat, le second le type du parametre
Function<Integer, Integer> square = x -> {
    int result = x * x;
    return result;
};
System.out.println(square.apply(6)); // 36
```

Le type du paramètre est passer via `<type>` avec le nom du type

### Utilisation avec une interface personnalisée

```java
// interface fonctionnelle
@FunctionalInterface
interface Operation {
    int apply(int a, int b);
}

// ancienne syntaxe
Operation sum = new Operation() {
    @Override
    public void apply(int a, int b) {
        return a + b;
    }
};

// nouvelle syntaxe
Operation sum = (a, b) -> a + b;
System.out.println(sum.apply(3, 5)); // 8
```

### Utilisation avec interface standard

```java
// runnable 
Runnable hello = () -> System.out.println("Hello from thread!");
new Thread(hello).start();

// comparator
List<String> list = Arrays.asList("pomme", "banane", "kiwi");
list.sort((a, b) -> a.length() - b.length());
System.out.println(list);

// function
Function<String, Integer> parse = s -> Integer.parseInt(s);
System.out.println(parse.apply("123")); // 123
```

### Portée et capture des variables 

Les expressions lambda peuvent utiliser des variables de la méthode environnante. Ces variables doivent être **effectively final**, c'est à dire explicitement déclarée `final`, soit simplement non modifiée après leur initialisation.

```java
String prefix = "Résultat: ";
Function<Integer, String> f = x -> prefix + (x * 2);
// prefix est "gelé" ici — après cela on ne peut plus le modifier
System.out.println(f.apply(5)); // Résultat: 10
```

L'expression lambda peut accéder aux champs de la classe externe sans restriction 

```java
public class Counter {
    private int base = 10;

    public void printSum(int x) {
        Function<Integer, Integer> sum = y -> base + y + x;
        System.out.println(sum.apply(5));
    }
}
```

- `base`: peut être modifié -> c'est un champ de classe 
- `x` : doit être final 

### Pattern des expression lambda 

**Filtrage d'une liste de nombre**

```java
List<Integer> nums = Arrays.asList(1, 2, 3, 4, 5, 6);

nums.stream()
    .filter(n -> n % 2 == 0)
    .forEach(n -> System.out.println("Pair: " + n));
```

**Transformation de chaîne**

```java
Function<String, String> capitalize = s -> s.toUpperCase();
System.out.println(capitalize.apply("java")); // JAVA
```

**Interface fonctionelle perso**

```java
@FunctionalInterface
interface StringTransformer {
    String transform(String s);
}

StringTransformer exclaim = s -> s + "!";
System.out.println(exclaim.transform("Salut")); // Salut!
```

**Utilisation de variable du contexte externe**

```java
int factor = 2;
List<Integer> numbers = Arrays.asList(1, 2, 3);
numbers.forEach(n -> System.out.println(n * factor));
// factor ne peut pas être modifié après ça!
```

---

## Références de méthode `::` 

Method reference est une syntaxe spéciale en Java qui permet de transmettre une méthode ou un constructeur existante comme implémentation d'une interface fonctionnelle. On peut passer une méthode là où une expression lambda est attendue si les signatures coincident.

```java
Classe::méthode
objet::méthode
Classe::new
```

Si une lambda est une mini-fonction à la volée, une référence de méthode c'est le passage d'une méthode déjà existante. Au lieu de réécrire une "recette", on donne le lien vers la page qui la contient.

```java
// référence à une méthode statique 
// Classe::methodeStatique 
Function<Integer, String> intToString = String::valueOf;
System.out.println(intToString.apply(123)); // "123"

// référence à une méthode d'instance d'un objet 
// object::methode
PrintStream printer = System.out;
Consumer<String> consumer = printer::println;
consumer.accept("Bonjour, le monde!");

// Référence à une méthode d'instance de classe 
// Classe::méthode
Function<String, Integer> stringLength = String::length;
System.out.println(stringLength.apply("Java")); 

// Référence à un constructeur 
// Classee::new
Supplier<ArrayList<String>> listSupplier = ArrayList::new;
ArrayList<String> list = listSupplier.get();
```

---

## Méthode défault dans les interfaces 

Avant Java 8, une interface était strict: on ne pouvait y déclarer que des méthodes abstraites et des constantes. Lorsque l'on venait ajouter une nouvelle signature dans une interface pour une évolution, cela pouvait casser les projets dependant d'une lib et implémentant cette interface.

Une méthode défault permet d'ajouter une méthode avec implémentation directement dans l'interface. Toutes les anciennes classe reçoivent automatiquement cette implémentation par défaut. 

Il est possible de redéfinir cette méthode.

### Syntaxe 

Une méthode default est une méthode ordinaire avec implémentation dans une interface, et marquée par le mot clé `default`

```java
public interface Movable {
    void move(int x, int y);

    default void reset() {
        // Implémentation typique : retour à l’origine (0,0)
        move(0, 0);
    }
}
```

- Toute les méthodes d'une interface sont par défaut `public` et `abstract`, mais les méthodes défault ne sont pas abstraite: elles ont un corps.
- Le mot clé `default` est toujours écrit avant le type de retour de la méthode.

On peut utiliser de cette manière 

```java
// la classe implémente l'interface
public class Robot implements Movable {
    private int x, y;

    @Override
    public void move(int x, int y) {
        this.x = x;
        this.y = y;
        System.out.println("Le robot a été déplacé vers (" + x + ", " + y + ")");
    }

    // Pas besoin d’implémenter reset() — la version par défaut fonctionnera !
}

// on peut utiliser ensuite 
public class Main {
    public static void main(String[] args) {
        Movable robot = new Robot();
        robot.move(10, 20); // Le robot a été déplacé vers (10, 20)
        robot.reset();      // Le robot a été déplacé vers (0, 0)
    }
}
```

### Conflit et implémentation multiple des interfaces

Si les deux interfaces implémenter par une classe possèdent une méthode `default` avec la même signature, le compilateur exige une résolution explicite du conflit

```java
interface A {
    default void show() { System.out.println("A"); }
}
interface B {
    default void show() { System.out.println("B"); }
}
class C implements A, B {
    @Override
    public void show() {
        // Nous choisissons explicitement quelle méthode default utiliser
        A.super.show(); // ou B.super.show();
    }
}
```

---

## Méthode statique dans les interfaces

Les méthodes statique dans les interfaces sont des méthodes qui appartiennent à l'interface elle-même et pas à ses implémentations. Elle ne nécessitent pas la création d'un objet et sont appelées directement via le nom de l'interface.

### Syntaxe 

Les méthodes statique sont déclarée dans une interface avec le mot clé `static`. Elle peuvent contenir une implémentation et ne peuvent pas être appelées que via le nom de l'interface 

```java
public interface MathUtils {
    static int sum(int a, int b) {
        return a + b;
    }

    static double average(int a, int b) {
        return (a + b) / 2.0;
    }
}

// appel 
int result = MathUtils.sum(5, 7);        // 12
double avg = MathUtils.average(10, 20);  // 15.0
```

### Private static 

Parofois une interface a besoiun de méthodes auxiliaire uniquement pour un usage interne. Depuis Java 9, les interfaces prennent en charge les méthodes `private static`

```java
public interface Logger {
    static void logInfo(String message) {
        log("INFO", message);
    }
    static void logError(String message) {
        log("ERROR", message);
    }
    private static void log(String level, String message) {
        System.out.println("[" + level + "] " + message);
    }
}
```
---


## Interface de la lib standard 

### `Comparable<T>` 

Cet interface permet de définir l'ordre naturel des objets. 

```java
public interface Comparable<T> {
    int compareTo(T o);
}
```

La méthode `compareTo` doit retourner: 
- un nombre négatif si l'objet courant est plus petit que l'autre 
- `0` s'il est égal 
- un nombre positif s'il est plus grand 

On as une classe `Student` et on implémente l'interface `Comparable<Student>` 

```java
public class Student implements Comparable<Student> {
    private String name;
    private int age;

    public Student(String name, int age) {
        this.name = name;
        this.age = age;
    }

    // Getters pour l’exemple
    public String getName() { return name; }
    public int getAge() { return age; }

    @Override
    public int compareTo(Student other) {
        // Tri par âge (ordre croissant)
        return Integer.compare(this.age, other.age);
    }

    @Override
    public String toString() {
        return name + " (" + age + ")";
    }
}
```

On peut maintenant trier facilement un tableau ou une liste d'étudiant 

```java
import java.util.*;

public class Main {
    public static void main(String[] args) {
        List<Student> students = new ArrayList<>();
        students.add(new Student("John", 20));
        students.add(new Student("Peter", 18));
        students.add(new Student("Mary", 22));

        Collections.sort(students); // Fonctionne grâce à Comparable !

        System.out.println("Étudiants triés:");
        for (Student s : students) {
            System.out.println(s);
        }
    }
}
```

### `Serializable`

La serialisation est la capacité d'un objet à se transformer en une séquence d'octet (sauvegarde de fichier, envoie sur le réseau) puis à être restauré. Dans le cas ou l'on souhaite sauvegarder l'etat d'un jeu, ou envoyer un objet au server.

L'interface `Serialize` permet de marquer une classe commme serializable.

```java
import java.io.Serializable;

public class Student implements Serializable {
    private String name;
    private int age;

    // ... reste du code
}
```

Pour sérialiser et deserialiser un objet, on utilise les classes `ObjectOutputStream` et `ObjectInputStream`. Par exemple, on enregistre un objet dans un fichier 

```java
import java.io.*;

public class Main {
    public static void main(String[] args) throws Exception {
        Student s = new Student("Kate", 19);

        // On enregistre l’objet dans un fichier
        try (ObjectOutputStream out = new ObjectOutputStream(new FileOutputStream("student.dat"))) {
            out.writeObject(s);
        }

        // On lit l’objet depuis le fichier
        try (ObjectInputStream in = new ObjectInputStream(new FileInputStream("student.dat"))) {
            Student loaded = (Student) in.readObject();
            System.out.println("Chargé: " + loaded);
        }
    }
}
```

### `Cloneable` 

Interface marqueur. Son rôle est d'indiquer à la JVM qu'un objet peut être cloné via la méthode `Object.clone()`. Sans cela, un appel à `clone()` levera une exception.

Le clonage est superficiel.

```java
public class Student implements Cloneable {
    private String name;
    private int age;

    @Override
    public Object clone() throws CloneNotSupportedException {
        return super.clone();
    }
}
```

