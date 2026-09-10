---
date: 2026-06-16T06:25:53+02:00
---
# Encapsulation

L'encapsulation c'est la capacité de cacher l'intérieur d'un objet et de n'y doonner accès que par des méthodes publique.

L'encapsulation est obtenue avec:
- **masquage des données**: les champs de classes sont déclarée `private`
- **interface publique**: on expose vers l'extérieur uniquement le méthodes réellement nécessaire à l'utilisateur de l'objet

```
+-------------------------------+
|         Classe Student        |
|-------------------------------|
| - name: String                |  // champ private
| - age: int                    |  // champ private
|-------------------------------|
| + getName(): String           |  // méthode public
| + setName(String): void       |  // méthode public
| + getAge(): int               |  // méthode public
| + setAge(int): void           |  // méthode public
+-------------------------------+
```

- `+`: indique `public` et accessible depuis l'extérieur 
- `-`: indique `private` et caché de l'extérieur

## Intéret de l'encapsulation 

**Protection des donées contre une utilisation incorrect**
Si tous les champs d'une classe étaient en `public`, n'importe quel code externe pourrait modifier directement leurs valeurs n'importe comment. Cela peut faire devenir le programme imprévisible et faire apparaitre des bug.

**Possibilité de modifier l'implémentation interne sans impacter le code externe**
L'encapsulation permet de modifier l'organisation interne d'une classe sans casser le code qui l'utilise. Par exemple, on peut changer la façon de stocker les données ou ajouter de la validation dans les méthodes, et les utilisateurs de la classe ne verront rien: ils continuent d'appeler les méthodes

**Amélioration de la lisibilité et maintenabilité du code**
Lorsque les détails internes sont cachées, l'interface externe est plus simple et lisible. Le développeur qui vient utiliser la classe n'a pas besoin de comprendre son fonctionnement interne, il suffit de connaitre les méthodes disponibles.

## Bonnes pratiques

- Un champ doit être en lecture seule => pas de setter
- un champ n'as pas forcémenet besoin d'être exposer. Dans ce cas, pas de getter ni de setter
- on peut rendre un setter private si la valeur du champ ne doit être modifier que dans l'interieur de la calsse.