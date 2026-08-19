# Python 

## Affichage

### `print()` - affichage

La fonction `print()` permet d'afficher du contenu dans la console.

```python
print("text")

print("Galaxie", "NGC", 1300, "a été découverte en", 1835)
```

Elle dispose de deux paramnètres `sep` et `end` qui permettent de contrôler l'affichage des données.

#### `sep` - séparateur
Le paramètre `sep` définit le caractère ou la chaîne qui sera utilisée pour séparer plusieurs valeurs passées à `print()`. Par đéfaut, le paramètre est défini comme un espace. Cela signifie que si on passe plusieurs arguments à `print()`, ils seront séparé par un espace.

```python 
# ==============================
# définition du séparateur 
# ==============================
print("Hello", "world", sep=", ")  # Affiche : Hello, world

# =============================
# séparateur saut de ligne 
# =============================
print(1, 2, 3, 4, 5, sep=",\n")
```

#### `end` - caractère de fin de ligne

Le paramètre `end` définit ce qui sera affiché après que toutes les valeurs passées. La valeur par défaut est une nouvelle ligne.

```python
# ========================
# espace en fin de ligne 
# ========================
print("Hello", end=" ")
print("world")  # Affiche : Hello world
```

### `format()`

Permet de combiner des chaînes et d'afficher les données de manière plus simple et compréhensible. Elle permet d'insérer des valeurs dans une chaîne à des positions spécifique.

Avec les nombres, `.2f` permet de définir 2 nombre après la virgule.

```python
# ==============================================
# syntaxe
# ==============================================
"Modèle de chaîne de {} à {}".format(valeur1, valeur2,…)

# ==============================================
# utilisation 
# ==============================================
welcome_message = "Salut, {}, bienvenue à {}!" # définition de la chaîne 
print(welcome_message.format("Anna", "notre magasin")) # affichage de la chaîne formater

# ==============================================
# formatage de nombre 
# ==============================================
output = "Données: {0:.2f} et {1:.2f}".format(3.1415926, 2.71828)
print(output)

# ==============================================
# utilisation de mot clé
# ==============================================
output = "{name} travaille chez {company}"
print(output.format(name="Sergueï", company="Google"))
```

### f-string

A partir de la version 3.6, Python à introduit un nouveau type de chaîne - les `f-strings`. 

Sous le capot, elle vient utiliser la fonction `format()`

```python
# =================================
# utilisation 
# =================================
force = "Côté Obscur"
message = f"Que la force soit avec toi {force}!"
print(message)  # Affiche : Que la force soit avec toi Côté Obscur !

# ================================
# nombre 
# ================================
age = 28
message = f"J'ai {age} ans"
print(message)  # Affiche : J'ai 28 ans

# =================================
# expression
# =================================
birth_year = 1985
current_year = 2024
message = f"J'ai {current_year - birth_year} ans"
print(message)  # Affiche : J'ai 39 ans
```

---

## Variable 

```python
nom = "Alexander"
user_age = 5
pi = 3.14


// concaténation
nom = "Alex" + "Alex" 
age = 5 * 7

// affectation multiple
x, y, z = 1, 2, 3
```

### Types intégrés

**int**
Les nombres entiers. Ils peuvent être positif ou négatif et ne possède pas de partie décimal. Python prends en charge la précision arbitraire, ce quio signifie qu'il n'y a pratiquement pas de limite de taille de nombre.

**float**
Permet de repréesenter des nombres réel et peuvent contenir des points décimaux. 

**complex**
Les nombres complexes ont une partie réel et imaginaire. Les deux sont représentées par des nombres à virgules flottante. Le suffixe `j` ou `J` est utilisé pour indiquer la partie imaginaire.

```python
# ====================
# création d'un nombre complexe
# ====================
complex_number = 3 + 5j 
```

