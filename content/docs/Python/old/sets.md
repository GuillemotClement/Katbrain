---
date: 2026-06-09T22:00:28+02:00
---
# Sets

Les sets sont equivalent au liste, mais sont non ordonnée et garantisse l'unicité des valeurs.


```python
fruits = {"apple", "banana", "grape"}
print(type(fruits))
# Prints: <class 'set'>

print(fruits)
# Prints: {'banana', 'grape', 'apple'}
```

On peut utiliser un set pour venir nettoyer une list par exemple.

```python
# on reçoit une list avec des plusieurs valeur identique
def remove_duplicates(spells):
    clean = set() # on init un set 

    # on ajoute dans le set les valeurs de la list
    # les doublons sont automatiquement nettoyer 
    for spell in spells:
        clean.add(spell)

    # on init une nouvelle list
    spell_list = []
    # on envoie les valeurs nettoyer dans la nouvelle liste
    for spell in clean:
        spell_list.append(spell)

    return spell_list
```

---

## `add()`: ajouter une valeur

```python
fruits = {"apple", "banana", "grape"}
fruits.add("pear")
print(fruits)
# Prints: {'pear', 'banana', 'grape', 'apple'}
```

---

## `set()`: création de sets vide 

```python
fruits = set()
fruits.add("pear")
print(fruits)
# Prints: {'pear'}
```

---

## Parcourir 

L'ordre des éléments itéré n'est pas garantis.

```python
fruits = {"apple", "banana", "grape"}
for fruit in fruits:
    print(fruit)
    # Prints:
    # banana
    # grape
    # apple
```

---

## `remove()`: supprimer une valeur 

```python
fruits = {"apple", "banana", "grape"}
fruits.remove("apple")
print(fruits)
# Prints: {'banana', 'grape'}
```

---

## Set soustraction 

On peut venir réaliser des opérations sur des sets. Par exemple, faire une soustraction. Cela viens supprimer toutes les valeurs dans le second set depuis le premier 

```python
set1 = {"apple", "banana", "grape"}
set2 = {"apple", "banana"}
set3 = set1 - set2

print(set3)
# Prints: {'grape'}
```

---

## Conversion list -> set 

On reçoit deux liste. On viens les convertir et la nettoyer
```python
def find_missing_ids(first_ids, second_ids):
    return set(first_ids) - set(second_ids)
```