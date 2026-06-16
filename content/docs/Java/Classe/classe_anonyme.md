---
date: 2026-06-16T16:17:20+02:00
---
# Classe_anonyme

Classes sans nom déclarées et crées directement à l'endroit où elles sont utilisées.

Elle permettent d'étendre une classe à la volée sans créer de fichier séparé.

Au lieu de multiplier de nombreux petits fichiers de classes utilisées dans un seul endroit, on peut venir écrire toute la logique là où elle est nécessaire.

## Syntaxe 

```java
VariableType variableName = new TypeToInherit() {
    // Ici, nous écrivons le corps de la classe anonyme
    // Nous redéfinissons les méthodes de la classe parente
};
```

- `new TypeToInherit`: on utilise le nom de la classe que l'on souhaite étendre.

```java
class Animal {
    void say() {
        System.out.println("L'animal émet un son");
    }
}

// Nous créons une classe anonyme en étendant Animal
Animal dog = new Animal() {
    // Nous redéfinissons la méthode say()
    @Override
    void say() {
        System.out.println("Ouaf-ouaf ! 🐶");
    }
};

Animal cat = new Animal() {
    @Override
    void say() {
        System.out.println("Miaou-miaou ! 🐱");
    }
};

dog.say(); // Affichera : Ouaf-ouaf ! 🐶
cat.say(); // Affichera : Miaou-miaou ! 🐱
```

## Caractéristique 

Une classe anonyme peut utiliser des variables de la méthode qui l'entoure. Ces variables doivent être `final`.

Une classe anonyme n'as pas de constructeur. Il est possible d'utiliser un bloc d'initialisation.

Une classe anonyme ne peut pas déclarer de champs statique ou de méthode statique. Elles sont toujours crées comme partie d'un autre objet.