# Classe et objet 

## Classe 

"Plan" qui définit les champs et méthodes qu'auront une instance "objet".

Une classe permet de représenter une données. Elle permettent de créer des "conteneurs" de données et de fonctions. Cela permet de décrire des entités utiliser dans un programme: clients, produits, comptes, commandes, etc 

### Déclaration 

Une classe est déclarée dans un fichier séparée, un fichier = une classe. Le nom du fichier doit être le même que le nom de la classe. Par exemple `Person.java` pour une classe `Person`.

- Le nom de la classe doit commencer par une majuscule 
- Le nom de la classe ne peut pas contenir d'espaces ou de caractère spéciaux
- CamelCase

```java 
public class Person {
    // Ici, il y aura des champs et des méthodes
}
```

### Champs 

Les champs permettent de décrire les données que possède cette classe. C'est une variables déclarée dans une classe, mais en dehors d'une méthode. Ils garantissent que chaque objet possède sont propre état.

```java 
public class Person {
    String name; // nom de la personne
    int age;     // âge
}
```

### Méthodes 

Les méthodes décrivent ce que peut réaliser l'instance de cette classe.

C'est une fonction qui décrite le comportement d'un objet. Les méthodes permettent à une objet de faire quelque chose.

```java 
public class Person {
    String name;
    int age;

    void sayHello() {
        System.out.println("Bonjour, je m'appelle " + name + " !");
    }
}
```

#### Exemple BankAccount

On vient déclarer une nouvelle classe qui représente des comptes bancaire. 

```java 
// BankAccount.java

public class BankAccount {
    String owner;     // propriétaire du compte
    int balance;      // solde du compte

    void printInfo() {
        System.out.println("Propriétaire: " + owner + ", solde: " + balance + " euros.");
    }
}
```

On peut ensuite venir l'utiliser dans la méthode `main` 

```java 
public class Main {
    public static void main(String[] args) {
        BankAccount account1 = new BankAccount();
        account1.owner = "John";
        account1.balance = 1000;
        account1.printInfo(); // Propriétaire: John, solde: 1000 euros.

        BankAccount account2 = new BankAccount();
        account2.owner = "Maria";
        account2.balance = 2000;
        account2.printInfo(); // Propriétaire: Maria, solde: 2000 euros.
    }
}
```

---

## Objet 

Instance d'une classe. Chaque objet ayant son propre état et comportement. Chaque objet peut effectuer les actions définies dans la classe.

### Création d'un objet 

```java 
Person john = new Person();
```

- `Person` - Type de la variable, il correspond à la classe 
- `john` - Nom de la variable 
- `new Person()` - création d'une instance de la classe 

Il est possible de créer autant d'objet que nécessaire. chacun sera une copie indépendante avec ces propres données.

### Accès aux champs et méthodes 

On utilise un point pour accéder aux champs et méthodes.

```java 
john.name = "John";
john.age = 25;

john.sayHello(); // Affichera: Bonjour, je m'appelle John !
```

---

## Modificateurs d'accès 

Les champs peuvent être `public` ou `private`. Généralement, on passe les champs en `private` pour empêcher d'y accéder directement depuis d'autres classes. Cela fait partie du principe d'encapsulation.

```java 
public class Person {
    private String name;
    private int age;
}
```

---

## Constructeur 

Méthode spéciale appelée lors de la création d'un nouvel objet. Son rôle est d'initialiser les champs de l'objet avec des valeurs initiales.

- Le nom du constructeur coïncide toujours avec le nom de la classe 
- Il n'as pas de type de retour 
- Les constructeurs peuvent prendre des paramètres ou aucun 

`this` permet de faire référence à l'objet courant. Il permet de faire référence à un champ ou une méthode de l'instance en cours, depuis l'intérieur.

```java 
// ==================================
// classe avec constructeur 
// ==================================
public class Person {
    private String name;
    private int age;

    // Constructeur
    public Person(String name, int age) {
        this.name = name;
        this.age = age;
    }

    // Méthode : dire bonjour
    public void sayHello() {
        System.out.println("Bonjour ! Je m'appelle " + name + ", j'ai " + age + " ans.");
    }

    // Méthode : augmenter l'âge de 1
    public void haveBirthday() {
        age = age + 1;
        System.out.println("Hourra ! J'ai maintenant " + age + " ans !");
}

// ===================================
// utilisation 
// ===================================
public class Main {
    public static void main(String[] args) {
        Person john = new Person("John", 18);
        john.sayHello();      // Bonjour ! Je m'appelle John, j'ai 18 ans.
        john.haveBirthday();  // Hourra ! J'ai maintenant 19 ans !
    }
}
```

### Constructeur par défaut 

Si aucune constructeur n'est déclarée, Java ajoute automatiquement un constructeur vide sans paramètre. Il ressemble à ça : 

```java 
public Person() {
    // ne fait rien, mais permet de créer un objet sans paramètres
}
```

Si une constructeur est déclaré, alors il n'est pas créer automatiquement, et doit être déclarée explicitement si nécessaire.