- `str`: chaîne de caractère
- `bool`: contien `True` ou `False`
- `None`: représente une absence de valeur
- `bytes`: séquence immuable d'octet
- `bytearray`: séquence mutable d'octet
- `memoryview`: objet permettant de travailler avec des données sous forme de binaire

### Collections 

Permet de stocker des groupes entiers d'objets. Les collectios représentent différentes structures de données qui permettent de stocker, gérer et traiter des groupes d'éléments.

- `list`: ensemble ordonné et modifiable d'élément
- `tuple`: séquence ordonné et immuable d'éléments
- `range`: séquece de nombre, souvent utilisé dans les boucles
- `set`: collection non ordonné d'éléments unique
- `dict`: collection clé/valeur avec clé unique
- `frozenset`: variante immuable de l'ensemble `set`

### Classes et objet 

Python permet de créer ses propres types -> les classes.

Ces classes permettent d'emballer des fonctions et des données liés. Elle permette également de modéliser des objets réel ou abstrait avec un comportement et des propriétés spécifique.

### `type()` - déterminer le type 

La fonction `type()` permet de déterminer le type d'un objet.

```python 
# =================
# utilisation 
# =================
x = 1
print(type(x))  # Affichera: <class 'int'>

x = "salut"
print(type(x))  # Affichera: <class 'str'>

x = [1, 2, 3]
print(type(x))  # Affichera: <class 'list'>

# ===========================
# vérifier si la variable est un nombre
# ===========================
arg = 123
if type(arg) == int:
    print(arg + 10)  # Affichera: 133

# ================================
# vérifier le type stocker dans une variable
# ================================
arg = "123"
if type(arg) == int:
    print(arg + 10)  # Cela ne s'exécutera pas, car arg est une chaîne
elif type(arg) == str:
    print(arg + " monde")  # Affichera: 123 monde
else:
    print("Type inconnu")
```

### Attribution explicite de type 

Python fournit des fonction permettant d'expliciter le type d'une variable. Elles permettent de spécifier un type particulier et de convertir des donnée d'un type vers un autre.

```python
# ==========================
# conversion en int 
# ==========================
num = int("123")  # num sera le nombre entier 123

# ===========================
# conversion en float 
# ===========================
num = float("123.45")  # num sera 123.45

# ============================
# conversion en str 
# ============================
s = str(10.5)  # s sera '10.5'

# ==============================
# conversion en tuple 
# ==============================
t = tuple([1, 2, 3])  # t deviendra (1, 2, 3)

# ==============================
# conversion en list itérale
# =============================
l = list("abc")  # l sera ['a', 'b', 'c']

# ===============================
# conversion en dict
# ===============================
d = dict([(1, 'a'), (2, 'b')])  # d sera {1: 'a', 2: 'b'}
```

### Nombres aléatoire

**Algorithme**

```python
# ========================================
# génération d'un nombre pseudo-aléatoire
# ========================================
a = 41
c = 11119
m = 11113
seed = 1


def get_next_random():
    global seed
    seed = (a * seed + c) % m
    return seed

for t in range(1000):
    x = get_next_random()
    print(x)
```

#### lib `random` - nombre pseudo-aléatoire

Python fournis une lib `random` permettant de générer des nombre pseudo aléatoire. Il sera nécessaire de l'importer avant de pouvoir l'utiliser.

```python
# ====================
# random.random() -> génère un float aléatoire entre 0.0 et 1.0
# ===================
import random

probability = random.random()
print("Probabilité aléatoire :", probability)

# =================================
# random.randint(a, b) => génère un int aléatoire dans l'intervale a et b
# ===========================
import random

dice_roll = random.randint(1, 6)  # Simulation du lancer de dé
print("Le nombre tiré est :", dice_roll)
```

### lib `math` - fonction mathématique 

La bibliotheque `math` fournis des méthodes et constante mathématique. Il est nécessaire de l'importer afin de l'utiliser

