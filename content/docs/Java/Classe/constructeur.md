---
date: 2026-06-15T17:31:39+02:00
---
# Constructeur

Méthode spéciale appelée lors de la création d'un nouvel objet. Son rôle est d'initialiser les champs de l'objet avec des valeurs initiales.

Si la classe possède un constructeur avec paramétres, il faut obligatoire les fournis lors de l'instanciation de l'objet.

Si le constructeur est sans paramétre, ou par défautm les parenthéses reste vide.

## Constructeur avec paramétres

Le mot clé `this` permet de faire référence à l'objet courant. De l'interieur, on l'utilise pour distinguer un champ de classe d'un paramètre portant le même nom.

```java
public class Person {
    String name;
    int age;

    // Constructeur avec deux paramètres
    public Person(String name, int age) {
        this.name = name; // this.name — le champ de l'objet, name — le paramètre du constructeur
        this.age = age;
    }
}

// INSTANCIATION 
// on passe les valeurs transmises au constructeur via des arguments à l'instanciation de la classe 
Person peter = new Person("Peter", 25);
```

## Constructeur sans parmètres 

```java
public Person() {
  // les valeurs seront automatiquement passer à l'instance 
  this.name = "Sans nom";
  this.age = 0;
}

// INSTANCIATION 
Person mysteryMan = new Person(); // name="Sans nom", age=0
```
---

## Constructeur par défaut 

Si aucun constructeur n'est déclarer, le compilateur Java ajoute automatiquement un constructeur vide sans paramètres.

Il ressemble à ceci : 

```java
public Person() {
    // ne fait rien, mais permet de créer un objet sans paramètres
}
```

Si, au moins un constructeur est déclaré, alors le constructeur par défaut n'est plus crée automatiquement.

## Exemple: classe compléte

```java
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
}
```

---

## Surcharge de constructeurs 

La surcharge c'est lorsque plusieurs constructeurs sont déclarés dans une même classe, mais avec des paramètres différents (nombre, type, ou ordre). Ils portent tous le même nom que la classe et n'ont pas de type de retour.

Java viens analyser le nombre et le type d'arguments passer après le `new` lors de l'instanciation. Selon ce qui est passer, on utilise le constructeur adapté.

```java
public class Person {
    String name;
    int age;

    // Constructeur sans paramètres (par défaut)
    public Person() {
        this.name = "Inconnu";
        this.age = 0;
    }

    // Constructeur avec un paramètre
    public Person(String name) {
        this.name = name;
        this.age = 0;
    }

    // Constructeur avec deux paramètres
    public Person(String name, int age) {
        this.name = name;
        this.age = age;
    }
}

// UTILISATION ==================================
Person p1 = new Person();                // nom = "Inconnu", âge = 0
Person p2 = new Person("John");         // nom = "John", âge = 0
Person p3 = new Person("Peter", 25);     // nom = "Peter", âge = 25
```

## Appel d'un constructeur depuis un autre constructeur 

Pour éviter de dupliquer le code lorsque l'on utilise la même logique dans chaque constructeur, on peut appeler un constructeur depuis un autre avec le `this()`.

L'appel d'un autre constructeur via `this()` doit être la première ligne du constructeur.

```java
public class Person {
    String name;
    int age;

    // Constructeur avec deux paramètres
    public Person(String name, int age) {
        this.name = name;
        this.age = age;
    }

    // Le constructeur avec un paramètre appelle un autre constructeur
    public Person(String name) {
        this(name, 0); // appelle Person(String name, int age)
    }

    // Le constructeur sans paramètres appelle un autre constructeur
    public Person() {
        this("Inconnu", 0);
    }
}
```