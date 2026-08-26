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

Lorsque l'on créer une variable en Python, cela vient créer une référence vers un objet en mémoire. Python alloue un objet en mémoire pour cette valeur et fait de la variable, une référence vers cette objet. Si on assigne une variable à une autre, la nouvelle variable référencera le même objet que la variable d'origine. Les modifications sur l'une des variables viendras donc modifier la seconde.

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

### Travail avec des float 

#### `round()` - arrondis de float 

La fonction `round()` permet d'arrondir les nombres à virgules à l'entier le plus proche. Elle retourne le nombre arrondis. 

```python 
x = round(4.1) # 4
x = round(4.9) # 5
x = round(5.5) # 6
```

#### `math.ceil()` - arrondit à l'entier supérieur 

```python
x = math.ceil(4.1) # 5
x = math.ceil(4.5) # 5
x = math.ceil(4.9) # 5
```

#### `math.floor()` - arrondit à l'entier inférieur 

```python
x = math.floor(4.1) # 4
x = math.floor(4.5) # 4
x = math.floor(4.9) # 4

# ===========================
# avec int()
# ===========================
x = int(4.9) # 4
```

La conversion du floar vers le int avec `int()` est une autre façon de réaliser la converison.

#### Comparaison de nombre flottant 

Pour éviter les problème de perte de précision des nombres flottant lors de comparaison, on peut utiliser cette méthode pour s'assurer d'un résultat correct.

On viens utiliser un petit nombre, et si la différence entres les nombres (en valeur absolue) est inférieur à ce petit nombre, alors ils sont considérés comme égaux.

```python
# ================================
# comparaison de nombre à virgule
# ================================
a = 0.00000000012
b = 0.000000000011

if abs(a - b) < 0.00001:
    print("égaux")
else:
    print("non égaux")
```

### Travail avec boolean 

Les valeurs booleane utilise des valeurs `True` ou 1 et  `False` ou 0

#### Opérateur logique 

##### `and`

```python
a = True
b = False
print(a and b)  # Affichera: False
```

##### `or`

```python 
a = True
b = False
print(a or b)  # Affichera: True
```

##### `not` 

```python 
a = True
print(not a)  # Affichera: False
``` 

### Travail avec `None`

Cette valeur représente une absence de valeur. Il permet de désigner des variables vides ou comme valeur de retour pour les fonctions qui ne retournent rien. 

`None` est une instance de la classe `NoneType`. Il permet d'indiquer qu'une variable n'a pas de valeur. Il est évalué à `False`.

```python 
# =========================
# utilisation 
# =========================
a = None
if a:
    print("a est True")
else:
    print("a est None ou False")

# =================================
# comparaison avec None 
# =================================
# on utilise is qui permet de vérifier l'identité
a = None
if a is None:
    print("a est None")
else:
    print("a a une valeur")

# =================================
# None dans les fonctions
# =================================
# utiliser dans les fonctions qui ne doivent pas retourner de valeur 
# si une fonction ne renvoie pas de valeur, elle renvoie implicitement None
def func():
    print("Cette fonction renvoie None")

result = func()
print(result)  # Affichera: None

# =================================
# None dans une liste 
# =================================
# permet d'indiquer l'abscence d'un élément à une position donnée 
my_list = [1, None, 3]
print(my_list)  # Affichera: [1, None, 3]

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

---

## Fonction 

Les fonctions sont des objets de première classe, ce qui signifie qu'elle peuvent être utilisées comme n'importe quel objet.

Les fonctions peuvent : 
- être attribuées à une variable
- passé comme argument à d'autres fonctions 
- retournée depuis d'autres fonctions 
- incluses dans des structures de données comme des listes, dictionnaire

```python 
# =====================
# syntaxe de déclaration 
# =====================
def nom(paramètres):
    commande1
    commande2
    commandeN

# ===========================
# exemple 
# ===========================
def greet():
    print("Hello, World!")

# =========================
# appel de fonction 
# ==========================
greet()  # Affichera : Hello, World!

# ========================
# fonction avec un arguments
# =========================
def greet(name):
    print("Hello,", name)

greet("Alice")  # Affichera : Hello, Alice!

# =================================
# fonction à arguments multiples
# =================================
def print_sum(a, b):
    print(f"Le somme de {a} et {b} est {a + b}")

print_sum(10, 15)  # Affichera : Le somme de 10 et 15 est 25

# =======================================
# fonction avec expression comme argument
# =======================================
def print_sum(a, b):
    print(f"Le somme de {a} et {b} est {a + b}")

