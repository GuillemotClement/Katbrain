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

## Variables de référence
