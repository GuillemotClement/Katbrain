---
date: 2026-06-09T20:54:46+02:00
---
# List

Equivalent d'un array. Les données sont stockées avec un index. Il débute à zero.

```python 
inventory = [
  "Iron Breastplate", 
  "Healing Potion", 
  "Leather Scraps"
]
```

---

## Accéder aux éléments

Pour accéder aux éléments d'une liste, on utilise son index 

```python
best_languages = ["JavaScript", "Go", "Rust", "Python", "C"]
print(best_languages[1])
```

---

## Modifier un élément

On peut venir modifier un élément d'une liste 

```python
inventory = ["Leather", "Iron Ore", "Healing Potion"]
inventory[0] = "Leather Armor"
# inventory: ['Leather Armor', 'Iron Ore', 'Healing Potion']
```

---

## `append()`: ajouter à une liste 

Permet d'ajouter un élément dans un liste 

```python 
cards = []
cards.append("nvidia")
cards.append("amd")
# the cards list is now ['nvidia', 'amd']
```

---

## `len()` - longueur d'une liste 

```python
fruits = ["apple", "banana", "pear"]
length = len(fruits)
# 3 items in fruits

len("supercalifragilisticexpialidocious")
# 34 characters
```

---

## `pop()`: supprimer le dernier élément de la liste

Permet de supprimer le dernier élément 

```python
vegetables = ["broccoli", "cabbage", "kale", "tomato"]
last_vegetable = vegetables.pop()
# vegetables = ['broccoli', 'cabbage', 'kale']
# last_vegetable = 'tomato'
```

---

## `del()` - supprimer un élément par son index

```python
nums = [1, 2, 3, 4, 5, 6, 7, 8, 9]

# delete the fourth item
del nums[3]
print(nums)
# Output: [1, 2, 3, 5, 6, 7, 8, 9]

# delete the second item up to (but not including) the fourth item
nums = [1, 2, 3, 4, 5, 6, 7, 8, 9]
del nums[1:3]
print(nums)
# Output: [1, 4, 5, 6, 7, 8, 9]

# delete all elements
nums = [1, 2, 3, 4, 5, 6, 7, 8, 9]
del nums[:]
print(nums)
# Output: []

# supprimer les deux derniers éléments 
del num[-2::]
```

---

## `range()`: parcourir une liste 

```python
for i in range(0, len(sports)):
    print(sports[i])
```

Si les index ne sont pas utile, on peut utiliser la syntaxe courte 

```python 
trees = ['oak', 'pine', 'maple']
for tree in trees:
    print(tree)
# Prints:
# oak
# pine
# maple
```

- `tree`: contient la valeur en cours d'itération 

---

## Trouver les valeurs max et min 

```python
negative_infinity = float("-inf") # -> valeur min
positive_infinity = float("inf") # -> valeur max

def find_max(nums):
    max_so_far = float("-inf") # valeur de départ -infinie 

    for num in nums:
        # on stocke forcémenet la valeur minimal 
        if num > max_so_far:
            max_so_far = num
    return max_so_far
```

---

## `[start:end:step]` - découpage de slice 

```python
# syntaxe 
my_list[ start : stop : step ]

scores = [50, 70, 30, 20, 90, 10, 50]
# Display list
print(scores[1:5:2])
# Prints [70, 20]

numbers = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]

# all depuis le début jusqu'au end non inclus 
numbers[:3] # Gives [0, 1, 2]

# depuis start jusqu'a la fin 
numbers[3:] # Gives [3, 4, 5, 6, 7, 8, 9]

# tous les deux éléments
numbers[::2] # Gives [0, 2, 4, 6, 8]

# obtenir le dernier élément 
numbers[-1] # 9

# obtiens les 3 éléments en partant de la fin 
numbers[-3:] # Gives [7, 8, 9]
```

---

## Fusion de liste 

```python
total = [1, 2, 3] + [4, 5, 6]
print(total)
# Prints: [1, 2, 3, 4, 5, 6]
```

---

## `in` & `not in` - vérifier la présence d'un élément 

```python
fruits = ["apple", "orange", "banana"]

print("banana" in fruits)
# Prints: True

print("banana" not in fruits)
# Prints: False
```

---

## `split()` - conversion string -> list 

Par défaut, se base sur un espace. On peut passer un autre délimiteur en argument

```python
message = "hello there sam"
words = message.split()
print(words)
# Prints: ["hello", "there", "sam"]
```

---

## `join()` - conversion list -> string 

```python
list_of_words = ["hello", "there", "sam"]
sentence = " ".join(list_of_words)
print(sentence)
# Prints: "hello there sam"
```

---

## Tuples 

Les tuples sont des collections de données ordonnée et non modifiable. 

On les utilisent généralement pour stocker de petit ensemble de données.

```python 
my_tuple = ("this is a tuple", 45, True)
print(my_tuple[0])
# this is a tuple
print(my_tuple[1])
# 45
print(my_tuple[2])
# True

# info du chien 
dog = ("Fido", 4)
# tuple un élément 
dog = ("Fido",)
```

Les tuples peuvent être stockée dans une liste 

```python 
my_tuples = [
    ("this is the first tuple in the list", 45, True),
    ("this is the second tuple in the list", 21, False)
]
print(my_tuples[0][0]) # this is the first tuple in the list
print(my_tuples[0][1]) # 45
print(my_tuples[1][0]) # this is the second tuple in the list
print(my_tuples[1][2]) # False
```

Il est possible d'assigner à des variables les valeurs de tuples 

```python 
dog = ("Fido", 4) # déclaration du tuple 
dog_name, dog_age = dog # extraction de valeurs depuis le tuple
print(dog_name)
# Fido
print(dog_age)
# 4
```

--- 