print_sum(10*10-123, 15//2)  # Affichera : Le somme de -23 et 7 est -16

# =======================================
# exemple d'utilisation 
# =======================================
def shout(text):
    return text.upper()

yell = shout # contient une référence à la fonction 

def greet(func):
    greeting = func("Hello")  # appel de la fonction
    print(greeting)

greet(shout)
```

### `return`

`return` permet de retourner une valeur depuis une fonction. L'opérateur met également fin à l'exécution de la fonction.

```python
# ==========================
# exemple 
# ===========================
def sum(a, b):
    return a + b

result = sum(5, 3)
print(result)  # Affiche 8

# ============================
# retourner plusieurs valeurs 
# ============================
def get_user():
    name = "Ivan"
    age = 25
    return name, age

user_name, user_age = get_user()
print(user_name, user_age)  # Affiche Ivan 25

# ===============================
# return pour terminer une fonction 
# ================================
def check_password(pswd):
    if len(pswd) < 8:
        return "Mot de passe trop court"
    return "Mot de passe accepté"

# ==================================
# return None 
# ==================================
def print_message(text):
    print(text)
    return

result = print_message("Salut")
print(result)  # Affiche None
```

### `pass`

L'opérateur `pass` est utilisé comme placeholder dans un bloc de code où un contenu est requis syntaxiquement, mais pas encore définis.

Cela permet de préparer le programme, en permettant de structurer sans qu'il effectue encore des opération. Généralement utiliser lors du processus de dev et durant les tests. Cela permet d'organiser le code sans compromettre le fonctionnement global de l'application.

```python 
# ==================
# définition de fonction 
# =======================
def my_function():
    pass

# ========================
# dans des boucles et conditions 
# ===============================
for item in my_list:
    pass
```

### Retourner une fonction - closure 

Il est possible de retourner une fonction depuis une autre fonction. C'est rendu possible par le support des closure et des fonctions de premiere classe/ 

```python
# ===========
# fonction qui genere des fonctions pour elever des nombres a une puissance donnee
# ===================
def power(exponent):
    def inner(base):
        return base ** exponent
    return inner

square = power(2)
print(square(3))  # Affiche 9

cube = power(3)
print(cube(3))  # Affiche 27
```

### Valeur par défaut

Les paramètres par défaut sont définis dans la définition de la fonction. Si la valeur n'est pas transmise lors de l'appel de la fonction, c'est la valeur par défaut qui sera utilisée.

Les paramètres avec une valeur par défaut, doivent être passer aprés les arguments normaux.

```python
# =======================
# valeur par défaut 
# =======================
def print_info(name, company='Unknown'):
    print(f"Name: {name}, Company: {company}")

# ===========================
# ordre de passage 
# ===========================
def create_user(username, is_admin=False):
    if is_admin:
        print(f"User {username} is an admin.")
    else:
        print(f"User {username} is a regular user.")

create_user("Alice")  # is_admin == False
create_user("Bob", is_admin=True)  # is_admin == True
create_user("Karl", True)  # is_admin == True
```

### Passage de paramètres par nom

Il est possible de préciser le nom du paramètres lors de l'appel de la fonction.

```python
# =====================
# syntaxe
# =====================
fonction(paramètre1 = valeur, paramètre2 = valeur)

# ==========================
# exemple 
# ==========================
def create_profile(name, age, job):
    print(f"Name: {name}")
    print(f"Age: {age}")
    print(f"Job: {job}")

create_profile(name = "John", age = 28, job = "Developer")
```

### Visibilité des variables

Une variable est accessible à partir du moment de sa création jusqu'a la fin de son scope. Si une variable est déclarée en dehors de toutes fonctions, celle ci est globale.

- **Scope local**: variable crée dans une fonction, accessible uniquement dans cette fonction
- **Scope fonctions imbriquée**: variable crée dans une fonction imbriqué. La variable est accessible que dans celle ci
- **Scope globale**: veriable définie au niveau du script ou du module. Accessible depuis n'importe quel partie du code dans le même module 
- **Score intégré**: scope spécial qui inclut tous les objets et fonction intégrés de Python accessible par défaut

Les variables des scopes extérieur ne peuvent être que lues. En tentant d'écrire quelque chose dans une varaible externe, une varaible locale avec le même nom sera crée, et l'accès ä la variable externe sera perdu.

```python
# ======================
# exemple 
# ======================
x = 10

def change_global():
    print(x)  # Cela provoquera une erreur, car x sera considéré comme une variable locale après l'affectation
    x = 20  # Une variable locale x sera créée ici
    print(x)  # Affiche 20 (accès à la variable locale x)

change_global()
print(x)  # Affiche 10
```

#### `global` 

Pour modifier la valeur d'une variable globale dans une fonction, il est nécessaire d'utiliser `global`. Cet opérateur indique explicitement que la modification doit se faire dans la variable globale, et non dans la locale.

Pour modifier la valeur d'une variable globale depuis une fonction, il faut déclarer cette variable au début de la fonction avec `global`. Cela donne à la fonction l'accès en écriture à la variable 

```python
# =======================================
# modification valeur variable globale
# =======================================
x = 10

def change_global():
    global x  # Déclare x comme variable globale
    print(x)  # Affiche 10 (accès à la variable globale x)
    x = 20  # Ici, on assigne une nouvelle valeur à la variable globale x
    print(x)  # Affiche 20 (accès à la variable globale x)

change_global()
print(x)  # Affiche 20
```

#### `nonlocal`

Python propose des variables provenant de scopes intermédiaire. Par exemple, lorsqu'une fonction est imbriqué dans une autre fonction. Pour travailler avec ces variables l'opérateur `nonlocal` est utilisé.

```python
# ====================
# utilisation
# ====================
def create_counter():
    count = 0

    def increment():
        nonlocal count
        count += 1
        return count

    return increment

counter = create_counter()
print(counter())  # Affiche 1
print(counter())  # Affiche 2
print(counter())  # Affiche 3
```

### Nombre infini de paramètres 

Les fonctions peuvent accepter un nombre infini de paramètres avec `*args` pour les paramètres ordinaires et `**args_nammed` pour les paramètres nommés


```python
# ===================
# *args
# ===================
# passer sous forme de tuple
def print_all(*args):
    for item in args:
        print(item)

print_all(1, 'apple', True)  # affichera 1, apple et True.

# ============================
# **args_nammed
# ============================
# passer sous forme de dictionnaire
def print_named_items(**kwargs):
    for key, value in kwargs.items():
        print(f"{key}: {value}")

print_named_items(fruit='apple', number=1)  # affichera fruit: apple et number: 1
```

### Typage 

Python propose le **type hinting** qui permet de donner un typage, mais uniquement pour information.

**mypy** est un analyseur statique de type permettant de capturer les erreurs dans le code en utilisant l'indication des types.

```python
# ===================
# type hinting
# ===================
def add_numbers(a: int, b: int) -> int:
    return a + b
```

---

## List 

Une liste permet de stocker une liste d'éléments. Chacun sera placé à un index.

```python
# ======================
# création d'une liste 
# ======================
empty_list = [] # création d'une liste vide
my_list = [1, 2, 3, 'apple', 'banana']

# ===============================
# conversion d'élément en liste 
# ===============================
my_list = list('hello') # liste contient un élément unique 
my_list = list((1, 2, 3, 'apple', 'banana')) # la liste contient plusieurs éléments
empty_list = list() # création d'une liste vide
```

### `len()` - longueur d'une liste 

La fonction retourne le nombre d'éléments d'une liste 

```python
# ===============
# utilisation 
# ===================
my_list = [10, 20, 30, 40]
print(len(my_list))  # Affichera 4
```

### `type()` - vérifier si c'est une list

```python
# ====================
# vérification du type 
# =====================
my_list = [1, 2.5, 'string', [3, 4]]
print(type(my_list))  # Affichera: <class 'list'>

# ==============================
# vérification avant utilisation 
# ==============================
my_list = [1, 2.5, 'string', [3, 4]]
if type(my_list) == list:
    print("Liste!")  # Affichera: Liste!'
```

### `[index]` - accès aux éléments 

Chaque élément d'une liste est placer à un index. Cet index permet de récupérer un élément d'une liste 

```python
# ==============
# accès 
# ==============
my_list = [10, 20, 30, 40, 50]
print(my_list[0])  # Affichera 10
print(my_list[1])  # Affichera 20
print(my_list[2])  # Affichera 30

# ==========================
# accès au dernier élément d'une liste
# ====================================
my_list = [10, 20, 30, 40, 50]
print(my_list[-1])  # Affichera 50

# ====================================
# accès à l'avant dernier 
# ====================================
my_list = [10, 20, 30, 40, 50]
print(my_list[-2])  # Affichera 40
```

### Extraction de sous liste 

Les **slices** permettent d'éxtraire des sous liste. 

La syntaxe prends 3 arguments:
- `start`: index de début inclu 
- `stop`: index de fin exclu 
- `step`: pas avec lequel les éléments sont sélectionnés

Si `start` n'est pas spécifié, par défaut il est égale au début de la liste. Si `stop` n'est pas spécifie, il est égale à la fin de la liste, et si `step` n'est pas spécifié, il est égale à 1

```python
# ======================
# extraction de sous list
# =======================
# création d'une liste 
my_list = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]

# Extraction de la sous-liste du troisième au septième élément
sub_list = my_list[2:7]
print(sub_list)  # [2, 3, 4, 5, 6]

# Extraction de chaque deuxième élément de la liste
step_list = my_list[0:10:2]
print(step_list)  # [0, 2, 4, 6, 8]

# Du début à l'élément troisième
sub_list = my_list[:3]
print(sub_list)  # [0, 1, 2]

# De l'élément/index premier à la fin
step_list = my_list[1:]
print(step_list)  # [1, 2, 3, 4, 5, 6, 7, 8, 9]
```

**Index négatif**

Les index négatif permettent de travailler sur les liste en partant de la fin. Les index négatif commencent à `-1`, ce qui correspond au dernier élément de la liste, `-2` l'avant dernier.

```python
# =================
# exemple 
# =================
my_list = ['a', 'b', 'c', 'd', 'e']

# obtenir les trois derniers
sub_list = my_list[-3:]
print(sub_list)  # Affichera ['c', 'd', 'e']

