---
date: 2026-06-11T09:42:53+02:00
---
# Variable

Chaque variable possède son type. Elle est constituée d'un **nom**, d'un **type**, et d'une **valeur**.

```java
// déclaration de variable
int a, b;
String s;
double c;

// affectation de variable => copie
a = 1;
s = "Hello";
c = 7.77;
```

Convention de nommage:

- Ne peux pas commencer par un chiffre
- Ne peut pas être un mot reservé
- Pas de caractère spécieux, sauf `$` et `_`
- La casse est significative
- On utilise le **camelCase**

---

## `null`

Il n'existe pas une valeur par défaut pour chaque type de données. `null` permet de définir une référence vide.
Lorsqu'une variable d'un type objet est crée, sa valeur initiale est `null`: c'est une référence vide.

```java
String name; 	// name contient null
name = "Alex";  // name contient une référence vers l'objet/chaîne "Alex"
name = null; 	// name contient null
```

Il est impossible d'appeler des méthodes sur un objet si sa référene vaut `null`, l'objet n'existe pas.
Cela provoque une erreur.
