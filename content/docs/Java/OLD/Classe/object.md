---
date: 2026-06-15T18:22:38+02:00
---

# Object

En Java, pour créer un objet depuis une classe, on utilise `new`.

```java
// impléntation de la classe Person
public class Person {
    // champs
    String name;
    int age;

    // constructeur
    public Person(String name, int age) {
        this.name = name;
        this.age = age;
    }

    public void sayHello() { // méthode
        System.out.println("Bonjour, je m'appelle " + name + " !");
    }
}

// UTILISATION
Person john = new Person("John", 30);
john.sayHello(); // Bonjour, je m'appelle John !
```

Lorsque l'on instancie un nouvelle objet, une zone mémoire est allouée pour les champs de l'objet. Et la variable `john` contient une référence de la zone.

---

## Ordre d'initialisation d'objet 

### Initialisation des champs 

**Valeurs par défaut**
Lorsque l'objet vient d'être crée, et avant toute affectation explicite, les champs reçoivent une valeur par défaut.

**Initialisation explicite**
Si lors de la déclaration des champs dans la classe, on lui assigne une valeur directement, celle-ci sera établie après les valeurs par défaut, mais avant l'exécution du constructeur.
```java
public class Person {
    private String name = "Sans nom";
    private int age = 18;
}
```

Si l'objet est créer avec un constructeur vide, ce sont ces valeurs qui seront utilisées. 

### Blocs d'initialisation 

En Java, on peut déclarer des bloc d'initialisation d'instance (non statique). Ils s'éxécutent à chaque fois qu'un objet est crée, juste après l'initialisation des champs, mais avant le constructeurs.
Si la classe contient plusieurs blocs de ce type, il s'exécute dans l'ordre où il sont écrits.

```java
public class Person {
    private String name = "Sans nom";

    // bloc d'initialisation multiple
    {
        System.out.println("Bloc 1: name = " + name);
        name = "Énigme";
    }

    {
        System.out.println("Bloc 2: name = " + name);
    }

    public Person() {
        System.out.println("Constructeur: name = " + name);
    }
}
```

Si on crée un objet : 
```java
Person p = new Person();

// sortie 
Bloc 1: name = Sans nom
Bloc 2: name = Énigme
Constructeur: name = Énigme
```

### Constructeurs 

Une fois que tous les champs ont reçus leur valeurs (par défaut ou explicites), et que tous les blocs d'initialisaiton ont été exécuté, le **constructeur** est appelé.