# obtenir une sous liste entre certain élément en partant de la fin 
sub_list = my_list[-4:3]
print(sub_list)  # Affichera ['b', 'c']

# inversion de liste 
sub_list = my_list[::-1]
print(sub_list)  # Affichera ['e', 'd', 'c', 'b', 'a']
```

### `in` - vérifier si un élément est dans la liste 

L'opérateur `in` permet de vérifier si un élément est présent dans la liste.

```python 
# ===================
# vérifier la présense dans la liste 
# =====================
my_list = [1, 2, 3, 4, 5]
element = 3
exists = element in my_list
print(exists)  # Affichera True

# ==========================
# utilisation conditionel 
# ============================
my_list = ["apple", "banana", "cherry"]
element = "apple"

if element in my_list:
    print("L'élément est dans la liste.")
else:
    print("Élément non trouvé.")
```

### Modification de liste 

#### `append()` - ajout en fin de liste 

```python 
# ===========
# utilisation 
# ===========
my_list = [1, 2, 3]
my_list.append(4)
print(my_list)  # Affichera [1, 2, 3, 4]
```

#### `extend()` - ajout de plusieurs éléments 

Prends en argument un objet itérable (liste, tutple)

```python 
# ====================
# utilisation 
# ====================
my_list = [1, 2, 3, 4]
my_list.extend([5, 6])
print(my_list)  # Affichera [1, 2, 3, 4, 5, 6]
```

#### `insert()` - ajout à un index

Permet d'ajouter un élément à la position spécifier. Elle prends en argument l'indice et l'élément 

```python
# ====================
# utilisation 
# ====================
my_list = [1, 2, 3, 4, 5, 6]
my_list.insert(0, 0)
print(my_list)  # Affichera [0, 1, 2, 3, 4, 5, 6]
```

#### Fusion de liste

L'opérateur `+` permet de combiner deux listes

```python
# =================
# combinaison 
# =================
my_list = [0, 1, 2, 3, 4, 5, 6]
my_list = my_list + [7, 8]
print(my_list)  # Affichera [0, 1, 2, 3, 4, 5, 6, 7, 8]
```

##### `extend()`

Modifie la premiere liste en ajoutant a sa fin tous les elements de la seconde liste. cela modifie la liste d'origine

```python
list1 = [1, 2, 3]
list2 = [4, 5, 6]
list1.extend(list2)
print(list1)  # Affichera [1, 2, 3, 4, 5, 6]
```

##### `List Comprehension` 

```python
list1 = [1, 2, 3]
list2 = [4, 5, 6]
combined_list = [item for sublist in [list1, list2] for item in sublist]
print(combined_list)  # Affichera [1, 2, 3, 4, 5, 6]
```

##### `append()`

```python
list1 = [1, 2, 3]
list2 = [4, 5, 6]
for x in list2:
    list1.append(x)
print(list1)  # Affichera [1, 2, 3, 4, 5, 6]
```

#### Mutation d'un élément 

Pour modifier un élément dans une liste, on peut utiliser son index

```python
# =====================
# modifier un élément 
# =====================
my_list = [1, 2, 3, 4]
my_list[2] = 30
print(my_list)  # Affichera [1, 2, 30, 4]
```

#### Attribution avec slice 

Les slices peuvent être utilisé pour modifier plusieurs éléments d'une liste en même temps. Par exemple, remplacer une partie de la liste par d'autres valeurs

```python
# =========================
# modification avec slice 
# =========================
numbers = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
numbers[2:5] = [20, 30, 40]
print(numbers)  # Affichera [0, 1, 20, 30, 40, 5, 6, 7, 8, 9]
```

### Suppression d'éléments

#### `remove()` - supprimer la premiere occurence

Supprimer la premiere occurence de l'élément spécifié dans la liste. Si l'élément n'est pas trouvé, une erreur est retourner.

```python
# ===================
# remove()
# ===================
my_list = ['apple', 'banana', 'cherry']
my_list.remove('banana')
print(my_list)  # Affichera ['apple', 'cherry']

# ======================
# cas erreur 
# ======================
my_list = ['apple', 'cherry']
my_list.remove('banana')  # ValueError: list.remove(x): x not in list
```

#### `pop()` - supprime à l'index

Supprimer l'élément à l'index spécifié et la retourne.

Si l'index n'est pas spécifié, le dernier élément de la liste est supprimé

```python
# ===================
# pop() 
# ===================
my_list = [1, 2, 3, 4, 5]
popped_element = my_list.pop(2)
print(popped_element)  # Affichera 3
print(my_list)  # Affichera [1, 2, 4, 5]

# ======================
# pop() sans argument 
# ======================
my_list = [1, 2, 3, 4, 5]
popped_element = my_list.pop()
print(popped_element)  # Affichera 5
print(my_list)  # Affichera [1, 2, 3, 4]
```

#### `del` - suppression multiple 

L'opérateur `del` permet de supprimer un ou plusieurs éléments. Il supprime et libère la mémoire.

```python 
# =========================
# suppression d'un élément 
# =========================
numbers = [10, 20, 30, 40, 50]
del numbers[2]  # Supprime l'élément 30
print(numbers)  # Affichera [10, 20, 40, 50]

# =============================
# suppression de tranches 
# =============================
numbers = [10, 20, 30, 40, 50]
del numbers[1:3]  # Supprime les éléments avec indices 1 et 2
print(numbers)  # Affichera [10, 40, 50]

# =============================
# suppression de la liste
# ==============================
numbers = [10, 20, 30, 40, 50]
del numbers
```

#### `clear()` - vider une liste 

La méthode est utilisée pour supprimer tous les éléments d'une liste, la laissant vide. 

```python
# ========================
# clear()
# ========================
my_list = [1, 2, 3, 4, 5]
my_list.clear()
print(my_list)  # Affichera []
```

#### Supprimer dans une boucle 

Lorsque l'on vient supprimer des éléments lors de l'itération dans la boucle, cela engendre un déplacement des éléments, et provoque des sauts.

Pour résoudre ce problème, on créer une nouvelle liste avec uniquement les éléments à conserver 

```python
original_list = [1, 2, 3, 4, 5, 6]
new_list = [x for x in original_list if x % 2 != 0]  # garder uniquement les nombres impairs
```

On peut également utiliser une boucle `for` avec un indice inverse pour supprimer les éléments sans risque de saut

```python
for i in range(len(original_list) - 1, -1, -1):
    if original_list[i] % 2 == 0:  # condition pour suppression
        del original_list[i]
```

**Utilisation d'une copie de la liste**

On souhaite supprimer les nombres négatifs de la liste 

```python 
numbers = [1, -1, 2, -2, 3, -3]
# Créer une copie de la liste pour une itération sûre
for number in numbers.copy():
    if number < 0:
        numbers.remove(number)
print(numbers) # Affichera [1, 2, 3]
```



### Boucles par liste

#### `for`

La boucle `for` parcourt chaque éléments et attribue de manière temporaire la valeur courante à une variable spécifique :

```python
# ================
# boucle for
# ================
fruits = ["apple", "banana", "cherry"]
for fruit in fruits:
    print(fruit)

# ===================
# parcours inverse
# ===================
fruits = ["apple", "banana", "cherry"]
for fruit in fruits[::-1]:
    print(fruit)

