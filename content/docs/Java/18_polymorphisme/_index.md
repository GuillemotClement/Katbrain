---

---

# Polymorphisme

Le polymorphisme est la capacité d'objets de classes différentes à réagir différemment aux même messages (appels de méthodes).

Par exemple, une méthode `makeSound()` que l'on peut appeler sur n'importe quel animal. Chaque animal à sa propre façon de faire du bruit. Pour le développeur, ce n'est qu'un appel ä `animal.makeSound()` mais ce qui se passe dépent du type effectif de l'objet référencer par cette variable.

---

## Types de polymorphisme

En Java, il existe plusieurs types de polymorphisme

### Polymorphisme de compilation - `overloading`

Il s'agit du cas où une classe contient plusieurs méthodes portant le même nom mais ayant des paramètres différents. Le compilateur décide lui même quelle méthode appeler en fonction des arguments fournis.

```java
class Printer {
    void print(int x) {
        System.out.println("Nombre : " + x);
    }

    void print(String s) {
        System.out.println("Chaîne : " + s);
    }
}
```

### Polymorphisme d'exécution - `overriding`

Un comportement défini dans la classe parent est redéfinis dans les sous classes. La méthode effectivement apelée est choisit à l'exécution, selon le type effectif de l'objet.

```java
class Animal {
    void makeSound() {
        System.out.println("Un son quelconque...");
    }
}

// chaque sous classe viens modifier le comportement initial
class Dog extends Animal {
    @Override
    void makeSound() {
        System.out.println("Ouaf !");
    }
}

class Cat extends Animal {
    @Override
    void makeSound() {
        System.out.println("Miaou !");
    }
}

class Cow extends Animal {
    @Override
    void makeSound() {
        System.out.println("Meuh !");
    }
}

// utilisation
Animal animal1 = new Dog();
Animal animal2 = new Cat();
Animal animal3 = new Cow();

animal1.makeSound(); // Ouaf !
animal2.makeSound(); // Miaou !
animal3.makeSound(); // Meuh !
```

---

## Intéret du polymorphisme

Le polymorphisme permet de rendre le code flexible, extensible et facile à maintenir.

Il permet d'écrire du code qui travail avec des objets du type de base, sans avoir à se soucier des détails de leur implémentation Par exemple, avec une liste d'animaux, on peut venir itérer et appeler `makeSound()` sur chacun, sans avoir besoin de se demander quel est le type d'animal

```java
Animal[] animals = { new Dog(), new Cat(), new Cow() };

for (Animal animal : animals) {
    animal.makeSound(); // À chaque fois, c’est la « bonne » méthode qui sera appelée
}
```

Cela permet de simplifier les extension. Par exemple, on souhaite ajouter un animal, on viens étendre la classe parent. Tout le restee reste inchangée. C'est le principe ouvert à l'extension et fermé à la modification.

---

## Surcharge de méthode

La surcharge de méthode est la possibilité de déclarer dans une mêne classe plusieurs méthodes portant le même nom mais avec des listes de paramètres différentes (type, nombre ou ordre des arguments). Lorsque l'on appelle ce type de méthodem le compilateur décide lui-même quelle version utiliser en fonction des arguments transmis.

La surcharge se distingue uniquement par la liste de paramètres.

```java
public class Printer {
    // Affichage d'un entier
    void print(int x) {
        System.out.println("int: " + x);
    }

    // Affichage d'une chaîne
    void print(String s) {
        System.out.println("String: " + s);
    }

    // Affichage de deux nombres
    void print(int x, int y) {
        System.out.println("int, int: " + x + ", " + y);
    }
}

// utilisation 
Printer printer = new Printer();
printer.print(42);           // appellera print(int x)
printer.print("Hello!");     // appellera print(String s)
printer.print(5, 10);        // appellera print(int x, int y)
```

---

## Surcharge des constructeurs

Il est également possible de faire une surcharge des constructeurs 

```java
public class Person {
    String name;
    int age;

    // Constructeur avec uniquement le nom
    public Person(String name) {
        this.name = name;
        this.age = 0; // par défaut
    }

    // Constructeur avec nom et âge
    public Person(String name, int age) {
        this.name = name;
        this.age = age;
    }
}

// utilisation 
Person p1 = new Person("Anna");
Person p2 = new Person("Boris", 25);
```

---

## Surcharge et varargs (nombre variable d'arguments)

Il est possible de déclarer une méthode avec un nombre variable de paramètres avec `...`

```java
void printAll(String... messages) {
    for (String msg : messages) {
        System.out.println(msg);
    }
}

// utilisation 
printAll("Hello");
printAll("One", "Two", "Three");
```

---

## Redéfinition de méthode

La redéfinition est possible dans les classes enfant. Elle pernet d'écrire sa propre implémentation de méthode déjà présente dans la classe parent.

```java
class Animal {
    void makeSound() {
        System.out.println("L’animal émet un son");
    }
}

class Dog extends Animal {
    @Override
    void makeSound() {
        System.out.println("Ouaf !");
    }
}

class Cat extends Animal {
    @Override
    void makeSound() {
        System.out.println("Miaou !");
    }
}
```

--- 

## Utilisation du polymorphisme 

### Polymorphisme dans les collections 

On peut avoir une classe `Animal` avec un ensemble de classe enfant: `Cat`, `Dog`, `Cow` ...

Au lieu de créer des tabeaux séparés pour chaque animal, on peut déclarer un tableau de type `Animal` et y placer des objets de chaque type.

```java
Animal[] animals = {
    new Dog(),
    new Cat(),
    new Cow(),
    new Parrot()
};
```

On peut ensuite venir itérer ce tableau, et appeller la méthode de chaque classe 

```java
for (Animal animal : animals) {
    animal.makeSound();
}
```

---