```python
# ===================
# math.sqrt() -> racine carrée d'un nombre
# math.ceil() -> arrondi vers l'entier haut
# math.floor() -> arrondi vers l'entier bas 
import math

number = 9.7
rounded_up = math.ceil(number)  # Arrondit vers le haut, résultat 10
rounded_down = math.floor(number)  # Arrondit vers le bas, résultat 9

print("Nombre arrondi vers le haut :", rounded_up)
print("Nombre arrondi vers le bas :", rounded_down)
```

---

## Récupération de saisie - `input()`

Les données issue de la fonction sont toujours considéré comme des chaîne. Pour travailler avec des nombres, il sera nécessaire de les convertirs.

La fonction peut prendre une chaîne qui sera afficher à l'écran.

```python
# demande de saisie avec phrase
name = input("Entrez votre nom: ")
print("Salut ", name)

# demande de saisie sans phrase
name = input()  # attendre la saisie du texte et enter
print("Salut ", name)

# saisie de nombre
age = input("Entrez votre âge: ")  # contient la chaîne
age = int(age)  # convertir l'âge saisi en un entier
print("Dans 10 ans, vous aurez " + str(age + 10) + " ans.")

# syntaxe courte
age = int(input("Entrez votre âge: "))  # contient le nombre
print("Dans 10 ans, vous aurez " + str(age + 10) + " ans.")

# float 
age = float(input("Entrez votre âge: "))  # contient le nombre
print("Dans 10 ans, vous aurez " + str(age + 10) + " ans.")
```



---

## Commentaire 

```python
# Ceci est un commentaire sur une seule ligne

""" Ceci est un littéral sur plusieurs lignes que tu peux utiliser comme un commentaire. Python l'interprète comme une chaîne, mais il ne fait rien de cette chaîne si elle n'est pas assignée à une variable ou utilisée dans une expression. """
```

### `doctrings`

Placer en début de modules, classesm et méthodes et fonctions pour décrire leur but.

Encadrées par trois paires de guillemets doubles, et utilisées pour générer de la documentation.

```python
def add(a, b):
""" Fonction pour additionner deux nombres. :param a: premier terme :param b: deuxième terme :return: somme de a et b """
    return a + b
```

---

## Arithmetique 

### Opérateur mathématique 

```python 
# division normal
# le résultat est toujours un float 
result = 5 / 2  # result sera 2.5

# division entière
# resultat sera un entier -> uniquement la partie entière
result = 7 // 2  # result sera 3

# reste 
result = 5 % 3  # result sera 2

# puissance
result = 5 ** 3  # result sera 125
```

### Opérateur d'assignation abrégés

```python
x = 5
x += 3  # x est maintenant égal à 8

x = 5
x -= 3  # x est maintenant égal à 2

x = 5
x *= 3  # x est maintenant égal à 15

x = 5
x /= 2  # x est maintenant égal à 2.5

x = 5
x //= 2  # x est maintenant égal à 2

x = 5
x %= 3  # x est maintenant égal à 2

x = 5
x **= 3  # x est maintenant égal à 125
```

### Opérateur de comparaison 

```python 
print(5 == 5)  # Affiche : True (Vrai)

print(5 != 5)  # Affiche : False (Faux)

print(5 > 3)  # Affiche : True (Vrai)
print(5 < 3)  # Affiche : False (Faux)

print(5 >= 5)  # Affiche : True (Vrai)
print(5 <= 4)  # Affiche : False (Faux)
```

---

## Conversion de type 

### `int()` - conversion en entier 

Si la chaîne n'est pas un nombre, cela provoque une erreur.

Pour une conversion `float` -> `int`, la partie décimale n'est pas conserver. Et l'arrondis sera toujours vers le bas.

Pour une conversion `bool` -> `int`, `true` devient 1 et `false` zéro.