# ======================
# boucle for avec index 
# =======================
my_list = ['a', 'b', 'c', 'd']
for i in range(len(my_list)):
    print(f'Index: {i}, Element: {my_list[i]}')

# =======================
# modifier les éléments
# =======================
my_list = ['a', 'b', 'c', 'd']
for i in range(len(my_list)):
    my_list[i] = my_list[i] * 2

# ============================
# comparaison 
# ============================
my_list = [3, 5, 2, 9, 4]
for i in range(1, len(my_list)):
    if my_list[i] > my_list[i - 1]:
        print(f'{my_list[i]} is greater than {my_list[i - 1]}')
```

#### `enumerate()` 

Permet d'itérer sur les éléments d'une liste avec un acces au valeur et index. Elle enveloppe dans un objet spécial et retourne un itérateur qui produit des tuples, constitué de l'index et de la valeur de l'élément.

L'utilisation de la méthode rends le code plus lisible et évite la nécessité de gérer manuellement les index avec `range`.

```python
# ==================
# enumerate()
# ==================
my_list = ["apple", "banana", "cherry"]
for index, element in enumerate(my_list):
    print(f'Index: {index}, Element: {element}')

# =====================
# modifier ou comparer 
my_list = ["apple", "banana", "cherry"]
for index, element in enumerate(my_list):
    if index % 2 == 0:
        print(f'Element {element} at even index {index}')
```

#### `while` 

Peut également être utilisée pour manipuler les éléments d'une liste.

```python 
# ==================
# itération avec while 
# ===================
numbers = [1, 2, 3, 4, 5, -1, 6]
i = 0
while i < len(numbers) and numbers[i] != -1:
    print(numbers[i])
    i += 1

# ===================
# itération sans index
# ====================
tasks = [1, 2, 3, 4, 5, -1, 6]
while len(tasks) > 0:
    task = tasks.pop()
    print(task)
```

### Génération de liste 

#### `*` - multiplication 

L'opérateur `*` permet de générer des éléments d'une liste

```python
# ================
# génération de string
# ====================
print("Maman" * 5)  # affiche MamanMamanMamanMamanMaman
print("-" * 40)  # affiche ----------------------------------------

# =====================
# augmenter le nombre d'élément d'une liste 
# ======================
print(["apple"] * 5)  # affiche ['apple', 'apple', 'apple', 'apple', 'apple']

# =========================
# création d'une liste de 10 éléments
# =========================
alist = [0] * 10
print(alist)  # affiche [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]

# ============================
# génération d'un tableau a deux dimensions
# ============================
alist = [[0] * 10] * 20
print(alist)  # affiche [[0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ...]
```

#### List comprehension 

Python fournit un outil pour créer des listes. Il permet de générer de nouvelles listes en appliquant une expression à chaque élément d'un objet itérable.

- `variable`: identifiant d'une variable 
- `séquence`: séquence de valeurs prises par cette variable 
- `expression`: expression dépendnat de la variable utilisée dans le générateur qui remplira les éléments de la liste 

```python
# =====================
# syntaxe 
# ====================
[expression for variable in séquence]

# =====================
# créer une liste de n zéro 
# ======================
alist = [0 for i in range(100)]

# ===========================
# créer une liste de carrée de nombre entiers
# ============================
n = 5
alist = [i ** 2 for i in range(n)]

# ==============================
# créer une liste remplis de nombre entier de 1 a n
# ===============================
n = 10
alist = [i + 1 for i in range(n)]

# =============================
# créer une liste de nombres aléatoire 
# ==============================
from random import randrange

n = 10
alist = [randrange(1, 10) for i in range(n)]
```

**Boucle dans List Comprehension**

Les List Comprehension peuvent également être utilisé pour afficher les valeurs 

```python 
# =================
# afficher certaine valeur 
# ==========================
alist = ["apple", "banana", "cherry"]
[print(x) for x in alist]

# ========================
# récupérer des saisies
# ========================
a = [input() for i in range(int(input()))]

# ===========================
# utilisation de condition 
# ===========================
[x for x in range(10) if x % 2 == 0]

# ============================
# génération de boucles imbriquées
# =============================
[(x, y) for x in range(3) for y in range(3)]
```

### Tri des listes 

#### `sort()` - trie sur place 

Modifier la liste d'origine

```python
# =================
# utilisation
# =================
numbers = [5, 2, 9, 1]
numbers.sort()
print(numbers)  # Affichera [1, 2, 5, 9]

# =======================
# trie inverse
# =======================
numbers = [5, 2, 9, 1]
numbers.sort(reverse=True)
print(numbers)  # Affichera [9, 5, 2, 1]
```

#### `sorted()` - trie et nouvelle liste

Créer une nouvelle liste qui est une version triée de l'original. La liste d'origin n'est pas modifier.

```python
# ==================
# utilisation 
# ==================
numbers = [5, 2, 9, 1]
sorted_numbers = sorted(numbers)
print(sorted_numbers)  # Affichera [1, 2, 5, 9]
print(numbers)  # La liste originale n'est pas modifiée [5, 2, 9, 1]
```

#### Trie par clé 

On viens passer un paramètre spécial au deux méthodes. Ce paramètre sera une fonction qui sera utilisée pour comparer les éléments

```python
# =======================
# comparaison sans casse
# =======================
alist = ["banana", "Orange", "Kiwi", "cherry"]
alist.sort(key=str.lower)
print(alist)  # Affichera ['banana', 'cherry', 'Kiwi', 'Orange']

# ===========================
# trie d'une liste de tuples
# ===========================
# triage par note
students = [('Alice', 88), ('Bob', 75), ('Carol', 96)]

def get_grade(student):
    return student[1]

students.sort(key=get_grade)
print(students)  # Affichera [('Bob', 75), ('Alice', 88), ('Carol', 96)]

# ===========================
# trie de dictionnaire 
# ===========================
students = [
    {'name': 'Alice', 'grade': 88},
    {'name': 'Bob', 'grade': 75},
    {'name': 'Carol', 'grade': 96}
]

def get_grade(student):
    return student['grade']

sorted_students = sorted(students, key=get_grade)
print(sorted_students)  # Affichera [{'name': 'Bob', 'grade': 75}, {'name': 'Alice', 'grade': 88}, {'name': 'Carol', 'grade': 96}]
```

### Copie de liste 

La copie superficielle est plus rapide et convient lorsque les éléments de la liste sont simples ou ne nécessitent pas de duplication (chaîne, nombre). La copie profonde lorsque les éléments de la liste sont eux-même des collections modifiables ou lorsque les modifications de la copie ne doivent pas se réfléter sur l'original


#### Copie superficielle 

Créer une nouvelle liste, mais les éléments restent les mêmes (si les éléments sont des références, elles sont copiées en tant que référence)

```python
# ===================
# avec la fonction list()
# ===================
original = [1, 2, 3]
copy = list(original)

# ========================
# utilisation des slice 
# =======================
original = [1, 2, 3]
copy = original[:]
```

#### `copy()` - copie profonde

Créer une nouvelle liste dans laquelles sont créers égalements des copies de tous les objet imbriqués. 

```python
# =========================
# copy()
# ==========================
import copy
original = [[1, 2], [3, 4]]
deep_copy = copy.deepcopy(original)
```

---

## Tuple

### Créaton

Permet de stocker plusieurs éléments, chaque élément possède son propre numéro d'ordre ce qui rend un tuple ordonné.

Un tuple est immuable, une fois crée, il ne peut plus être modifier.

```python
# ===============
# création directe 
# ===============
tuple1 = (1, 2, 3)
tuple2 = ("apple", "banana", "cherry", "apple", "cherry")
tuple3 = (1, "apple", True)

