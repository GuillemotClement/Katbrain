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

--- 

## `var`: inférence de type 

`var` permet d'écrire une valeur, et le compilateur déduit le type.

Ne fonctionne que pour des variables locales, à l'intérieur des méthodes. Il est interdit d'utiliser `var` pour des paramètres de méthodes, des champs de class, des constantes.

Bonne pratiques: 
- quand le type de la variable est évident d'apès la partie de droite 
- quand le type est évident 
- quand le type est trop long ou complexe

```java
var age = 23;            // le compilateur déterminera le type du nombre 23 et substituera int age
var name = "Anna";       // le compilateur déterminera le type de "Anna" et substituera String name
var price = 99.99;       // le compilateur déterminera le type de 99.99 et substituera double price

// exemple avec un tableau 
var numbers = new int[] { 1, 2, 3, 4 };

// exemple avec une méthode 
var input = console.nextLine(); // input est une String (la méthode retourne String)
```
