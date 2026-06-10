---
date: 2026-06-09T20:51:10+02:00
---
# Fonction

Une fonction doit être déclarée avant d'être appelée. Le code est exécuté du haut vers le bas.

Lorsque la fonction ne retourne pas de valeur, elle retourne automatiquement une valeur `None`.

```python 
# Déclaration de la fonction 
def area_of_circle(r):
    pi = 3.14
    result = pi * r * r
    return result

# Appel de la fonction 
area = area_of_circle(5)
print(area)
# 78.5

# Paramètres multiple 
def subtract(a, b):
    result = a - b
    return result
```

### Retour multiple 

Une fonction peut retourner plusieurs valeurs.

```python
# fonction qui retourne plusieurs valeurs
def cast_iceblast(wizard_level, start_mana):
    damage = wizard_level * 2
    new_mana = start_mana - 10
    return damage, new_mana # return two values

# récupération des valeurs multiples
damage, mana = cast_iceblast(5, 100)
print(f"Damage: {damage}, Remaining Mana: {mana}")
# Damage: 10, Remaining Mana: 90
```

### Valeur par défault 

Il est possible de spécifier une valeur par defaut pour une valeur d'un argument d'une fonction. La valeur sera utilisé si aucune valeur n'est passer à l'appel de la fonction.

```python
def get_greeting(email, name="there"):
    print("Hello", name, "welcome! You've registered your email:", email)
```

### Pattern: `main()` 

Dans un programme Python, le code est lu du haut vers le bas et les fonctions doivent être déclarés avant utilisation.

Un pattern pour structuré un programme Python est de venir déclarées les fonction, puis d'utiliser une fonction `main()` qui fait office d'entry point. On réalise ensuite l'appel de l'entry point en bas du fichier.

```python
# définition de main() => point d'entrée
def main():
    health = 10
    armor = 5
    add_armor(health, armor)

def add_armor(h, a):
    new_health = h + a
    print_health(new_health)

def print_health(new_health):
    print(f"The player now has {new_health} health")

# appel de l'entrypoint 
main()
```