# =============================
# création sans parenthèses
# =============================
tuple1 = 1, 2, 3
tuple2 = "apple", "banana", "cherry", "apple", "cherry"
tuple3 = 1, "apple", True

# =================================
# créatiopn tuple avec un élément
# =================================
tuple1 = (1,)
tuple2 = ("apple",)
tuple3 = (True,)

# ============================
# génération d'éléments
# ============================
t100 = tuple(range(100))
t1000 = tuple(range(1000))

# ===================================
# conversion objet itérable en tuple
# ===================================
list_to_tuple = tuple([1, 2, 3])

# ==================================
# remplissage avec saisis user
# ==================================
elements = tuple(input(f"Entrez l'élément {i+1} : ") for i in range(5))
```

### Décomposition des éléments d'un tuple 

Lorsque l'on travail avec des tuples, on peut empacter plusieurs éléments dans un seul tuple, ou décomposer un tuple en plusieurs variables

```python
# ========================
# décomposition basique 
# ========================
my_tuple = (1, 2, 3)
x, y, z = my_tuple

# =========================
# décomposition avancée
# =========================
# a et b obtienne la premiere et derniere valeur 
# b devient une liste avec les autres valeurs
a, *b, c = (1, 2, 3, 4, 5)  # a = 1, b = [2, 3, 4], c = 5

# ==================================
# utilisation dans les fonctions 
# ==================================
def func(a, b, c):
    print(a, b, c)

values = (1, 2, 3)
func(*values)
```

### `count()` - comptage

La fonction retourne le nombre de fois que l'élément passer en argument apparait dans le tuple 

```python
# ====================
# count()
# ====================
t = (1, 2, 3, 2, 4, 2)
print(t.count(2)) # Affichera 3
```

### `index()` - recherche

Retourne l'index de la premiere occurence de l'élément passer en argument. Si l'élément n'est pas trouvé, une exception est levée

```python
# =====================
# index()
# =====================
t = (1, 2, 3, 2, 4, 2)
print(t.index(3)) # Affichera 2
```

### `len()` - nombre d'éléments 

```python
# ====================
# len()
# ====================
my_tuple = (1, 2, 3, 4, 5)
print(len(my_tuple))  # Affichera 5
```

### `type()` - determiner le type 

```python 
# ====================
# type() 
# ====================
my_tuple = (1, 2, 3)
print(type(my_tuple))  # Affichera <class 'tuple'>

# ================================
# vérifier le type de la variable
# ================================
my_tuple = (1, 2.5, 'string', [3, 4])
if type(my_tuple) == tuple:
    print("Tuple!")  # Affichera : Tuple!
```

### Obtenir un élément 

L'obtention d'un élément d'un tuple se fait par indexation. 

```python
# ============================
# obtenir un élément 
# ============================
my_tuple = ('pomme', 'banane', 'cerise')
print(my_tuple[1])  # Affichera 'banane'
print(my_tuple[2])  # Affichera 'cerise'

# ==============================
# obtenir le dernier élément 
# ==============================
my_tuple = ('pomme', 'banane', 'cerise')
print(my_tuple[-1])  # Affichera 'cerise'

# ==============================
# obtenir l'avant dernier élément 
# ===============================
my_tuple = ('pomme', 'banane', 'cerise')
print(my_tuple[-2])  # Affichera 'banane'
```

### `slice` - obtenir des sous ensemble 

```python 
# ====================
# extraire un sous ensemble
# ==========================
my_tuple = (0, 1, 2, 3, 4, 5)
sub_tuple = my_tuple[1:4]  # Obtenir un sous-tuple avec les éléments de l'index 1 à 3
print(sub_tuple) # Affiche (1, 2, 3)

sub_tuple_with_step = my_tuple[0:6:2]  # Obtenir chaque deuxième élément de 0 à 5
print(sub_tuple_with_step) # Affiche (0, 2, 4)

# Créer un tuple avec les éléments de 0 à 5
my_tuple = (0, 1, 2, 3, 4, 5)

# Créer un nouveau tuple, à partir du deuxième élément du tuple d'origine
sub_tuple = my_tuple[1:]
print(sub_tuple)  # Affiche : (1, 2, 3, 4, 5)

# Créer un nouveau tuple, incluant les éléments du début jusqu'au quatrième élément
# (index 4) du tuple d'origine, avec un pas de 1 (par défaut)
sub_tuple_with_step = my_tuple[:5]
print(sub_tuple_with_step)  # Affiche : (0, 1, 2, 3, 4)

# =========================
# indice négatif 
# =========================
my_tuple = (10, 20, 30, 40, 50, 60, 70, 80)

sub_tuple = my_tuple[-3:-1] # du 3eme en partant de la fin jusqu'a l'avant dernier
print(sub_tuple) # Affiche (60, 70)

# ========================
# dernier élément
# ========================
my_tuple = (10, 20, 30, 40, 50)
last_element = my_tuple[-1]
print(last_element) # Affiche 50

# ============================
# inverser l'ordre des éléments 
# =============================
my_tuple = (10, 20, 30, 40, 50)
reversed_tuple = my_tuple[::-1]
print(reversed_tuple) # Affiche (50, 40, 30, 20, 10)
```

### `in` - recherche d'un élément 

L'operateur `in` permet de rechercher un élément dans le tuple. Retour `True` si présent 

```python
# ====================
# in
# ====================
my_tuple = (1, 2, 3, 4, 5)
element = 3
if element in my_tuple:
    print(f"{element} est dans le tuple.")
else:
    print(f"{element} n'est pas dans le tuple.")

# ===========================
# vérifier l'abscence
# ===========================
names = ('Alice', 'Bob', 'Charlie')
search_name = 'Alice'
if search_name not in names:
    print(f"{search_name} n'est pas dans le tuple.")
else:
    print(f"{search_name} est dans le tuple.")
```

### Ajout d'éléments 

Un tuple étant immuable, il est impossible de le modifier avec l'avoir créer. Pour la modification, on vient créer une nouvelle copie de celui ci avec les modifications.

```python
# ==================
# modification principe 
# =====================
liste = list(tuple)
on modifie liste ici
tuple2 = tuple(liste)

# ==========================
# ajout avec append()
# ==========================
my_tuple = (1, 2, 3)
my_list = list(my_tuple)
my_list.append(4)  # on ajoute un élément à la liste
my_new_tuple = tuple(my_list)

# ================================
# ajout d'un groupe avec extend()
# ================================
my_tuple = (1, 2, 3, 4)
my_list = list(my_tuple)
my_list.extend((5, 6))  # on ajoute des éléments à la liste
my_new_tuple = tuple(my_list)

# ===================================
# insertion au milieu - insert()
# ===================================
# prends l'index au premier argument et la valeur au second
my_tuple = (1, 2, 3, 4)
my_list = list(my_tuple)
my_list.insert(0, 0)  # on ajoute 0 au début de la liste
my_new_tuple = tuple(my_list)
```

### Modification 

Même principe, on crer une copie pour faire la modification.

```python 
# ==========================
# modification 
# ==========================
my_tuple = (1, 2, 3, 4)

