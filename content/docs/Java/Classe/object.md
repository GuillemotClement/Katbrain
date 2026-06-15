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
