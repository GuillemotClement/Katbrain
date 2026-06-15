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