my_list = list(my_tuple) # copie au format de list 
my_list[0], my_list[-1] = my_list[-1], my_list[0]  # on échange les valeurs
my_new_tuple = tuple(my_list) # conversion en tuple
print(my_new_tuple)  # (4, 2, 3, 1)
```

### Suppression 

```python 
# =============================
# suppression d'une valeur
# =============================
atuple = ("apple", "banana", "cherry")

alist = list(atuple) # copie en list
alist.remove("apple") # suppression
atuple = tuple(alist) # conversion en tuple

print(atuple)  # ('banana', 'cherry')

# ==============================
# suppression du dernier élément 
# ==============================
atuple = ("apple", "banana", "cherry")

alist = list(atuple)
alist.pop() # on supprime le dernier élément
atuple = tuple(alist)

print(atuple)  # ('apple', 'banana')
```

### Itération de tuple 

#### `for` 

```python
# ===================
# itération avec for
# ===================
my_tuple = (1, 2, 3, 4, 5)
for number in my_tuple:
    print(number)

# ========================
# somme des valeurs
# ========================
my_tuple = (10, 20, 30, 40, 50)
total = 0

for number in my_tuple:
    total += number

print(f"Somme des éléments du tuple : {total}")

# ==========================
# recherche valeur max
# ==========================
my_tuple = (5, 17, 23, 11, 2)
max_value = my_tuple[0]

for number in my_tuple:
    if number > max_value:
        max_value = number

print(f"Valeur maximale dans le tuple : {max_value}")
```

#### Itération sur un tuple imbriqué 

Les tuples peuvent contenir d'autre tuples

```python 
# ============================
# itération tuple imbriqué
# ============================
nested_tuple = ((1, 2, 3), (4, 5, 6), (7, 8, 9))

for inner_tuple in nested_tuple:
    for number in inner_tuple:
        print(number, end=' ')
    print()

# résultat
1 2 3
4 5 6
7 8 9
```

#### Boucle avec index 

```python 
# ======================
# itération avec index
# ======================
my_tuple = ('a', 'b', 'c', 'd')
for i in range(len(my_tuple)):
    print(f'index: {i}, Élément: {my_tuple[i]}')

# =============================
# comparaison 
# ==============================
my_tuple = (15, 20, 23, 18, 22, 19, 21)
for i in range(1, len(my_tuple)):
    if my_tuple[i] > my_tuple[i - 1]:  # Compare l'élément avec le précédent
        print(f'{my_tuple[i]} est supérieur à {my_tuple[i - 1]}')

# ====================================
# traitement des données - calcul température moyenne
# ====================================
temperatures = (15, 20, 23, 18, 22, 19, 21)
sorted_temps = sorted(temperatures)

# Exclure la première et la dernière température
filtered_temps = sorted_temps[1:-1]

average_temp = sum(filtered_temps) / len(filtered_temps)
print(f"Température moyenne de la semaine (sans valeurs extrêmes) : {average_temp}")

# =================================
# valeur et index avec enumerate
# =================================
my_tuple = ('apple', 'banana', 'cherry')
for index, element in enumerate(my_tuple):
    print(f'index: {index}, Élément: {element}')

# ==============================
# trouver l'index d'une valeur rechercher
# ======================================
my_tuple = (1, 2, 3, 2, 4, 2, 5)
search_value = 2
indices = []

for index, value in enumerate(my_tuple):
    if value == search_value:
        indices.append(index)

print(f"La valeur {search_value} se trouve aux index : {indices}")

# La valeur 2 se trouve aux index : [1, 3, 5]

# =============================================
# Filtrage de donnée basé sur l'index
# =============================================
my_tuple = ('a', 'b', 'c', 'd', 'e', 'f')

filtered_tuple = tuple(value for index, value in enumerate(my_tuple) if index % 2 == 0)
print(f"Tuple avec des éléments aux index pairs : {filtered_tuple}")

# Tuple avec des éléments aux index pairs : ('a', 'c', 'e')
```

### Copie de tuple 

```python
# ========================
# assignation directe - copie de référence
# ========================
original_tuple = (1, 2, 3, 4, 5)
copied_tuple = original_tuple
print(copied_tuple)

# ==============================
# tuple() - création d'un nouvel objet
# ==============================
original_tuple = (1, 2, 3, 4, 5)
copied_tuple = tuple(original_tuple)
print(copied_tuple)

# ===================================
# conversion via une liste
# ===================================
original_tuple = (1, 2, 3, 4, 5)

temp_list = list(original_tuple)
temp_list.append(6)
copied_tuple = tuple(temp_list)

print(copied_tuple)
```

### Fusion de tuple

```python
# =====================
# Concaténation 
# =====================
tuple1 = (1, 2, 3)
tuple2 = (4, 5, 6)
combined_tuple = tuple1 + tuple2

print(combined_tuple)

# =========================
# multiplication par entier
# ==========================
tuple1 = (1, 2, 3)
multiplied_tuple = tuple1 * 3

print(multiplied_tuple) #  (1, 2, 3, 1, 2, 3, 1, 2, 3)

# ===============================
# fusion d'un nombre inconnu de tuple - chain()
# ================================
from itertools import chain

tuple1 = (1, 2, 3)
tuple2 = (4, 5, 6)
tuple3 = (7, 8, 9)

combined_tuple = tuple(chain(tuple1, tuple2, tuple3))
print(combined_tuple) # (1, 2, 3, 4, 5, 6, 7, 8, 9)
```

### Tuple imbriqué

```python 
# =======================
# création 
# =======================
nested_tuple = ((1, 2, 3), (4, 5, 6), (7, 8, 9))

# =========================
# création depuis type ordinaire
# ==========================
tuple1 = (1, 2, 3)
tuple2 = (4, 5, 6)
nested_tuple = (tuple1, tuple2)

print(nested_tuple)  #  ((1, 2, 3), (4, 5, 6))

# ============================
# accès aux éléments 
# ============================
nested_tuple = ((1, 2, 3), (4, 5, 6), (7, 8, 9))

# Accès à l'élément 5 dans le deuxième tuple imbriqué
element = nested_tuple[1][1]
print(element)  # Affiche: 5

# =========================
# structuration de données
# ==========================
locations = (("New York", (40.7128, -74.0060)),
             ("Los Angeles", (34.0522, -118.2437)),
             ("Chicago", (41.8781, -87.6298)))
```

---

## Set (ensemble)

Un set, ou ensemble est un groupe d'éléments unique non ordonner mutable

On peut réaliser des opèrations:
- **Union**: contient les élément unique des deux ensemble
- **Intersection**: contient les éléments présent dans les deux ensemble
- **Différence**: inclut les éléments présent dans le premier mais absent dans le second
- **Différence symétrique**: inclut les éléments présent dans l'un ou l'autre ensemble, mais pas dans les deux em méme temps.

### Création 

```python
# ==========================
# accolade 
# ==========================
fruit_set = {"apple", "banana", "cherry"}
print(fruit_set)  # Affichage : {"banana", "cherry", "apple"}

# ==========================
# set()
# ==========================
list_to_set = set([1, 2, 3, 4, 4, 5])
print(list_to_set)  # Affichage : {1, 2, 3, 4, 5}

tuple_to_set = set((1, 2, 3, 4, 5))
print(tuple_to_set)  # Affichage : {1, 2, 3, 4, 5}

string_to_set = set("hello")
print(string_to_set)  # Affichage : {"h", "e", "l", "o"}

