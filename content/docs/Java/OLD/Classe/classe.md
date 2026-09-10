---
date: 2026-06-15T18:23:34+02:00
---

# Classe

Une classe correspond à une plan. Elle permet de créer un modèle qui definit les champs (données) et les actions (méthodes) que ces instances seront pourvu.
Elle permettent:

- regrouper des variables et des méthodes liées
- créer autant d'objet que nécessaire avec la méne structure mais des données différentes.
- décrire facilement des entités complexes

Un objet c'est l'instance de la classe. Chaque objet dispose de ses projets données et comportements.

## Déclaration d'une classe

Une classe est déclarée dans un fichier séparé (une classe, un fichier).

```java
public class Person {
    // déclaration des champs
    String name; // nom de la personne
    int age;     // âge

    // déclaration d'une méthode
    void sayHello() {
        System.out.println("Bonjour, je m'appelle " + name + " !");
    }
}
```

---

## Classes internes

Les classes imbriquées (nested class) sont des classes déclarée à l'intérieur d'une classe.

Si la classe est déclarée sans le modificateur `static`, c'est une classe interne.

Une classe interne est une classe déclarée a l'interieur d'une autre classe liee a une instance de cette classes externe. Elle peux acceder a tous les champs et methodes de la classe externe, meme s'il sont `private`.

C'est un peu comme si l'objet avec son "assistant personnel"

C'est comme si la maison etait la classe externe, et les pieces de la maison, les classes internes.
La piece ne peut pas exister sans la maison, mais elle a acces a ses ressources. Si la maison disparait, la piece egalement. 

Une classe interne ne peut pas contenir de champs ou methodes statiques, a l'exception des constante `static final`. 



**Pourquoi utiliser les classes interne**
- Lien logique: lorsqu'une classe n'est utile que pour fonctionner avec une autre classe et n'as pas de sens en dehors d'elle
- Encapsulation: permet de cacher des details d'implementation sans encombrer l'espace de noms du package 
- Acces aux membre privee: une casse interne peut acceder aux champs et methodes prives de la classe externe 
- Compacite: reduit le nombre de classe parasite au niveau du package

### Déclaration de classe interne 

La classe interne est declarer dans le corps d'une classe, sans le modificateur `static`

```java
class Outer {
    // champs et méthodes de la classe externe

    // declaration de la classe interne
    class Inner {
        // champs et méthodes de la classe interne
        void printHello() {
            System.out.println("Hello from Inner!");
        }
    }
}
```

```
Outer
│
├─ champs/méthodes
│
└─ Inner (classe interne)
      └─ ses propres champs/méthodes
```

---

### Création d'une instance de clase interne 

Une instance de classe interne est toujours liée à un objet précis de la classe externe.

```java
Outer outer = new Outer();             // on crée l’objet de la classe externe
Outer.Inner inner = outer.new Inner(); // on crée la classe interne via l’objet externe !
inner.printHello();                    // Hello from Inner!
```

---

### Utilisation d'une classe interne 

**Modèle sac à dos et objets**

On as une classe `Backpack` qui permet de stocker des objets `Item`. On souhaite que la classe `Item` soit accessible uniquement à l'intérieur de `Backpack`, car en dehors du sac à dos, ces objets ne nous interessent pas.

```java
public class Backpack {
    private String owner;

    public Backpack(String owner) {
        this.owner = owner;
    }

    // Classe interne — l’objet ne peut exister que dans le sac à dos !
    class Item {
        private String name;

        public Item(String name) {
            this.name = name;
        }

        public void printInfo() {
            // Magique ! On voit le champ private de la classe externe
            System.out.println(owner + " a l’objet : " + name);
        }
    }
}


// UTILISATION 
Backpack bp = new Backpack("John");
Backpack.Item item = bp.new Item("Manuel Java");
item.printInfo(); // John a l’objet : Manuel Java
```

**Itérateur pour sa propre collection**

En Java, les collections implémentent souvent un itérateur en tant que classe interne. 

```java
public class IntList {
    private int[] data = new int[10];
    private int size = 0;

    public void add(int value) {
        data[size++] = value;
    }

    // Classe interne — itérateur !
    class Iterator {
        private int index = 0;

        public boolean hasNext() {
            return index < size;
        }

        public int next() {
            return data[index++];
        }
    }
}

// UTILIATION 
IntList list = new IntList();
list.add(10);
list.add(20);

IntList.Iterator it = list.new Iterator();
while (it.hasNext()) {
    System.out.println(it.next());
}
```

---

## Classes imbriquées static

Classe déclaré à l'interieur d'une classe avec `static`. Elle n'est pas liée a son objet.

Elle n'as pas d'accès aux membres non statique de la classe externe, peut contenir des membres statique et se créer sans objet de la classe externe.

### Déclaration 

```java
class Outer {
    static class Nested {
        void print() {
            System.out.println("Hello from Nested!");
        }
    }
}
```

### Création d'instance 

La classe imbriqué statique n'as acces qu'aux membres statique de la classe externe.

```java
class Outer {
    private static int staticValue = 10;
    private int instanceValue = 20;

    static class Nested {
        void show() {
            System.out.println("Static value: " + staticValue); // OK
            // System.out.println("Instance value: " + instanceValue); // Erreur !
        }
    }
}
```

### Utilisation 

**Pattern builder**

Une classe `Person` et on souhaite implémenter pour elle le pattern `Builder`.

Le `Builder` ne dépend pas de l'objet `Person`, il aide seulement à le créer

```java
public class Person {
    private final String name;
    private final int age;

    // Constructeur privé
    private Person(Builder builder) {
        this.name = builder.name;
        this.age = builder.age;
    }

    // Classe imbriquée statique Builder
    public static class Builder {
        private String name;
        private int age;

        public Builder setName(String name) {
            this.name = name;
            return this;
        }

        public Builder setAge(int age) {
            this.age = age;
            return this;
        }

        public Person build() {
            return new Person(this);
        }
    }

    public void printInfo() {
        System.out.println("Person: " + name + ", " + age);
    }
}

// UTILISATION
Person person = new Person.Builder()
    .setName("John")
    .setAge(30)
    .build();

person.printInfo(); // Person: John, 30
```

**Structure auxiliaire dans une collection**
```java
public class IntBox {
    private Node head;

    // Classe statique imbriquée
    private static class Node {
        int value;
        Node next;

        Node(int value) {
            this.value = value;
        }
    }

    public void add(int value) {
        Node node = new Node(value);
        node.next = head;
        head = node;
    }

    public void printAll() {
        Node current = head;
        while (current != null) {
            System.out.println(current.value);
            current = current.next;
        }
    }
}

// UTILISATION
IntBox box = new IntBox();
box.add(1);
box.add(2);
box.add(3);
box.printAll(); // 3 2 1
```
**Classe utilitaire à l'intérieur de la principale**

```java
public class MathUtils {
    // Classe imbriquée statique pour travailler avec les nombres complexes
    public static class Complex {
        private final double re;
        private final double im;

        public Complex(double re, double im) {
            this.re = re;
            this.im = im;
        }

        public Complex add(Complex other) {
            return new Complex(this.re + other.re, this.im + other.im);
        }

        @Override
        public String toString() {
            return re + " + " + im + "i";
        }
    }
}

// utilisation 
MathUtils.Complex a = new MathUtils.Complex(1, 2);
MathUtils.Complex b = new MathUtils.Complex(3, 4);
MathUtils.Complex sum = a.add(b);
System.out.println(sum); // 4.0 + 6.0i
```