```python 
# str -> int 
num_str = "42"
num_int = int(num_str)
print(num_int)  # Affiche: 42

# float -> int 
num_float = 42.9
num_int = int(num_float)
print(num_int)  # Affiche: 42

# bool -> int 
true_bool = True
false_bool = False
print(int(true_bool))  # Affiche: 1
print(int(false_bool))  # Affiche: 0
```

### `str()` - conversion en chaîne 

```python
# int -> str 
num_int = 42
num_str = str(num_int)
print(num_str)  # Affiche: "42"

# float -> str 
num_float = 42.9
num_str = str(num_float)
print(num_str)  # Affiche: "42.9"

# bool -> str 
true_bool = True
false_bool = False
print(str(true_bool))  # Affiche: "True"
print(str(false_bool))  # Affiche: "False"
```

### `float()` - conversion en nombre à virgule 

```python
# str -> float
num_str = "42.9"
num_float = float(num_str)
print(num_float)  # Affiche: 42.9

# int -> float 
num_int = 42
num_float = float(num_int)
print(num_float)  # Affiche: 42.0

# bool -> float 
true_bool = True
false_bool = False
print(float(true_bool))  # Affiche: 1.0
print(float(false_bool))  # Affiche: 0.0
```

---

## Condition 

### `if`, `elif`, `else`

```python
if condition:
   commande1
else:
   commande2

# exemple
y = 4
if y > 5:
    print("y est plus grand que 5")
else:
    print("y n'est pas plus grand que 5")

age = int(input("Entrez votre âge :"))
if age >=18:
    print("vous êtes majeur")
else:
    print("va faire tes devoirs")

# syntaxe raccourcis =================================
if condition:
    commande

# exemple 
age = int(input("Entrez votre âge :"))
if age >=21:
    print("Voici votre bière !")

# elif ===============================================
if condition1:
    commande1
elif condition2:
    commande2
elif conditionN:
    commandeN
else:
    commandeElse

# commande
x, y = 5, -8
if x > 0 and y > 0:
    print("premier quart")
elif x < 0 and y > 0:
    print("deuxième quart")
elif x < 0 and y < 0:
    print("troisième quart")
else:
    print("quatrième quart")
```

### Ternaire 

Si la condition évalué est vrai, alors la valeur est assigné à la première valeur, sinon c'est la deuxième qui sera assignée.

```python
# =========================
# syntaxe 
# =========================
variable = valeur1 if condition else valeur2

# =========================
# utilisation 
# =========================
min = a if a < b else b
```
---

## Environnement virtuel `.venv`

`.venv` est un module Python qui offre la possibilité de créer différents environnement virtuels légers et isolés pour les projets python. Il permet de gérer les dépendances du projet en les isolant des lib systme.

---

## Boucle 

### `for` - boucler sur une liste

Dans la boucle `for`, on vient parcourir une liste de valeur. La variable récupère d'un élément à chaque itération.

```python
for variable in liste_de_valeurs:
    commande1
    commande1
    commandeN

fruits = ["apple", "banana", "cherry"]
for fruit in fruits:
    print(fruit)

numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
for x in numbers:
    print(x)

for data in [0.99, "apple", -1, True]:
    print(data)
```

#### `range`

La fonction `range()` permet de générer une séquence de nombre.

```python
# générer une séquence de nombre
for i in range(5):
    print(i)  # Affiche les nombres de 0 à 4

# génère une séquence a partir de start et stop non inclus 
for i in range(1, 6):
    print(i)  # Affiche les nombres de 1 à 5

# génère avec start et stop non inclus avec un step 
for i in range(0, 10, 2):
    print(i)  # Affiche les nombres pairs de 0 à 8

# boucle inversé
for i in range(10, 0, -1):
    print(i)  # Affiche les nombres de 10 à 1
```

### `while`

Boucle tant que la condition est vrai. La condition est vérifié à chaque itération, et le bloc de code s'exécute si elle est évaluer à `true`.