original_set = {"apple", "banana", "cherry"}
new_set = set(original_set)
print(new_set)  # Affichage : {"banana", "cherry", "apple"}

empty_set = set()
print(empty_set)  # Affichage : set()

# ===========================
# générer des éléments dans le set
# ===========================
set_3 = set(range(5))
set_4 = set(range(100))
set_5 = set(range(1000))

# =======================
# set vide 
# =======================
set_empty = set()

# =======================
# afficher les éléments du set 
# ========================
colors = {"rouge", "bleu", "vert", "jaune", "violet", "noir", "blanc"}

for color in colors:
    print(color)
```

### Travailler avec les ensembles
 
#### `len()` - nombres d'éléments 

La fonction retourne le nombre d'élément du set 

```python 
# ====================
# len()
# ====================
my_set = {1, 2, 3, 4, 5}
print(len(my_set))  # Affichage: 5

# ====================
# vérification si vide
# ====================
my_set = set()

if len(my_set) == 0:
    print("L'ensemble est vide")
else:
    print("L'ensemble n'est pas vide")
```

#### `type()` 

```python
# ======================
# type() 
# ======================
my_set = {1, 2, 3}
print(type(my_set))  # Affichage: <class 'set'>

# =======================
# vérifier le type de donnée
# ==========================
def add_element(collection, element):
    if type(collection) is set:
        collection.add(element)
    else:
        print("Erreur : la collection fournie n'est pas un ensemble")

my_set = {1, 2, 3}
add_element(my_set, 4)  # L'élément sera ajouté
add_element([1, 2, 3], 4)  # Affichera une erreur
```

### Obtention de sous-ensemble 

#### `for` 

Création d'un ensemble vide et ajoute des éléments qui satisfait une condition 

```python 
# ====================
# for 
# ====================
my_set = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10}
even_set = set()

for x in my_set:
    if x % 2 == 0:
        even_set.add(x)

print(even_set)  # Résultat: {2, 4, 6, 8, 10}
```

#### `filter()` - applique à chaque élément

La fonction applique une fonction à chaque éléments et retourne seulement ceux pour lesquels la fonction retourne `True`. Le résultat doit ensuite être converti de nouveau en ensemble

```python
# ====================
# filter()
# ====================
my_set = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10}
even_set = set(filter(lambda x: x % 2 == 0, my_set))
print(even_set)  # Résultat: {2, 4, 6, 8, 10}
```

#### `List Comprehension` 

Comme pour List, on peut l'utiliser pour générer des ensembles 

```python
# ===============================
# selection des éléments pairs d'un ensemble 
# ================================
my_set = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10}
even_set = {x for x in my_set if x % 2 == 0}
print(even_set)  # Résultat: {2, 4, 6, 8, 10}

# =======================================
# selection des chaîne
# =======================================
my_set = {1, 2, 3, 4, 5, 6, 7, 8, 9, "apple", "banana"}
even_set = {x for x in my_set if type(x) == str}
print(even_set)  # Résultat: {"apple", "banana"}
```

### Vérifier la présence d'éléments 

#### `in` - présence

```python
# =====================
# in 
# =====================
my_set = {1, 2, 3, 4, 5}
print(3 in my_set)  # Résultat: True
print(6 in my_set)  # Résultat: False

# =========================
# utilisation dans des boucles
# =========================
my_set = {1, 2, 3, 4, 5}
element = 3
found = False

for item in my_set:
    if item == element:
        found = True
        break

print(found)  # Résultat: True
```

#### `not in` - absence

```python 
# ==================
# not in 
# ==================
my_set = {1, 2, 3, 4, 5}
print(6 not in my_set)  # Résultat: True
print(3 not in my_set)  # Résultat: False
```

### Vérification de l'inclusion d'ensemble 

#### `<=` 

L'opérateur `<=` permet de vérifier si un ensemble est un sous ensemble d'un autre 

```python 
# ===================
# <= 
# ===================
set_a = {1, 2, 3}
set_b = {1, 2, 3, 4, 5}

print(set_a <= set_b)  # Résultat: True
print(set_b <= set_a)  # Résultat: False
```


#### `issubset()`

Permet de vérifier si un ensemble est un sous-ensemble d'un autre 

```python 
# ====================
# issubset()
# ====================
set_a = {1, 2, 3}
set_b = {1, 2, 3, 4, 5}

print(set_a.issubset(set_b))  # Résultat: True
print(set_b.issubset(set_a))  # Résultat: False
```

#### `>=` 

Permet de vérifier qu'un ensemble est un sur-ensemble d'un autre 

```python
# =======================
# >= 
# =======================
set_a = {1, 2, 3, 4, 5}
set_b = {1, 2, 3}

print(set_a >= set_b)  # Résultat: True
print(set_b >= set_a)  # Résultat: False
```

#### `issuperset()`

Permet de vérifier qu'un ensemble est un sur-ensemble d'un autre 

```python 
# ======================
# issuperset()
# ======================
set_a = {1, 2, 3, 4, 5}
set_b = {1, 2, 3}

print(set_a.issuperset(set_b))  # Résultat: True
print(set_b.issuperset(set_a))  # Résultat: False
```

### Modification d'ensemble 

#### `add()` - ajouter un élément 

Ajoute l'élément à l'ensemble. Si déjà présent, l'ensemble ne sera pas modifier.

```python
# ==================
# add()
# ==================
my_set = {1, 2, 3}
my_set.add(4)
print(my_set)  # Affichage : {1, 2, 3, 4}
```

#### `update()` - ajout d'éléments multiple

Cette méthode accepte n'importe quel objet itérable et ajoute ces éléments à l'ensemble. Si un élément est déjà présent, il se ne sera pas ajouté.

```python
# ========================
# ajout depuis une liste
# ========================
my_set = {1, 2, 3}
my_set.update([4, 5, 6])
print(my_set)  # Affichage : {1, 2, 3, 4, 5, 6}

# =========================
# ajout depuis un tuple 
# =========================
my_set = {1, 2, 3}
my_set.update((4, 5, 6))
print(my_set)  # Affichage : {1, 2, 3, 4, 5, 6}

# =========================
# ajout depuis une chaîne 
# =========================
# chaque caractères sera ajouter en tant qu'élément distinct
my_set = {'a', 'b', 'c'}
my_set.update('def')
print(my_set)  # Affichage : {'a', 'b', 'c', 'd', 'e', 'f'}

# =========================
# ajout depuis un ensemble
# =========================
set1 = {1, 2, 3}
set2 = {3, 4, 5}
set1.update(set2)
print(set1)  # Affichage : {1, 2, 3, 4, 5}
```

#### Supression de doublons 

Les ensemble suppriment automatiquement les doublons.

```python
# =========================
# suppression des doublons 
# =========================
my_list = [1, 2, 2, 3, 4, 4, 5]
my_set = set(my_list)
print(my_set)  # Affichage : {1, 2, 3, 4, 5}
```

#### Fusion de données 

Les ensembles peuvent être utilisé pour fusionner des données provenant de plusieurs sources en conservant l'unicité des éléments

```python 
# ===========================
# fusion 
# ===========================
set1 = {'apple', 'banana'}
set2 = {'banana', 'cherry'}
set3 = {'cherry', 'date'}

