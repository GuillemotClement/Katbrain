---
date: 2026-06-09T20:59:25+02:00
---
# Dictionnaire

Permet de stocker des valeurs sous forme de clé/valeur.

Lorsque l'on insère une clé déjà existante, la valeur est écrasée.

Depuis la version `3.7` de Python, les maps sont ordonnée et l'ordre ne change pas.

```python
# use curly braces
# add key-value pairs
car = {
  "brand": "Toyota",
  "model": "Camry",
  "year": 2019,
}
```

---

## Accès aux valeurs 

```python
car = {
    "make": "Toyota",
    "model": "Camry"
}
print(car["make"])
# Prints: Toyota
```

---

## Ajouter une nouvelle valeur

```python
planets = {}
planets["Earth"] = True
planets["Pluto"] = False
print(planets["Pluto"])
# Prints False
```

---

## `del`: suppression de clé

Si la clé n'existe pas, cela provoque une erreur.

```python 
names_dict = {
    "jack": "bronson",
    "jill": "mcarty",
    "joe": "denver"
}

del names_dict["joe"]

print(names_dict)
# Prints: {'jack': 'bronson', 'jill': 'mcarty'}
```

---

## `in`: vérifier si la clé existe 

```python
cars = {
    "ford": "f150",
    "toyota": "camry"
}

print("ford" in cars)
# Prints: True

print("gmc" in cars)
# Prints: False
```

---

## `for value in dict`: parcourir le dictionnaire 

```python
fruit_sizes = {
    "apple": "small",
    "banana": "large",
    "grape": "tiny"
}

# key get the key of the dict 
for key in fruit_sizes:
    size = fruit_sizes[key] 
    print(f"name: {key}, size: {size}")

# name: apple, size: small
# name: banana, size: large
# name: grape, size: tiny
```