```python
# =====================
# syntaxe =============
# =====================
while condition:
    commande1
    commande1
    commandeN

# =====================
# exemple 
# =====================
count = 0
while count < 5:
    print(count)
    count += 1

# exemple boucle de saisie 
user_input = ""
while user_input != "exit":
    user_input = input("Entrez 'exit' pour sortir : ")
    print(user_input)
```

### `break`

L'opérateur `break` permet de stopper l'exécution d'une boucle.

```python
for num in range(10):
    if num == 5:
        break  # Arrête la boucle dès que num atteint 5
    print(num)

# ====================================
# utilisation dans une boucle infinie
# ====================================
while True:
    response = input("Entrez 'exit' pour sortir : ")
    if response == 'exit':
        break

# =====================================
# utilisation dans un algo de recherche
# =====================================
elements = [1, 2, 3, -99, 5]
# Recherche du premier élément négatif
for element in elements:
    if element < 0:
        print("Élément négatif trouvé : ", element)
        break
```

### `continue`

L'opérateur `continue` permet de passer à l'itération suivante.

```python
# =========================
# affiche uniquement les nombres paire
# =========================
for i in range(10):
    if i % 2 == 0:
        continue
    print(i)

# =====================================
# filtrage de données
# =====================================
data = ["apple", "banana", "", "cherry", "date"]
for fruit in data:
    if not fruit:
        continue  # Sauter les chaînes vides
    print(fruit.capitalize())

# =====================================
# skip condition spécifiques
# =====================================
scores = [92, 85, 99, 78, 82, 100, 67, 88]
for score in scores:
    if score < 80:
        continue  # Sauter les scores bas
    print("Félicitations, votre score : ", score)
```

### `else` - utilisation dans les boucles

L'opérateur `else` peut être utilisé dans les boucle `while` et `for`.

`else` vient s'exécuter après la fin de la boucle, mais uniquement si la boucle s'est terminée normalement, c'est à dire sans interruption avec `break`. Cela rend `else` utile dans les scénario oà il faut vérifier si la boucle à été interrompue prématurément.

```python
# ========================
# utilisation avec for 
# ========================
for i in range(3):
    password = input('Entrez le mot de passe : ')
    if password == 'secret':
        print('Mot de passe accepté.')
        break
# s'exécute si l'utilisation a saisi un mot de passe incorrect trois fois.
else:
    print('Aucune tentative ou tous les mots de passe sont incorrects.')

# ==========================
# utilisation avec while 
# ==========================
n = 5
while n > 0:
    print(n)
    n -= 1
else:
    print('La boucle s\'est terminée normalement.')
```

### Boucle imbriquée

Une boucle imbriquée se compose d'une boucle présente dans une boucle. Lorsque la boucle interne termine l'itération complète des éléments, la boucle externe itére un élément.

```python
# =======================
# utilisation 
# =======================
for i in range(3):  # Boucle externe
    for j in range(3):  # Boucle interne => iteration complète pour chaque élément de la boucle externe
        print(f"({i}, {j})")

# ============================
# exemple => table de multiplication
# ============================
n = 5
for i in range(1, n + 1):
    for j in range(1, n + 1):
        print(f"{i} * {j} = {i * j}", end='\t')
    print()  # Passage à la ligne suivante pour le multiplicateur suivant

""" affichera
1 * 1 = 1	1 * 2 = 2	1 * 3 = 3	1 * 4 = 4	1 * 5 = 5
2 * 1 = 2	2 * 2 = 4	2 * 3 = 6	2 * 4 = 8	2 * 5 = 10
3 * 1 = 3	3 * 2 = 6	3 * 3 = 9	3 * 4 = 12	3 * 5 = 15
4 * 1 = 4	4 * 2 = 8	4 * 3 = 12	4 * 4 = 16	4 * 5 = 20
5 * 1 = 5	5 * 2 = 10	5 * 3 = 15	5 * 4 = 20	5 * 5 = 25
"""
```
