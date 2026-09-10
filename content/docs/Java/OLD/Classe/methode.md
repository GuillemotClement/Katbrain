---
date: 2026-06-15T17:27:52+02:00
---
# Methode

Fonction qui décrit le comportement d'un objet. Les méthodes permettent à l'objet de faire des actions.

Les méthodes peuvent renvoyer des valeurs, ou ne rien renvoyer.

```java
public void sayHello() {
    System.out.println("Bonjour ! Je m'appelle " + name);
}
```

- `public`: modificateur d'accés
- `class`: indique au compilateur que l'on créer une clase
- `Person`: le nom de la classe.

Une autre méthode qui retoune un `int` 

```java
public int getAge() {
    return age;
}
```