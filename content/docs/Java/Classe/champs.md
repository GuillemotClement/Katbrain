---
date: 2026-06-15T16:45:36+02:00
---
# Champs

Variable déclaré dans une classe, mais en dehors des méthodes.

Les champs garantissent qu'un objet possède son propre état.

## Déclaration d'un champ 

```java
public class Person {
    String name;
    int age;
}
```

---

## Modificateur d'accès 

Les champs peuvent être `private` ou `public`. 

Généralement, on passe les champs d'une classe en privée, pour empêcher d'y accéder depuis d'autres classes. Cela fait partie du principie d'encapsulation.

```java
public class Person {
    private String name;
    private int age;
}
```

