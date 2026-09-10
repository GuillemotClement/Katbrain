---
date: 2026-06-16T16:28:22+02:00
---
# Generique

Les générics est une syntaxe spéciale permettant de lier une classe ou une méthode à un type de donnée précis dès la compilation.

```java
class Box<Type> {
    private Type value;

    public void set(Type value) {
        this.value = value;
    }

    public Type get() {
        return value;
    }
}
```

- `Type`: paramètre de type. C'est un nom choisit (généralement `T`, `E`, `K`, `V`) et signifie que l'on créer une `Box` et on indique avec quel type on va travailler.

Lorsque l'on travail avec des généric, on indique le type convret entre des chevrons

```java
// Nous avons créé une boîte qui ne fonctionne qu’avec des chaînes
Box<String> stringBox = new Box<>();
stringBox.set("Bonjour, le monde!"); // OK, nous avons mis une chaîne
String s = stringBox.get(); // Récupération de la chaîne sans conversion de type

stringBox.set(123); // Erreur de compilation ! Le compilateur ne le permettra pas.
```