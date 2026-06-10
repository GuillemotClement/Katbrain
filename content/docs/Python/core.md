---
date: 2026-06-09T20:47:50+02:00
---
# Core

## Affichage 

```python 
print("mon texte a afficher")

# print for debug 
def unlock_achievement(before_xp, ach_xp, ach_name):
    after_xp = before_xp - ach_xp
    print("After xp:", after_xp) # print la string + la valeur 
    return None, None # placeholder during debug
```

---

## Commentaire 

```python 
# one line 

"""
  multi-line
"""
```

---

## Variable

En python, la convention est d'utiliser la **Snake Case**. Tout en minuscule, et un `_` pour séparer les mots.

```python
# déclaration d'une variable 
my_name = "Gizmo"

# déclaration multiple 
sword_name, sword_damage, sword_length = "Excalibur", 10, 200

# utiliser une variable 
print(my_name)
```

## Type 

### `type()` - retourner le type d'une variable 
```python
player_health = 100

player_has_magic = True

# don't touch below this line
print("player_health is a/an", type(player_health).__name__)
print("player_has_magic is a/an", type(player_has_magic).__name__)
```

### `NoneType`

`None` permet de créer une variable vide. Cette valeur représente une absence de valeur. Ce type de valeur permet de préparer des variables afin de les utiliser par la suite.


```python 
my_mental_acuity = None

print(my_mental_acuity is None) # check du type 
```

### String 

```python
name_with_double_quotes = "boot.dev"
```

#### f-strings 

La syntaxe **f-string** pour ajouter la valeur d'une variable dans une string.

```python
num_bananas = 10
bananas = f"You have {num_bananas} bananas"
print(bananas)
# You have 10 bananas
```

#### Concaténation 

```python 
first_name = "Lane "
last_name = "Wagner"
full_name = first_name + last_name
print(full_name)
# prints "Lane Wagner"
```

### Number 

```python
# int 
x = 5 # positive integer
y = -5 # negative integer

# float 
x = 5.2
y = -5.2
```

### Boolean 

```python
is_tall = True
is_short = False
```

---

## Arithmetique 

```python
# addition  
x = a + b

# soustraction 
x = a - b 

# multiplication 
x = a * b 

# division 
x = a / b

# parenthses permette de définir la priorité
x = (a + b + c) * / 3 # moyenne
```

Une division avec deux `int` retourne un `float`.

### Modulo 

Permet d'obtenir le reste d'une division 

```python 
remainder = 8 % 3 #2
```

### Floor Division 

Division qui retourne un résultat arrondis à l'entier inférieur. Retourne un entier.

```python 
7 // 3
# 2 (an integer, rounded down from 2.333)
-7 // 3
# -3 (an integer, rounded down from -2.333)
```

### Exposant 

```python 
# reads as "three squared" or
# "three raised to the second power"
3 ** 2
# 9
```

### Modification de valeur 

L'opération à droite de `=` est réalisée avant. Le résultat est ensuite affecter à la variable à gauche de `=`

```python
player_score = 4
player_score = player_score + 1
# player_score now equals 5
```

### Plus equals 

```python
star_rating = 4
star_rating += 1
# star_rating is now 5

star_rating = 4
star_rating -= 1
# star_rating is now 3

star_rating = 4
star_rating *= 2
# star_rating is now 8

star_rating = 4
star_rating /= 2
# star_rating is now 2.0
```

### Notation scientific 

Il est possible d'utiliser `e` ou `E` pour utiliser une notation scientifique.

Le nombre après le `e` indique le nombre de zéro ajouter à la valeur.

```python
print(16e3)
# Prints 16000.0

print(7.1e-2)
# Prints 0.071
```

Il est possible d'utiliser un `_` pour améliorer la lisibilité des grands nombres 

```python
num = 16_000
print(num)
# Prints 16000

num = 16_000_000
print(num)
# Prints 16000000
```

### Nombre binaire 

`ob` permet d'écrire des nombres binaires.

```python
print(0b0001)
# Prints 1

print(0b0101)
# Prints 5
```

#### Conversion binaire -> int 

```python
# this is a binary string
binary_string = "100"

# convert binary string to integer
num = int(binary_string, 2)
print(num)
# 4
```

---

## Scope 

La portée fait référence à l'accès à une variable. Celle ci dépent de l'endroit où la variable est crée.

**Global Scope**: variable déclaré hors d'un bloc de code. Cette variable est accessible depuis n'importe quel endroit.


```python 
# global scope => en dehors d'un bloc de code 
pi = 3.14

def get_area_of_circle(radius):
    return pi * radius * radius
```

--- 

## Test Unitaire 

- `main.py`: fichier de code 
- `main_test.py`: fichier de test

---

## Stack Trace 

Affiche les erreurs. 

```shell
Traceback (most recent call last):
  File "<string>", line 1, in <module>
  File "/home/pyodide/main.py", line 3
    msg = f"You have {strength} strength, {wisdom} wisdom, and {dexterity} dexterity for a total of {total} stats.
                                                                                                                  ^
IndentationError: unindent does not match any outer indentation level
PythonError
```

- `Traceback (most recent call last):`: header standard qui indique que l'on affiche une traceback 
- `File "<string>", line 1, in <module>`: Début de la stack trace
- `File "/home/pyodide/main.py", line 3`: Message d'erreur. Ici c'est le fichier `main.py` à la ligne 3 qui provoque l'erreur 
- `msg = f"You have {strength} strength, {wisdom} wisdom, and {dexterity} dexterity for a total of {total} stats.`: Ligne qui provoque l'erreur 
- `IndentationError: unindent does not match any outer indentation level`: message d'erreur. Ici c'est une erreur de syntaxe

---
