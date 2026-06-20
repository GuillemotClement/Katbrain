---
---

# Interface

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

Permet de créer à la volée une implémentation d'une interface fonctionelle, sans déclarer une classe séparée ni une classe anonyme.

C'est une forme compte d'écriture de l'implémentation de l'unique méthode abstraite d'une interface fonctionelle.

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