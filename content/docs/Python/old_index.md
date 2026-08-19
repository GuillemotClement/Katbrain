---
title: "Python"
---

## `type()` - retourne le type d'une variable

```python
type(1) is int
# True

type("1") is str
# True

type(1.0) == float
# True

type("seventy-six") == int
# False
```

---

## POO 

### Classes

```python
# creation d'une classe
class Soldier:
    # champs de la classe
    health: int = 5

    # methode de la classe
    def take_damage(self, damage: int) -> None:
        # self permet de faire reference a une propriete de l'instance de la classe
        self.health -= damage

soldier_one = Soldier()
soldier_one.take_damage(2)
print(soldier_one.health)
# prints "3"

soldier_two = Soldier()
soldier_two.take_damage(1)
print(soldier_two.health)
# prints "4"
```

#### Getter 

On utilise generalement des getter lorsque l'on souhaite retourner des valeurs d'un objet 

```python
class Soldier:
    armor: int = 2
    num_weapons: int = 2

    def get_speed(self) -> int:
        speed = 10
        speed -= self.armor
        speed -= self.num_weapons
        return speed

soldier_one = Soldier()
print(soldier_one.get_speed())
# prints "6"
```

#### Constructor 

Methode specifique au classe, qui est appeller automatiquement a l'instanciation d'une classe. 

```python
class Soldier:
    # constructeur -> declancher a la creation d'un nouvel objet
    def __init__(self, name: str, armor: int, num_weapons: int) -> None:
        self.name = name
        self.armor = armor
        self.num_weapons = num_weapons

soldier_one = Soldier("Legolas", 2, 10)
print(soldier_one.name)
# prints "Legolas"
print(soldier_one.armor)
# prints "2"
print(soldier_one.num_weapons)
# prints "10"

soldier_two = Soldier("Gimli", 5, 1)
print(soldier_two.name)
# prints "Gimli"
print(soldier_two.armor)
# prints "5"
print(soldier_two.num_weapons)
# prints "1"
```

#### Class variables

Ce sont des variables commune de classes. Elles sont partager entre les differentes instance de cette classe (comme des variables statique dans d'autres langage)

```python
class Wall:
    height: int = 10 # class variable (shared across all instances)

south_wall = Wall()
print(south_wall.height)
# prints "10"

Wall.height = 20 # updates all instances of a Wall

print(south_wall.height)
# prints "20"
```