combined_set = set1 | set2 | set3
print(combined_set)  # Affichage : {'apple', 'banana', 'cherry', 'date'}
```

### Suppression des éléments 

#### `remove()` - supprime l'élément spécifié

La méthode supprimer l'élément spécifié de l'ensemble. Si l'élément n'existe pas, une erreur `KeyError` est déclenchée 

```python
# ========================
# remove()
# ========================
my_set = {1, 2, 3, 4, 5}
my_set.remove(3)
print(my_set)  # Sortie: {1, 2, 4, 5}

# Si l'élément n'est pas dans l'ensemble, une erreur est déclenchée
my_set.remove(6)  # KeyError: 6
```

#### `discard()` - supprime l'élément spécifié

Fonctionne comme `remove()` mais ne provoque pas d'erreur si l'élément n'existe pas.

```python 
# =========================
# discard()
# =========================
my_set = {1, 2, 3, 4, 5}
my_set.discard(3)
print(my_set)  # Sortie: {1, 2, 4, 5}

# Si l'élément n'est pas dans l'ensemble, il n'y aura pas d'erreur
my_set.discard(6)
print(my_set)  # Sortie: {1, 2, 4, 5}
```

#### `pop()` 

La méthode supprime et retourne un élément aléatoire de l'ensemble. Provque une erreur si vide.

```python 
# ====================
# pop() 
# ====================
my_set = {1, 2, 3, 4, 5}
removed_element = my_set.pop()
print(removed_element)   # Sortie: Un des éléments de l'ensemble, par exemple, 1
print(my_set)  # Sortie: Les éléments restants de l'ensemble, par exemple, {2, 3, 4, 5}

# Si l'ensemble est vide, une erreur est déclenchée
empty_set = set()
empty_set.pop()  # KeyError: 'pop from an empty set'

# =============================
# suppression dans une boucle 
# =============================
my_set = {1, 2, 3, 4, 5}
print("Ensemble initial:", my_set)

while my_set:
    removed_element = my_set.pop()
    print(f"Élément supprimé: {removed_element}, Éléments restants: {my_set}")

print("Ensemble vide:", my_set)
```

#### `clear()` - supprime tous les éléments

```python
# =======================
# clear()
# =======================
my_set = {1, 2, 3, 4, 5}
my_set.clear()
print(my_set)  # Sortie: set()
```

#### `del` 

L'opérateur permet de supprimer l'ensemble complètement.

```python
# ==========================
# suppression de l'ensemble 
# ==========================
my_set = {1, 2, 3, 4, 5}
print("Ensemble initial:", my_set)

# Suppression de l'ensemble
del my_set

# Toute tentative d'accès à l'ensemble supprimé déclenchera une erreur
# print(my_set) # NameError: name 'my_set' is not defined
```

### Boucle sur les éléments 

#### `for` 

Permet d'itérer sur chacun des éléments de l'ensemble. 

```python
# =====================
# for 
# =====================
my_set = {1, 2, 3, 4, 5}

for element in my_set:
    print(element)

# ========================
# somme des éléments 
# ========================
my_set = {1, 2, 3, 4, 5}
total = 0

for element in my_set:
    total += element

print("Somme des éléments du set :", total)
# Somme des éléments du set : 15

# ============================
# recherche valeur max
# ============================
my_set = {1, 2, 3, 4, 5}
max_element = None

for element in my_set:
    if max_element is None or element > max_element:
        max_element = element

print("Élément maximal du set :", max_element)
# Élément maximal du set : 5

# ================================
# filtrage des éléments 
# ================================
my_set = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10}
even_set = set()

for element in my_set:
    if element % 2 == 0:
        even_set.add(element)

print("Set des nombres pairs :", even_set)
# Set des nombres pairs: {2, 4, 6, 8, 10}
```

#### `enumerate` 

Fournis également les index en plus de la valeur. Les éléments n'étant pas ordonner, l'ordre n'est pas garantis.

```python
# =========================
# enumerate
# =========================
my_set = {10, 20, 30, 40, 50}

for index, element in enumerate(my_set):
    print(f"Index : {index}, Élément : {element}")

# ==============================
# sauvegarde des indices et éléments 
# =================================
my_set = {"apple", "banana", "cherry"}

indexed_elements = [(index, element) for index, element in enumerate(my_set)]
print(indexed_elements)

# ===================================
# traitement des éléments 
# ===================================
my_set = {1, 2, 3, 4, 5}
squared_elements = {}

for index, element in enumerate(my_set):
    squared_elements[index] = element ** 2

print(squared_elements)
```

#### `while` 

```python
# ========================
# while 
# ========================
my_set = {"nettoyer la maison", "faire la vaisselle", "acheter du pain"}
while len(my_set) > 0:
    task = my_set.pop()
    print(task)
```

### Opérations sur les ensembles 

La classe `set` a surchargé tous les opérateurs pour travailler avec des ensembles et soit similaire au opération mathématique 

| Opérateur | Méthode | Description |
| --------- | ------- | ----------- |
| `\|` | `union()` | Renvoie l'union de deux ensembles |
| `&` | `intersection()` | Renvoie les éléments communs |
| `-` | `difference()`  | Renvoie les éléments qui ne sont que dans le premier ensemble |
| `^` | `symetric_difference()` | Renvoie les éléments qui sont dans l'un ou l'autre mais pas les deux |
| `<=` | `issubset()` | Vérifie si un ensemble est un sous-ensemble d'un autre |
| `<` | `issubset()` | Vérifie si un ensemble est un sous-ensemble d'un autre de manière strict |
| `>=` | `issuperset()` | Vérifie si un ensemble est un sur-ensemble d'un autre |
| `>` | `issuperset()` | Vérifie si un ensemble est un sur-ensemble d'un autre de manière strict |
| `==` | `__eq__()` | Vérifie si les ensemble sont égaux (contient les même éléments) |
| `!=` | `__ne__()` | Vérifie si les ensemble ne sont pas égaux (contient des éléments différents) |

```python 
# ===================
# OR |
# ===================
# opérateur
set1 = {1, 2, 3}
set2 = {3, 4, 5}
union_set = set1 | set2
print(union_set)  # Affichage: {1, 2, 3, 4, 5}

# fonction 
set1 = {1, 2, 3}
set2 = {3, 4, 5}
union_set = set1.union(set2)
print(union_set)  # Affichage: {1, 2, 3, 4, 5}

# ======================
# AND & 
# ======================
# opérateur 
set1 = {1, 2, 3}
set2 = {3, 4, 5}
intersection_set = set1 & set2
print(intersection_set)  # Affichage: {3}

# fonction 
set1 = {1, 2, 3}
set2 = {3, 4, 5}
intersection_set = set1.intersection(set2)
print(intersection_set)  # Affichage: {3}

# =========================
# Difference - 
# =========================
# opérateur 
set1 = {1, 2, 3, 4}
set2 = {3, 4, 5}
difference_set = set1 - set2
print(difference_set)  # Affichage: {1, 2}'

# fonction 
set1 = {1, 2, 3, 4}
set2 = {3, 4, 5}
difference_set = set1.difference(set2)
print(difference_set)  # Affichage: {1, 2}

# =======================
# Symetric Difference ^ 
# =======================
# opérateur 
set1 = {1, 2, 3}
set2 = {3, 4, 5}
s_diff = set1 ^ set2
print(s_diff)  # Affichage: {1, 2, 4, 5}

# fonction 
set1 = {1, 2, 3}
set2 = {3, 4, 5}
s_diff = set1.symmetric_difference(set2)
print(s_diff)  # Affichage: {1, 2, 4, 5}
```

