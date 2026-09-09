# Python 

## 01 - Affichage

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

---

## 02 - Variable 

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

## 03 - Commentaire 

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

## 04 - Arithmetique 

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

## 05 - Conversion de type 

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

## 06 - Condition 

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

## 07 - Environnement Python

### Environnement virtuel `.venv`

`.venv` est un module Python qui offre la possibilité de créer différents environnement virtuels légers et isolés pour les projets python. Il permet de gérer les dépendances du projet en les isolant des lib systme.

### Librairie standard 

#### `os` - interaction systeme d'exploitation 

La lib `os` fournit des fonctions pour intéragir avec l'os comme la gestion du system file, la gesiton des procession, les variable env, etc 

##### `os.getcwd()` - repertoire actuel 

Cette fonction permet de récupérer le répertoire actuel 

```python 
import os

cwd = os.getcwd()
print("Current Working Directory:", cwd)
```

##### `os.chdir()` - changer le repertoire 

```python 
os.chdir('/path/to/directory')
```

##### `os.mkdir()` - nouveau repertoire 

```python 
os.mkdir('new_directory')
```

##### `os.rmdir()` - supprimer un repertoire 

```python 
os.rmdir('new_directory')
```

##### `os.listdir()` - lister fichier et repertoire 

```python 
files = os.listdir('.')
print("Files and directories:", files)
```

##### `os.getenv()` - obtenir une variable env 

```python 
home_dir = os.getenv('HOME')
print("Home Directory:", home_dir)
```

##### `os.environ()` - définir une variable env 

```python 
os.environ['MY_VAR'] = 'my_value'
```

#### `platform` - information plateforme 

Cette lib fournit des fonctions pour obtenri des information sur la plateforme où Python s'exécute. 

##### `platform.system()` - systeme information 

```python 
import platform

os_name = platform.system()
print("Operating System:", os_name)
```

##### `platform.node()` - nom 

```python 
node_name = platform.node()
print("Node Name:", node_name)
```

##### `platform.release()` - version os 

```python 
os_release = platform.release()
print("OS Release:", os_release)
```

##### `platform.version()` - version os 

```python 
os_version = platform.version()
print("OS Version:", os_version)'
```

##### `platform.architecture()` - architecture du proc 

```python 
architecture = platform.architecture()
print("Architecture:", architecture)
```

##### `platform.processor()` - type de proc 

```python 
processor = platform.processor()
print("Processor:", processor)
```

##### `platform.python_version()` - version de python 

```python 
python_version = platform.python_version()
print("Python Version:", python_version)
```

##### `platform.python_compiler()` - compileur 

```python 
python_compiler = platform.python_compiler()
print("Python Compiler:", python_compiler)
```

#### `sys` - interpréteur 

Fournis des fonctions pour intérafir avec l'interpreteur. 

##### `sys.arggv` - argument ligne de commande 

Permet de récupérer les arguments de la CLI passé au script via une liste

##### `sys.exit()` - terminer l'exécution 

Permet de terminer l'exécution du programme avec un code de sortie. Zero indique une exécution réuisse.

```python 
import sys

if len(sys.argv) < 2:
    print("Erreur : pas assez d'arguments")
    sys.exit(1)

print("Tous les arguments sont correctement spécifiés")
sys.exit(0)
```

##### `sys.path()` - chemin de recherche des modules 

La liste conteint les chemions ou l'interpréteur Python recherche les modules à importer. Il est possible d'ajouter de nouveaux cheminx à cette liste pour configurer la recherche de module 

```python 
import sys

print("Chemins de recherche des modules:")
for path in sys.path:
    print(path)

# Ajout d'un nouveau chemin
sys.path.append('/path/to/my/modules')
print("Liste mise à jour des chemins de recherche des modules:", sys.path)
```

##### Information sur le systèmne 

```python 
import sys

# Version de Python
print("Version de Python:", sys.version)

# Informations sur la plateforme
print("Plateforme:", sys.platform)

# Taille d'un nombre en octets
print("Taille int:", sys.getsizeof(0), "octets")
```

##### `sys.modules()` - module installés

Dictionnaire qui contient les informations sur les modules chargés.

```python 
import sys

# Liste des modules chargés
print("Modules chargés:")
for module in sys.modules:
    print(module)
```

#### `datetime` - travail avec les dates et heures 

Cette lib permet de travailler avec les dates et les heures. Elle permet de créer, manipuler, et formater des dates et des heures.

##### `datetime.date` - date sans temps

Cette classe représente une date temps

```python 
import datetime

# Création d'un objet date
d = datetime.date(2023, 5, 24)
print(d)  # Résultat : 2023-05-24

# Obtention de la date actuelle
today = datetime.date.today()
print(today)

# Accès aux attributs année, mois et jour
print(d.year)  # Résultat : 2023
print(d.month)  # Résultat : 5
print(d.day)  # Résultat : 24
```

##### `datetime.time` - travail sur heure 

Cette classe représente le temps sans date. 

```python 
import datetime

# Création d'un objet temps
t = datetime.time(14, 30, 45)
print(t)  # Résultat : 14:30:45

# Accès aux attributs heures, minutes et secondes
print(t.hour)  # Résultat : 14
print(t.minute)  # Résultat : 30
print(t.second)  # Résultat : 45
```

##### `datetime.datetime` - date et heure 

```python 
import datetime

# Création d'un objet date et temps
dt = datetime.datetime(2023, 5, 24, 14, 30, 45)
print(dt)  # Résultat : 2023-05-24 14:30:45

# Obtention de la date et l'heure actuelles
now = datetime.datetime.now()
print(now)

# Accès aux attributs date et temps
print(dt.year)  # Résultat : 2023
print(dt.month)  # Résultat : 5
print(dt.day)  # Résultat : 24
print(dt.hour)  # Résultat : 14
print(dt.minute)  # Résultat : 30
print(dt.second)  # Résultat : 45
```

##### `datetime.timedelta` - différence entre deux moments 

Permet de réaliser des opérations avec les dates et les heures 

```python 
import datetime

# Création d'un objet timedelta
delta = datetime.timedelta(days=10, hours=5, minutes=30)
print(delta)  # Résultat : 10 days, 5:30:00

# Ajout de timedelta à une date
dt = datetime.datetime(2023, 5, 24, 14, 30)
new_dt = dt + delta
print(new_dt)  # Résultat : 2023-06-03 20:00:00

# Soustraction de timedelta d'une date
earlier_dt = dt - delta
print(earlier_dt)  # Résultat : 2023-05-14 09:00:00
```

##### `strftime()` - formater des datetime

```python 
import datetime

dt = datetime.datetime(2023, 5, 24, 14, 30, 45)

# Formatage de la date et l'heure
formatted_dt = dt.strftime("%Y-%m-%d %H:%M:%S")
print(formatted_dt)  # Résultat : 2023-05-24 14:30:45

# Formatage de la date uniquement
formatted_date = dt.strftime("%d-%m-%Y")
print(formatted_date)  # Résultat : 24-05-2023

# Formatage de l'heure uniquement
formatted_time = dt.strftime("%H:%M:%S")
print(formatted_time)  # Résultat : 14:30:45
```

##### `strptime()` - analyse de chaîne datetime

```python 
import datetime

# Parsing d'une chaîne en un objet datetime
date_str = "24-05-2023 14:30:45"
dt = datetime.datetime.strptime(date_str, "%d-%m-%Y %H:%M:%S")
print(dt)  # Résultat : 2023-05-24 14:30:45

# Parsing d'une chaîne en un objet date
date_str = "24-05-2023"
d = datetime.datetime.strptime(date_str, "%d-%m-%Y").date()
print(d)  # Résultat : 2023-05-24

# Parsing d'une chaîne en un objet time
time_str = "14:30:45"
t = datetime.datetime.strptime(time_str, "%H:%M:%S").time()
```

##### `timezone` - travail avec fuseau 

```python 
import datetime

# Création d'un objet datetime avec le fuseau horaire UTC
utc_dt = datetime.datetime(2023, 5, 24, 14, 30, 45, tzinfo=datetime.timezone.utc)
print(utc_dt)  # Résultat : 2023-05-24 14:30:45+00:00

# Conversion dans un autre fuseau horaire
tokyo_tz = datetime.timezone(datetime.timedelta(hours=9))
tokyo_dt = utc_dt.astimezone(tokyo_tz)
print(tokyo_dt)  # Résultat : 2023-05-24 23:30:45+09:00
```

---

## 08 - Boucle 

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

## 09 - Fonction 

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

#### `args` - paramètre multiples


```python
# ===================
# *args
# ===================
# passer sous forme de tuple
def print_all(*args):
    for item in args:
        print(item)

print_all(1, 'apple', True)  # affichera 1, apple et True.
```

#### `**kwargs` - paramètres multiple nommé
```python
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

### Obtenir tous les arguments d'une fonction 

Il existe plusieurs maniére d'obtenir depuis l'intérieur d'une fonction la liste des paramètres passée

#### `*args` 

Empacté sous forme de tuple

```python 
def print_numbers(*args):
    for arg in args:
        print(arg)

print_numbers(1, 2, 3, 4, 5)
```

#### `**kwargs`

Empacté sous forme de dictionnaire 

```python 
def print_person_info(**kwargs):
    for key, value in kwargs.items():
        print(f"{key}: {value}")

print_person_info(name="Alice", age=30, city="New York")
```

### Type d'arguments

#### Argument positionnels - `/`

Il est possible de définir des fonctions avec des arguments positionnels qui peuvent être passés uniquement par position. 

```python 
def greet(name, /, greeting="Hello"):
    print(f"{greeting}, {name}!")

greet("Alice")  # Sortie: Hello, Alice!
greet("Alice", greeting="Hi")  # Sortie: Hi, Alice!
# greet(name="Alice")  # Erreur: TypeError
```

`greet` accepte l'argument `name` qui ne peut être passé que par position. Les arguments avant `/` peuvent être passés uniquement par position.

#### Argument uniquement nommé - `*`

Définis un argument qui ne peut être passé que par nom avec le symbole `*`

```python 
def greet(*, name, greeting="Hello"):
    print(f"{greeting}, {name}!")

greet(name="Alice")  # Sortie: Hello, Alice!
greet(name="Alice", greeting="Hi")  # Sortie: Hi, Alice!
# greet("Alice")  # Erreur: TypeError
```

La fonction accepte l'argument `name` qui ne peut être passè que par nom. Les arguments après `*` peuvent être passés uniquement par nom

#### Combinaison 

```python 
def greet(name, /, *, greeting="Hello"):
    print(f"{greeting}, {name}!")

greet("Alice")  # Sortie: Hello, Alice!
greet("Alice", greeting="Hi")  # Sortie: Hi, Alice!
# greet(name="Alice")  # Erreur: TypeError
```

---

## 10 - List 

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

### Conversion de liste 

#### `.join()` - conversion en string 

`.join()` permet de convertir une liste en string. Devant la méthode est placer le sépérateur à utiliser entre chaque élément, et en argument on vient passer la liste à convertir.

```python 
a = ["Python", "is", "simple"]
res = " ".join(a)
print(res)
```

---

## 11 - Tuple

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

## 12 - Set (ensemble)

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

Comme pour List, on peut l'utiliser pour générer des ensembles.

Le premier `x` dans les List comprehension sera la valeur envoyer dans le set.

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

---

## 13 - String

### Déclaration 

 En Python, les chaîne sont des séquence de charactere.

 ```python
 # ======================
 # déclaration de chaîne 
 # ======================
 name = 'Gizmo'
 city = "Melrand"

 # ==========================
 # chaîne multiligne
 # ==========================
 multiline_string = """Première ligne
deuxième ligne
troisième ligne"""

# ===========================
# échappement de caractères
# ===========================
escaped_string = "Il a dit : \"Salut, mon pote !\""
```

#### Chaîne brutes

Les chaînes brute (raw string) sont des chaîne oà l'échappement est désactivé. 

```python
# ==========================
# déclaration de raw string
# ==========================
raw_string = r"Dans cette chaîne, \n n'est pas considéré comme un saut de ligne."
```

#### f-string

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

### Itérer une chaîne 

```python 
# ======================
# parcourir une chaîne 
# ======================
text = "Hello"
for char in text:
    print(char)
```

### `len()` - longueur d'une chaîne 

```python
# ==================
# len() 
# ==================
text = "Hello, world!"
length = len(text)
print(length)  # Affichera : 13
```

### Sélection d'un caractère spécifique 

Il est possible de sélectionner un caractère d'une chaîne avec son index.

```python
# ===================
# selectionner un character
# =========================
text = "Hello"
for i in range(len(text)):
    print(text[i])
```

### Inclusion de sous chaîne 

#### `in` 

Permet de vérifier la présence d'une sous-chaîne dans une chaîne.

```python 
# =====================
# in 
# =====================
text = "Hello, world!"
print("world" in text)  # Affichera : True
```

#### `find()` - index de la première occurence 

Retourne l'index de la première occurence de la sous-chaîne si trouver, sinon retourne `-1`.

```python 
# =====================
# find()
# =====================
text = "Hello, world!"
position = text.find("world")
print(position)  # Affichera : 7
```

#### `index()` - index de la première occurence

Retourne l'index, et si non trouvé une erreur 

```python 
text = "Hello, world!"
try:
    position = text.index("world")
    print(position)  # Affichera : 7
except ValueError:
    print("Sous-chaîne non trouvée.")
```

#### `count()` - nombre de fois qu'une substring est trouvé

Compte le nombre de fois qu'une sous chaîne apparaît dans une chaîne. 

```python 
text = "Hello, world!"
cnt = text.count("l")
print(cnt)  # Affichera : 3
```

### Extraction de sous-chaîne 

#### `slice` 

```python
# ========================
# extraction  
# ========================
text = "Hello, world!"
substring = text[7:12]  # Affichera 'world'

# ==========================
# 7 jusqua la fin 
# ==========================
text = "Hello, world!"
substring = text[7:]  # Affichera 'world!'

# ===========================
# début au 10 eme 
# ===========================
text = "Hello, world!"
substring = text[:10]  # Affichera 'Hello, wor'

# ===========================
# dernier caractère 
# ===========================
text = "Python"
last_char = text[-1]
print(last_char)  # Affichera : 'n'

# ============================
# avant dernier carctere 
# ============================
text = "Python"
second_last_char = text[-2]
print(second_last_char)  # Affichera : 'o'

# ==============================
# trois derniers 
# ==============================
text = "Python"
last_three = text[-3:]
print(last_three)  # Affichera : 'hon'

# ===============================
# exclure le dernier caractere
# ===============================
text = "Python"
all_but_last = text[:-1]
print(all_but_last)  # Affichera : 'Pytho'

# =================================
# inversion
# =================================
print(text[::-1])  # '!dlrow ,olleH'
```

### Modification de chaîne 

Toutes les fonctions de modification vienne créer une nouvelle chaîne.

#### `strip()` - nettoyage

Permet de supprimer les espaces en début et fin de chaîne 

```python 
# ==========================
# strip()
# ==========================
text = "  hello world!  "
cleaned_text = text.strip()
print(cleaned_text)  # Affichage: "hello world!"
```

#### `lower()` - minuscule 

Permet de passer la chaîne en minuscule 

```python 
text = "Hello World!"
lower_text = text.lower()
print(lower_text)  # Affichage: "hello world!"
```

#### `upper()` - majuscule 

Permet de passer la chaîne en majuscule 

```python 
text = "Hello World!"
upper_text = text.upper()
print(upper_text)  # Affichage: "HELLO WORLD!"
```

#### `split()` - divise une chaîne

Permet de diviser une chaîne selon le séparateur donné 

```python 
text = "one,two,three"
parts = text.split(',')
print(parts)  # Affichage: ['one', 'two', 'three']
```

#### `join` - combinaison 

Permet de combiner une collection de chaîne en une seule chaîne

```python 
parts = ['one', 'two', 'three']
joined_text = ','.join(parts)
print(joined_text)  # Affichage: "one,two,three"
```

#### `replace(old, new)` - remplace les occurences

Remplace toutes les occurences de la sous chaîne `old` par la sous chaîne `new`

```python 
text = "hello world"
replaced_text = text.replace("world", "everyone")
print(replaced_text)  # Affichage: "hello everyone"
```

#### `startswith(prefix)`

Vérifie si la chaîne débute par l'argument 

```python 
text = "hello world"
print(text.startswith("hello"))  # Affichage: True
```

#### `endswith()` 

Vérifie si la chaîne se termine par le suffixe

```python 
text = "hello world"
print(text.endswith("world"))  # Affichage: True
```

### Frozenset 

#### Création 

La collection `frozenset` est une version immuable de `set`. Offre toutes les fonctionnalités d'un ensemble, mais ne permet pas de modifier ses éléments après sa création. Utilie pour les situations oà il est nécessaire de stocker des éléments uniques et de garantir que l'ensemble ne sera pas modifié.

```python 
# =====================
# création depuis une liste
# =====================
fset1 = frozenset([1, 2, 3, 4])
print(fset1)  # Résultat: frozenset({1, 2, 3, 4})

# ========================
# création depuis une chaîne 
# ==========================
fset2 = frozenset("hello")
print(fset2)  # Résultat: frozenset({'h', 'e', 'l', 'o'})

# =============================
# création vide 
# =============================
fset3 = frozenset()
print(fset3)  # Résultat: frozenset()
```

#### Méthodes 

```python 
# ====================
# union 
# ====================
fset1 = frozenset([1, 2, 3, 4])
fset2 = frozenset([3, 4, 5, 6])

# Union d'ensembles (union)
print(fset1 | fset2)  # Résultat: frozenset({1, 2, 3, 4, 5, 6})
print(fset1.union(fset2))  # Résultat: frozenset({1, 2, 3, 4, 5, 6})

# ============================
# intersection 
# ============================
fset1 = frozenset([1, 2, 3, 4])
fset2 = frozenset([3, 4, 5, 6])

# Intersection d'ensembles (intersection)
print(fset1 & fset2)  # Résultat: frozenset({3, 4})
print(fset1.intersection(fset2))  # Résultat: frozenset({3, 4})

# =========================
# difference
# =========================
fset1 = frozenset([1, 2, 3, 4])
fset2 = frozenset([3, 4, 5, 6])

# Différence d'ensembles (difference)
print(fset1 - fset2)  # Résultat: frozenset({1, 2})
print(fset1.difference(fset2))  # Résultat: frozenset({1, 2})

# =============================
# symemetric difference
# =============================
fset1 = frozenset([1, 2, 3, 4])
fset2 = frozenset([3, 4, 5, 6])

# Différence symétrique (symmetric difference)
print(fset1 ^ fset2)  # Résultat: frozenset({1, 2, 5, 6})
print(fset1.symmetric_difference(fset2))  # Résultat: frozenset({1, 2, 5, 6})
```

#### Utilisation 

```python 
# ====================================
# clé dans dictionnaire 
# ====================================
fset1 = frozenset([1, 2, 3])
fset2 = frozenset([3, 4, 5])

d = {fset1: "first", fset2: "second"}
print(d)  # Résultat: {frozenset({1, 2, 3}): 'first', frozenset({3, 4, 5}): 'second'}
```

---

## 14 - Dictionnaire 

Collection de paires clé-valeur, oà chaque clé est unique.

Si une paire clé valeur qui existe déjà est ajoutée au dictionnaire, la valeur ancienne sera remplacé par la nouvelle.

A partir de python 3.7, le dictionnaire est ordonnée. L'ordre d'ajout des éléments est conservé.

Le dictionnaire est mutable.

Il sont optimnisé pour la recherche rapide, l'ajout et la supression de paire clé-valeur.

### Création 

```python
# ========================
# dict vide
# =========================
empty_dict = {}

# ==========================
# dict avec éléments
# ==========================
person = {
    "name": "John",
    "age": 30,
    "city": "New York"
}

# ===========================
# dict()
# ===========================
# Création d'un dictionnaire à partir d'une liste de tuples
person = dict([("name", "John"), ("age", 30), ("city", "New York")])

# Création d'un dictionnaire avec des arguments nommés
person = dict(name="John", age=30, city="New York")

# ============================
# dict.fromkeys()
# ============================
# crée un dictionnaire avec les clé données et une valeur par défaut 
# le dict aura trois clé mais elle contiendront toutes la même valeur
keys = ["name", "age", "city"]
default_value = None
person = dict.fromkeys(keys, default_value)

# ==============================
# création à partir de variables
# ==============================
name = "John"
age = 30
city = "New York"

person = {"name": name, "age": age, "city": city}

# ==============================
# comprehension 
# ==============================
squares = {x: x**2 for x in range(1, 6)}
```

### Accés aux valeurs 

Si une clé n'est pas trouvée, une erreur `KeyError` se produit.

```python 
# ========================
# accés 
# ========================
person = {"name": "John", "age": 30, "city": "New York"}
print(person["name"])  # Affichera : John
```

#### `get()` - accés sans erreur 

Permet d'obtenir une valeur du dictionnaire sans risque d'erreur si la clé n'est pas présente. Si la clé est absente, la valeur par défaut est retournée, `None` si le deuxième argument pour cette valeur n'est pas passé.

```python
# =========================
# accès par get()
# =========================
person = {"name": "John", "age": 30, "city": "New York"}
print(person.get("name"))  # Affichera : John
print(person.get("address", "Adresse non trouvée"))  # Affichera : Adresse non trouvée
```

#### `setdefault()` - retourne et ajout

Fonctionne comme `get()`, mais si la valeur n'est pas trouvée, retourne la valeur par défaut et ajoute une nouvelle paire clé valeur .

```python
# =======================
# setdefault()
# =======================
person = {"name": "Alice", "age": 25}
city = person.setdefault("city", "New York")
print(city)  # Sortie : New York
print(person)  # Sortie : {'name': 'Alice', 'age': 25, 'city': 'New York'}
```

### Modification 

#### Ajout d'éléments 

```python 
# =============================
# ajout d'élément unique 
# =============================
person = {"name": "Alice", "age": 25}

# Ajout d'un nouvel élément au dictionnaire
person["city"] = "New York"

# Affichage du dictionnaire mis à jour
print(person)  # Sortie : {'name': 'Alice', 'age': 25, 'city': 'New York'}

# ===================================
# ajout si clé absente 
# ===================================
person = {"name": "Alice", "age": 25}

# Ajout de l'élément uniquement si la clé est absente
if "city" not in person:
    person["city"] = "New York"

# Affichage du dictionnaire mis à jour
print(person)  # Sortie : {'name': 'Alice', 'age': 25, 'city': 'New York'}

# =======================================
# ajout multiple avec update()
# =======================================
person = {"name": "Alice", "age": 25}
updates = {"city": "New York", "country": "USA"}

# Mise à jour du dictionnaire avec de nouveaux éléments
person.update(updates)

# Affichage du dictionnaire mis à jour
print(person)  # Sortie : {'name': 'Alice', 'age': 25, 'city': 'New York', 'country': 'USA'}

# ===========================================
# ajout multiple avec update et arguments nommés
# ===============================================
person = {"name": "Alice", "age": 25}

# Utilisation d'arguments nommés pour ajouter des éléments
person.update(city="New York", country="USA")

# Affichage du dictionnaire mis à jour
print(person)  # Sortie : {'name': 'Alice', 'age': 25, 'city': 'New York', 'country': 'USA'}
```

#### Modification des éléments 

```python 
# ===============================
# update par clé 
# ===============================
person = {"name": "Alice", "age": 25, "city": "New York"}

# Mise à jour de la valeur par clé
person["age"] = 26

# Affichage du dictionnaire mis à jour
print(person)  # Sortie : {'name': 'Alice', 'age': 26, 'city': 'New York'}

# =======================================
# update avec setdefault()
# =======================================
person = {"name": "Alice", "age": 25}

# Utilisation de setdefault pour ajouter un élément
city = person.setdefault("city", "New York")

# Affichage de la valeur de la ville
print(city)  # Sortie : New York

# Affichage du dictionnaire mis à jour
print(person)  # Sortie : {'name': 'Alice', 'age': 25, 'city': 'New York'}

# =========================================
# update avec update()
# =========================================
person = {"name": "Alice", "age": 25}
updates = {"age": 30, "city": "New York"}

# Mise à jour du dictionnaire en utilisant la méthode update()
person.update(updates)

# Affichage du dictionnaire mis à jour
print(person)  # Sortie : {'name': 'Alice', 'age': 30, 'city': 'New York'}
```

### Suppression 

```python 
# ======================
# del 
# ======================
person = {"name": "John", "age": 30, "city": "New York"}
del person["age"]
print(person)  # Affichera : {'name': 'John', 'city': 'New York'}

# =========================
# pop()
# =========================
person = {"name": "John", "age": 30, "city": "New York"}
age = person.pop("age")
print(person)  # Affichera : {'name': 'John', 'city': 'New York'}
print(age)     # Affichera : 30

# ==============================
# popitem() - supprime et renvoie la derniere paire clé valeur ajoutée 
# ==============================
person = {"name": "Alice", "age": 25, "city": "New York"}

# Suppression et obtention de la dernière paire clé-valeur ajoutée
last_item = person.popitem()

# Affichage de la paire supprimée
print(last_item)  # Sortie : ('city', 'New York')

# Affichage du dictionnaire mis à jour
print(person)  # Sortie : {'name': 'Alice', 'age': 25}

# ================================
# clear() - nettoyage
# ================================
person = {"name": "Alice", "age": 25, "city": "New York"}

# Nettoyage du dictionnaire
person.clear()

# Affichage du dictionnaire nettoyé
print(person)  # Sortie : {}
```

### Vérifier la présence d'élément

#### Vérifier la présence de clé

```python 
# ================================
# in
# ================================
person = {"name": "Alice", "age": 25, "city": "New York"}

# Vérifions la présence des clés "name" et "country" dans le dictionnaire
print("name" in person)  # Résultat : True
print("country" in person)  # Résultat : False

# Exemple d'utilisation dans une instruction conditionnelle
if "age" in person:
    print("La clé 'age' est présente dans le dictionnaire.")
else:
    print("La clé 'age' est absente du dictionnaire.")

# =================================
# get()
# =================================
person = {"name": "Alice", "age": 25, "city": "New York"}

# Obtenons la valeur pour la clé "age"
value = person.get("age")

# Vérifions si la clé "age" est présente dans le dictionnaire
if value is not None:
    print("La clé 'age' est présente dans le dictionnaire.")
else:
    print("La clé 'age' est absente du dictionnaire.")

# =========================================
# keys()
# =========================================
person = {"name": "Alice", "age": 25, "city": "New York"}

# Vérifions la présence de la clé "name" dans la vue des clés du dictionnaire
if "name" in person.keys():
    print("La clé 'name' est présente dans le dictionnaire.")
else:
    print("La clé 'name' est absente du dictionnaire.")
```

#### Vérifier la présence de valeur

```python
# ================================
# values()
# ================================
person = {"name": "Alice", "age": 25, "city": "New York"}

# Vérifions la présence de la valeur 25 dans le dictionnaire
if 25 in person.values():
    print("La valeur 25 est présente dans le dictionnaire.")
else:
    print("La valeur 25 est absente du dictionnaire.")

# ==================================
# set()
# ==================================
person = {"name": "Alice", "age": 25, "city": "New York"}

# Convertissons la vue des valeurs en un ensemble
values_set = set(person.values())

# Vérifions la présence de la valeur "New York" dans l'ensemble des valeurs
if "New York" in values_set:
    print("La valeur 'New York' est présente dans le dictionnaire.")
else:
    print("La valeur 'New York' est absente du dictionnaire.")

# =======================================
# utilisation d'un générateur 
# =======================================
person = {"name": "Alice", "age": 25, "city": "New York"}
value_to_find = 25

# Utilisons un générateur pour vérifier la présence d'une valeur
if any(value == value_to_find for value in person.values()):
    print(f"La valeur {value_to_find} est présente dans le dictionnaire.")
else:
    print(f"La valeur {value_to_find} est absente du dictionnaire.")
```

### Parcourir les éléments 

```python 
# =========================
# itération 
# =========================
# Parcours des clés du dictionnaire
person = {"name": "John", "age": 30, "city": "New York"}
for key in person:
    print(key)

# Parcours des valeurs du dictionnaire
for value in person.values():
    print(value)

# Parcours des paires clé-valeur du dictionnaire
for key, value in person.items():
    print(f"{key}: {value}")
```

#### `enumerate()`

Itère le dictionnaire en fournissant l'accés aux indices, clé et valeurs 

```python 
# ===================================
# parcourt le dictionnaire 
# ==================================
# Dictionnaire avec des données sur une personne
person = {"name": "Alice", "age": 25, "city": "New York"}

# Itération sur les clés et valeurs du dictionnaire avec indices
for index, (key, value) in enumerate(person.items()):
    print(f"Index : {index}, Clé : {key}, Valeur : {value}")
    # Affiche l'indice, la clé et la valeur de chaque élément du dictionnaire

"""
Résultat 
Index : 0, Clé : name, Valeur : Alice
Index : 1, Clé : age, Valeur : 25
Index : 2, Clé : city, Valeur : New York
"""

# ====================================
# modification avec indice 
# ====================================
# Dictionnaire initial
person = {"name": "Alice", "age": 25, "city": "New York"}

# Nouveau dictionnaire avec des indices dans les valeurs
indexed_person = {}
for index, (key, value) in enumerate(person.items()):
    indexed_person[key] = f"{value}_{index}"
    # Associe à la valeur du dictionnaire un indice sous forme de chaîne

print(indexed_person)
# {'name': 'Alice_0', 'age': '25_1', 'city': 'New York_2'}

# ====================================
# création nouveau dict 
# ====================================
# Dictionnaire initial
person = {"name": "Alice", "age": 25, "city": "New York"}

# Nouveau dictionnaire où les indices sont utilisés comme clés
indexed_person = {index: (key, value) for index, (key, value) in enumerate(person.items())}
print(indexed_person)
# {0: ('name', 'Alice'), 1: ('age', 25), 2: ('city', 'New York')}


```



```

### Utilisation 

```python 
# ===============================
# compter la fréquence des mots 
# ===============================
text = "hello world hello"
word_count = {}

for word in text.split():
    if word in word_count:
        word_count[word] += 1
    else:
        word_count[word] = 1

print(word_count)  # Affichera : {'hello': 2, 'world': 1}

# ======================================
# stockage des données 
# =======================================
students = {
    "123": {"name": "John", "age": 20, "major": "Computer Science"},
    "124": {"name": "Alice", "age": 22, "major": "Mathematics"}
}
print(students["123"]["name"])  # Affichera : John

# ===========================================
# annuaire 
# ===========================================
phone_book = {
    "John": "123-456-7890",
    "Alice": "987-654-3210"
}
print(phone_book["Alice"])  # Affichera : 987-654-3210
```

### Travail avec le dictionnaire 

#### `len()`

Retourne le nombre de paire clé-valeur 

```python 
# ===========================
# len()
# ===========================
person = {"name": "Alice", "age": 25, "city": "New York"}
num_elements = len(person)
print(num_elements)  # Sortie : 3 

# =============================
# check si vide 
# =============================
empty_dict = {}
print(len(empty_dict))  # Sortie : 0

person = {"name": "Alice", "age": 25, "city": "New York"}

if len(person) > 0:
    print("Le dictionnaire n'est pas vide")
else:
    print("Le dictionnaire est vide")

# ======================================
# dictionnaire avec structures imbriquées 
# =======================================
# len() prends en compte seulement les clé de niveau supérieur
complex_dict = {
    name: "Alice",
    details: {
        age: 25,
        city: "New York"
    },
    hobbies: ["reading", "traveling"]
}
print(len(complex_dict))  # Sortie : 3
```

#### `type()`

Retourne le type de la variable.

```python 
# ==============================
# check type 
# ==============================
person = {"name": "Alice", "age": 25, "city": "New York"}
print(type(person))  # Sortie : <class 'dict'>

# ==============================
# vérification conditionnelle
# ==============================
data = {"name": "Alice", "age": 25, "city": "New York"}

if type(data) is dict:
    print("C'est un dictionnaire.")
else:
    print("Ce n'est pas un dictionnaire.")

# =====================================
# check avec fonction 
# =====================================
def process_data(data):
    if type(data) is dict:
        print("Traitement du dictionnaire...")
        # Réalisation d'opérations sur le dictionnaire
    else:
        print("Erreur : un dictionnaire était attendu.")

data = {"name": "Alice", "age": 25, "city": "New York"}
process_data(data)
```

### Vues de dictionnaire

Des méthodes permettent d'accèder aux données. Ces méthodes ne retourne pas simplement des listes d'éléments, mais des `view`. Elles offrent une repésentation dynamique des clés, valeurs et paire clé valeur contenues dans le dictionnaire.
Ces vue se mettent à jour lorsque le dictionnaire change.

#### `keys()` - retourne les clés

Retourne une vue des clé du dictionnaire. Le résultat est un objet `dict_keys` qui supporte l'itération et autres opérations similaire aux sets.

```python 
# =========================
# keys()
# =========================
person = {"name": "Alice", "age": 25, "city": "New York"}
keys = person.keys()
print(keys)  # dict_keys(['name', 'age', 'city'])

# =============================
# itération 
# =============================
for key in person.keys():
    print(key)
# Sortie : # name # age # city
```

#### `values()` - retournes les valeurs 

Retourne une vue de toutes les valeurs du dictionnaire. 

```python 
# ========================
# values()
# =========================
person = {"name": "Alice", "age": 25, "city": "New York"}
values = person.values()
print(values)  # dict_values(['Alice', 25, 'New York'])

# ============================
# itération 
# ============================
for value in person.values():
    print(value)
# Sortie : # Alice # 25 # New York
```

#### `items()` - retourne les clé-valeur 

Retourne une vue de toutes les paires clé valeur du dictionnaire.

```python 
# ==========================
# items()
# ==========================
person = {"name": "Alice", "age": 25, "city": "New York"}
items = person.items()
print(items)  # dict_items([('name', 'Alice'), ('age', 25), ('city', 'New York')])

# ===========================
# itération 
# ===========================
for key, value in person.items():
    print(f"{key}: {value}")
# Sortie : # name: Alice # age: 25 # city: New York
```

#### Mise à jours dynamique 

Avec les vues, le contenue est mis à jour dynamiquemenet. Si le dictionnaire change, les vues refletent automatiquement ces changements.

```python 
# =======================
# mise à jour 
# =======================
person = {"name": "Alice", "age": 25}
keys = person.keys()
print(keys)  # dict_keys(['name', 'age'])

# Ajouter un nouvel élément
person["city"] = "New York"
print(keys)  # dict_keys(['name', 'age', 'city'])
```

#### Conversion des vue en collections 

Les vues peuvent être convertis en listes, lets ou tuples pour réaliser des opérations supplémentaires 

```python 
# ======================
# conversion 
# ======================
person = {"name": "Alice", "age": 25, "city": "New York"}

# Conversion de keys() en liste
keys_list = list(person.keys())
print(keys_list)  # ['name', 'age', 'city']

# Conversion de values() en set
values_set = set(person.values())
print(values_set)  # {'Alice', 25, 'New York'}

# Conversion de items() en liste de tuples
items_list = list(person.items())
print(items_list)  # [('name', 'Alice'), ('age', 25), ('city', 'New York')]
```

### Génération 

#### Dictionary Comprehension 

```python 
# syntaxe 
{expression1: expression2 for variable in sequence if condition}
```

- `variable`: variable qui prends la valeur de chaque élément 
- `sequence`: objet itérable qui est parcouru par la variable 
- `expression1`: expression pour générer les cle. Dépend de la variable
- `expression2`: expression pour générer les valeurs du dict
- `condition`: optionnel - condition qui doit être remplie pour inclure l'élément

```python
# ===================================
# génération avec carré des nombres 
# =====================================
# Création d'un dictionnaire où les clés sont les nombres de 1 à 5 et les valeurs leurs carrés
squares = {x: x ** 2 for x in range(1, 6)}
print(squares)  # Affiche : {1: 1, 2: 4, 3: 9, 4: 16, 5: 25}

# ====================================
# création depuis une liste de tuples
# =====================================
# Liste de tuples contenant des paires clé-valeur
pairs = [("name", "Alice"), ("age", 25), ("city", "New York")]

# Génération d'un dictionnaire à partir d'une liste de tuples
person = {key: value for key, value in pairs}
print(person)  # Affiche : {'name': 'Alice', 'age': 25, 'city': 'New York'}

# =========================================
# filtrage lors de la création 
# =========================================
# Création d'un dictionnaire où les clés sont les nombres de 1 à 10 et les valeurs leurs carrés
# Uniquement pour les nombres pairs
even_squares = {x: x ** 2 for x in range(1, 11) if x % 2 == 0}
print(even_squares)  # Affiche : {2: 4, 4: 16, 6: 36, 8: 64, 10: 100}

# ========================================
# transformation lors de la création 
# ========================================
# Liste de chaînes
words = ["apple", "banana", "cherry"]

# Génération d'un dictionnaire où les clés sont des chaînes et les valeurs leur longueur
word_lengths = {word: len(word) for word in words}
print(word_lengths)  # Affiche : {'apple': 5, 'banana': 6, 'cherry': 6}

# =======================================
# Dictionary imbriqué 
# =======================================
# Liste de listes avec des paires clé-valeur
nested_pairs = [[("a", 1), ("b", 2)], [("c", 3), ("d", 4)]]

# Génération d'un dictionnaire à partir d'une liste imbriquée
nested_dict = {key: value for sublist in nested_pairs for key, value in sublist}
print(nested_dict)  # Affiche : {'a': 1, 'b': 2, 'c': 3, 'd': 4}

# =============================================
# méthode combiné
# =============================================
# Fusion de plusieurs dictionnaires en un
dict1 = {"name": "John", "age": 30}
dict2 = {"city": "New York", "country": "USA"}
# ** avant le nom permet de décomposer ses éléments 
# ici on combine les éléments des deux dictionnaires
combined_dict = {**dict1, **dict2}
print(combined_dict)  # Affiche : {'name': 'John', 'age': 30, 'city': 'New York', 'country': 'USA'}
```

### Dictionnaire imbriqués 

#### Création 

```python 
# ============================
# création 
# ============================
person = {
    "name": "Alice",
    "details": {
        "age": 25,
        "city": "New York",
        "address": {
            "street": "123 Main St",
            "zip": "10001"
        },
        "mother": "Jane Smith"
    },
    "gender": "female"
}
print(person)  
# Sortie : {'name': 'Alice', 'details': {'age': 25, 'city': 'New York', 'address': {'street': '123 Main St', 'zip': '10001'}, 'mother': 'Jane Smith'}, 'gender': 'female'}

# ================================
# création depuis des morceaux 
# ================================
address = {
    "street": "123 Main St",
    "zip": "10001"
}

details = {
    "age": 25,
    "city": "New York",
    "address": address
}

person = {
    "name": "Alice",
    "details": details,
    "gender": "female"
}
print(person)  
# Sortie : {'name': 'Alice', 'details': {'age': 25, 'city': 'New York', 'address': {'street': '123 Main St', 'zip': '10001'}}, 'gender': 'female'}
```

#### Accès aux éléments 

```python
# ===========================
# accès aux éléments de niveau supérieur 
# ============================
name = person["name"]
print(name)  # Sortie : Alice

# ===================================
# accés aux dictionnaire imbriqué
# ====================================
age = person["details"]["age"]
city = person["details"]["city"]
print(age)  # Sortie : 25
print(city)  # Sortie : New York

# ====================================
# accés aux niveau plus profond
# =====================================
street = person["details"]["address"]["street"]
zip_code = person["details"]["address"]["zip"]
print(street)  # Sortie : 123 Main St
print(zip_code)  # Sortie : 10001
```

#### Modification 

```python 
# ==========================
# modification niveau supérieur 
# ============================
person["name"] = "Bob"
print(person["name"])  # Sortie : Bob

# ==============================
# modification imbrique
# ===============================
person["details"]["age"] = 26
print(person["details"]["age"])  # Sortie : 26

# =================================
# modification profonde
# =================================
person["details"]["address"]["city"] = "Los Angeles"
print(person["details"]["address"]["city"])  # Sortie : Los Angeles

# ====================================
# ajout dans imbriqué 
# ===================================
person["details"]["phone"] = "123-456-7890"
print(person["details"]["phone"])  # Sortie : 123-456-7890

# ===================================
# suppression niveau sup
# ===================================
# Suppression de l'élément 'country' du dictionnaire 'person'
del person["country"]
print(person)  # L'élément 'country' sera supprimé du dictionnaire

# ===============================
# supression dict imbrique
# ================================
# Suppression de l'élément 'phone' du dictionnaire 'details'
del person["details"]["phone"]
print(person["details"])  # L'élément 'phone' sera supprimé du dictionnaire 'details'
```

#### Parcours 

```python 
# ==========================
# iteration dict imbriqué
# ===========================
for key, value in person.items():  # On parcourt le dictionnaire parent
    if isinstance(value, dict):  # Si la valeur est un dictionnaire
        for key2, value2 in value.items():  # On parcourt les éléments du dictionnaire enfant
            print(f"{key} --> {key2}: {value2}")

# =================================
# iteration recursive
# =================================
def print_dict(d, indent=0):
    for key, value in d.items():
        print("  " * indent + str(key) + ": ", end="")
        if isinstance(value, dict):
            print()
            print_dict(value, indent + 1)
        else:
            print(value)

print_dict(person)

# ===============================
# recherche recursive 
# ===============================
def find_key(d, key):
    if key in d:
        return d[key]
    for k, v in d.items():
        if isinstance(v, dict):
            result = find_key(v, key)
            if result:
                return result
    return None

phone = find_key(person, "phone")
print(phone)  # Sortie : None (puisque l'élément 'phone' a été supprimé)
```

## 15 - Fonction d'ordre supérieur 

### Fonctions intégrées 

#### `id()` - identifiant unique d'un objet 

La fonction renvoie l'identifiant unique d'un objet. Cet identifiant est un entier et reste unique pour l'objet pendant toute sa durée d'existence. Il correspond généralement à l'adresse de l'objet en mémoire.

```python 
# =====================
# id()
# =====================
a = [1, 2, 3]
b = a
print(id(a))  # Affiche l'identifiant de l'objet 'a'
print(id(b))  # Affiche le même identifiant, car 'b' fait référence au même objet
```

#### `hash()` - hash d'un objet 

La fonction renvoie la valeur de hachage pour l'objet spécifié si celui ci est hachage. Ces objets doivent être immuables et avoir une valeur de hachage constante pendant leur cycle de vie.

Ces valeurs sont utilisées dans les dictionnaire et les ensembles pour une recherche rapide. Utilisé pour optimiser la recherche et le stockage des données, où des vérifications rapides d'égalité et d'unicité sont nécessaire.

```python 
# ==========================
# hash()
# ==========================
print(hash("hello"))  # Renvoie la valeur de hachage de la chaîne "hello"
print(hash(42))       # Renvoie la valeur de hachage du nombre 42
print(hash((1, 2, 3)))  # Renvoie la valeur de hachage du tuple (1, 2, 3)
```

#### `dir()` - liste des attributs et méthodes d'un objet 

La fonction retourne une liste des attributs et méthodes d'un objet. Si aucun objet n'est spécifié, retourne la liste des noms dans le scope local actuel. Cette fonction permet d'explorer la structure des objets et leurs attributs.

```python 
# =======================
# dir()
# =======================
class MyClass:
    def __init__(self):
        self.name = "Alice"

    def greet(self):
        print("Hello, " + self.name)

obj = MyClass()
print(dir(obj))  # Affiche la liste des attributs et méthodes de l'objet 'obj'
print(dir())     # Affiche la liste des noms dans le scope local actuel
```

### Travailler avec les collections 

#### `zip()` 

La fonction regroupe plusieurs objets itérable (listes, tuples, chaînes) et renvoie un itérateur de tuples. Chaque tuple contient des éléments rassemblés à partir de positions de mêne index de tous les objets itérables.

```python
# ===========================
# zip()
# ===========================
names = ["Alice", "Bob", "Charlie"]
ages = [25, 30, 35]
combined = zip(names, ages)
print(list(combined))  # Affiche : [('Alice', 25), ('Bob', 30), ('Charlie', 35)]
```

#### `max()` 

Retourne le plus grand élément d'un objet itérable passé en argument ou parmis plusieurs arguments fournis. On peut spécifier une fonction clé pour déterminer la règle de comparaison 

```python 
# ========================
# max()
# ========================
numbers = [1, 2, 3, 4, 5]
print(max(numbers))  # Affiche : 5

# Avec une fonction clé
words = ["apple", "banana", "cherry"]
print(max(words, key=len))  # Affiche : 'banana'
```

#### `min()`

Renvoie le plus petit élément d'un objet itérable passé en argument ou parmis plusieurs arguments fournis. On peut spécifier une fonction clé pour déterminer la règle de comparaison 

```python 
# ========================
# min()
# ========================
numbers = [1, 2, 3, 4, 5]
print(min(numbers))  # Affiche : 1

# Avec une fonction clé
words = ["apple", "banana", "cherry"]
print(min(words, key=len))  # Affiche : 'apple'
```

#### `count()`

La fonction permet de compter le nombre d'occurence d'un élément dans un objet itérable, tel qu'uyne liste ou une chaîne de caractères. Appelée sur une liste, une collection ou un itérateur 

```python 
# =========================
# count()
# =========================
numbers = [1, 2, 2, 3, 4, 2, 5]
print(numbers.count(2))  # Affiche : 3

text = "hello world"
print(text.count("o"))  # Affiche : 2
```

#### `sum()`

Retourne la somme de tous les éléments d'un objet itérable. On peut optionnellement spècifier une valeur initial qui sera ajoutée à la somme 

```python 
# ====================
# sum()
# ====================
numbers = [1, 2, 3, 4, 5]
print(sum(numbers))  # Affiche : 15

# Avec une valeur initiale
print(sum(numbers, 10))  # Affiche : 25'
```

### Exécution de code 

#### `eval()`

La fonction prend une chaîne et l'exécute comne une expression Python. Elle renvoie le résultat de l'exécution de cette expression. Utilisée pour évaluer des expressions sous forme de chaîne 

```python 
# ========================
# eval()
# =========================
x = 10
result = eval("x + 5")
print(result)  # Affiche : 15
```

#### `exec()` 

La fonction prend une chaîne et l'exécute comme du code Python. Peut exécuter n'importe quel instruction Python, y compris les définitions de fonctions, boucles et importation de module. La fonction ne retourne aucune valeur.

Utilisée pour exécuter des scripts dynamique et définir de nouvelles fonctions ou classes pendant l'exécution du programme

```python 
# ===================
# exec()
# ===================
code = """
def greet(name):
    print(f"Hello, {name}!")

greet("Alice")
"""
exec(code)
# Affiche : Hello, Alice!
```

### Fonction anonyme | lambda

Fonctions compactes en une seule ligne sans nom. Elles sont crées à la volée et sont généraledment utilisées pour des opérations simple.

#### Déclaration 

```python
# ======================
# fonction anonyme
# ======================
# syntaxe
lambda arguments: expression

# lambda 
square = lambda x: x ** 2
print(square(5))  # Affiche: 25

# normal 
def square(x):
    return x ** 2
print(square(5))  # Affiche: 25

# lambda
sum = lambda a, b: a + b
# normal 
def sum(a, b):
    return a + b
```

#### Utilisation 

Les fonctions lambda sont généralement utiliser en combinaison avec d'autres fonctions ou comme arguments pour d'autres fonctions 

##### `map()` 

Applique une fonction donnée à chaque élément d'un objet itérable et renvoie un itérateur avec les résultats.

```python 
numbers = [1, 2, 3, 4, 5]
squared_numbers = list(map(lambda x: x ** 2, numbers))
print(squared_numbers)  # Affiche: [1, 4, 9, 16, 25]
```

##### `filter()`

Retourne un itérateur composé des éléments d'un objet itérable pour lesquels une fonction donnée renvoie True.

```python 
numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
even_numbers = list(filter(lambda x: x % 2 == 0, numbers))
print(even_numbers)  # Affiche: [2, 4, 6, 8, 10]
```

##### `sorted()`

Trie les éléments d'un objet itérable.

```python 
words = ["banana", "apple", "cherry", "date"]
sorted_words = sorted(words, key=lambda x: len(x))
print(sorted_words)  # Affiche: ['date', 'apple', 'banana', 'cherry']
```

##### Fonction anonyme comme argument 

```python 
pairs = [(1, 'one'), (2, 'two'), (3, 'three'), (4, 'four')]
pairs.sort(key=lambda pair: pair[1])
print(pairs)  # Affiche: [(4, 'four'), (1, 'one'), (3, 'three'), (2, 'two')]
```

### Closure 

Une closure est une fonction qui capture les variables de son environnement immédiat, même après que cet environnement a terminé son exécution. La closure peut se souvenir des valeurs des variables de son environnement extérieur et continuer à travailler avec elles, même lorsque son environnement n'est plus actif

```python 
# exemple 
def outer_function(x):
    def inner_function(y):
        return x + y

    return inner_function

closure = outer_function(10)
print(closure(5))  # Sortie: 15
```

La fonction exterieur `outer_function` prends un argument `x` et définit une fonction interne `inner_function` qui prend un argument `y` et retourne la somme de `x` et `y`. La fonction `inner_function` n'est pas appelée à l'intérieur de `outer_function` mais seulement déclarè

La fonction interne `inner_function` est retournée par `outer_function` et conserve une référence à la valeur de `x` qui à été passée à `outer_function`.

La variable `closure` devient une closure qui se souvient de la valeur de `x` et peut l'utiliser.

#### Fonction généractrice 

Les closures peuvent être utilisées pour créer des fonction génératrice qui génèrent des séquence de valeurs 

```python 
def make_counter():
    # variable 
    count = 0

    # closure
    def counter():
        # nonlocal pour modifier la valeur de la variable
        nonlocal count
        count += 1
        return count

    return counter

counter = make_counter()
print(counter())  # Sortie: 1
print(counter())  # Sortie: 2
print(counter())  # Sortie: 3
```

`make_counter` est la fonction génératrice. Elle créer une variable `count` et renvoie une fonction interne `counter` qui augmente la valeur de `count` et la retourne.

La fonction `counter` conserve l'état de la variable `count` et peut modifier à chaque appel.

#### Fonction avec configuration 

```python 
def make_multiplier(factor):
    def multiplier(x):
        return x * factor

    return multiplier

double = make_multiplier(2)
triple = make_multiplier(3)

print(double(5))  # Sortie: 10
print(triple(5))  # Sortie: 15
```

La fonction configuratrice `make_multiplier` prends un multiplicator `factor` et retourne une fonction interne `multiplier` qui multiplie la valeur d'entrée par `factor`

Les fonctions `double ` et `triple` sont des closures qui conservent leur propre valeurs de `factor` et les utilisent pour la multiplication.

#### Filtrage de données avec paramètres 

```python 
def make_filter(threshold):
    def filter_func(value):
        return value > threshold

    return filter_func

filter_above_10 = make_filter(10)
data = [5, 10, 15, 20]
filtered_data = list(filter(filter_above_10, data))
print(filtered_data)  # Sortie: [15, 20]
```

La fonction filtre `make_filter` prend une valeur seuil `thresold` et retourne une fonction interne `filter_func` qui vérifie si la valeur dépasse le seuil

La fonction `filter_func` conserve la valeur de `threshold` et l'utilise pour filtrer les données

### Générateurs 

Fonctions qui retourne un objet itérateurs. Ces itérateurs génèrent des valeurs à la demande, ce qui permet de gérer de grandes quantités de données sans les charger entièrement en mémoire.

#### Générateur avec fonctions - `yield`

Utilise `yield` dans la fonction. Lorsque la fonction est appelée, elle retourne un objet générateur, mais n'exécute pas immédiatement le code dans la fonction. L'exécution est suspendue à l'expression `yield` et reprends à chaque appel de la méthode `__next__()` de l'objet générateur.

Si une fonction contient une instruction `yield`, Python créer un objet générateur qui gère l'état d'exécution de la fonction au lieu de l'exécuter.

```python 
def count_up_to(max):
    count = 1
    while count <= max:
        yield count
        count += 1

counter = count_up_to(5)
print(next(counter))  # Sortie: 1
print(next(counter))  # Sortie: 2
print(next(counter))  # Sortie: 3
print(next(counter))  # Sortie: 4
print(next(counter))  # Sortie: 5
```

#### Expression génératrice 

Retourne un objet générateur 

```python 
squares = (x ** 2 for x in range(10))

print(next(squares))  # Sortie: 0
print(next(squares))  # Sortie: 1
print(next(squares))  # Sortie: 4
```

### Avantage 

**Utilisation efficase de la mémoire**

Les générateurs calculent les valeurs à la volée, ce qui permet de traiter de grandes quantités de données sans les charger entièrement en mémoire. Cela rend les générateurs idéaux pour travailler avec de grands ensembles de données ou des flux de données.

```python 
def large_range(n):
    for i in range(n):
        yield i

for value in large_range(1000000):
    # Traiter les valeurs une par une
    print(value)
```

**Calculs paresseux**
Les générateurs effectuent des calculs paresseux, ce qui signifie qu'ils calculent les valeurs uniquement lorsqu'elles sont nécessaires. Cela permet d'éviter des calculs inutiles et d'améliorer les performances.

```python 
def fibonacci():
    a, b = 0, 1
    while True:
        yield a
        a, b = b, a + b

fib = fibonacci()
for _ in range(10):
    print(next(fib))
```

### Utilisation 

#### Séquence infinie

Permet de générer des flux de données infinis

```python 
def natural_numbers():
    n = 1
    while True:
        yield n
        n += 1

naturals = natural_numbers()
for _ in range(10):
    print(next(naturals))
```

#### Utilisation de `send()` et `close()`

```python
def echo():
    while True:
        received = yield
        print(received)

e = echo()
next(e)  # Lancer le générateur
e.send("Hello, world!")  # Sortie: Hello, world!
e.close()
```

#### Générateurs et exceptions 

Les générateurs peuvent gérer les exceptions

```python 
def controlled_execution():
    try:
        yield "Start"
        yield "Working"
    except GeneratorExit:
        print("Generator closed")

gen = controlled_execution()
print(next(gen))  # Sortie: Start
print(next(gen))  # Sortie: Working
gen.close()  # Sortie: Generator closed
```

#### Générateur imbriqués

```python 
def generator1():
    yield from range(3)
    yield from "ABC"

for value in generator1():
    print(value)

"""
# Sortie
0
1
2
A
B
C
"""
```

#### Générateur et performance 

```python
import time
import sys

def memory_usage(obj):
    return sys.getsizeof(obj)

n = 10_000_000

# Utilisation d'une liste
start_time = time.time()
list_comp = [x ** 2 for x in range(n)]
list_time = time.time() - start_time
list_memory = memory_usage(list_comp)

# Utilisation d'un générateur
start_time = time.time()
gen_comp = (x ** 2 for x in range(n))
gen_result = sum(gen_comp)  # Calculer la somme pour comparer les résultats
gen_time = time.time() - start_time
gen_memory = memory_usage(gen_comp)

print(f"Liste:")
print(f"  Temps: {list_time:.2f} sec")
print(f"  Mémoire: {list_memory:,} octets")

print(f"\nGénérateur:")
print(f"  Temps: {gen_time:.2f} sec")
print(f"  Mémoire: {gen_memory:,} octets")

"""
Liste:
  Temps: 0.62 sec
  Mémoire: 89,095,160 octets

Générateur:
  Temps: 1.13 sec
  Mémoire: 200 octets
"""
```

## 16 - Décorateurs

Fonctions qui prennent une autre fonction en tant qu'argument et retourne une nouvelle fonction, modifiant ou étendant le comportement de la fonction d'origine. 

Ils permettent de modifier le comportement des fonctions ou méthodes sans changer leur code source. Il sont utilisé pour ajouter des fonctionnalités, faire du logging, du contrôle d'accès, etc 

Python utilise le symbole `@` avant le nom du décorateur, qui est placé avant la définition de la fonction.

```python 
# =========
# syntaxe 
# ===============
@decorator
def my_function():
    pass

# équivalent :
def my_function():
    pass

my_function = decorator(my_function)
```

Dans ce code, on déclare la fonction `my_function()`, mais ensuite on la remplace par la fonction `decorator`, où la fonction est passée en paramètre. La fonction `decorator` peut appeler notre fonction.

### Déclarateur du décorateur

Le décorateur affiche un message avant et après l'appel de la fonction

```python 
# défintion du décorator
def my_decorator(func):
    def wrapper():
        print("Avant l'appel de la fonction")
        func()
        print("Après l'appel de la fonction")

    return wrapper

# utilisation du décorateur
@my_decorator
def say_hello():
    print("Hello!")

say_hello()

"""
sortie:
# Avant l'appel de la fonction
Hello!
# Après l'appel de la fonction
"""
```

### Décorateur avec argument 

```python 
def repeat(num_times):
    def decorator_repeat(func):
        def wrapper(*args, **kwargs):
            for _ in range(num_times):
                func(*args, **kwargs)

        return wrapper

    return decorator_repeat

@repeat(num_times=3)
def say_hello(name):
    print(f"Hello, {name}!")

say_hello("Alice")

"""sortie
Hello, Alice!
Hello, Alice!
Hello, Alice!
"""
```

### Décorateur de méthodes de classe 

```python 
def log_method_call(func):
    def wrapper(self, *args, **kwargs):
        print(f"Appel de la méthode {func.__name__}")
        return func(self, *args, **kwargs)

    return wrapper

class MyClass:
    @log_method_call
    def say_hello(self):
        print("Hello from MyClass!")

obj = MyClass()
obj.say_hello()
```

### Décorateur multiple 

Appliquer dans l'ordre de đéclaration

```python 
def decorator1(func):
    def wrapper():
        print("Décorateur 1")
        func()

    return wrapper

def decorator2(func):
    def wrapper():
        print("Décorateur 2")
        func()

    return wrapper

@decorator1
@decorator2
def say_hello():
    print("Hello!")

say_hello()
```

### Décorateur intégré

#### `@staticmethod` - créer une méthode statique 

Le décorateur est utilisé pour créer une méthode statique qui ne nécessite pas d'instance de classe 

```python 
class MyClass:
    @staticmethod
    def static_method():
        print("Ceci est une méthode statique.")

MyClass.static_method()
```

#### `@classmethod` - classe qui accepte la classe 

Le décorateur est utilisé pour créer une méthode qui accepte la classe (et non une instance) en tant que premier argument 

```python 
class MyClass:
    @classmethod
    def class_method(cls):
        print(f"Ceci est une méthode de classe {cls.__name__}.")

MyClass.class_method()
```

#### `@property` - création de getters, setters, deleters

Permet de créer des getters, setters, et deleters pour les attributs

```python 
class MyClass:
    def __init__(self, value):
        self.hidden_value = value

    @property
    def value(self):
        return self.hidden_value

    @value.setter
    def value(self, new_value):
        self.hidden_value = new_value

obj = MyClass(10)
print(obj.value)  # Sortie : 10
obj.value = 20
print(obj.value)  # Sortie : 20
```

### Pattern d'utilisation 

#### Journalisation 

Permet de log les appels de fonction et de méthodes 

```python 
def log_call(func):
    def wrapper(*args, **kwargs):
        print(f"Appel de la fonction {func.__name__} avec les arguments {args} et {kwargs}")
        return func(*args, **kwargs)

    return wrapper

@log_call
def add(x, y):
    return x + y

print(add(2, 3))
```

#### Contrôle d'accés

Permet de contrôler l'accès aux fonctions et méthodes

```python 
def require_authentication(func):
    def wrapper(*args, **kwargs):
        if not args[0].is_authenticated:
            raise PermissionError("Utilisateur non authentifié.")
        return func(*args, **kwargs)

    return wrapper

class User:
    def __init__(self, is_authenticated):
        self.is_authenticated = is_authenticated

    @require_authentication
    def view_profile(self):
        print("Profil utilisateur")

user = User(is_authenticated=True)
user.view_profile()  # Appel réussi

user2 = User(is_authenticated=False)
user2.view_profile()  # PermissionError: Utilisateur non authentifié.
```

#### Mise en cache 

Permet de mettre en cache des résultats d'une fonction 

```python 
def cache(func):
    cached_results = {}

    def wrapper(*args):
        if args in cached_results:
            return cached_results[args]
        result = func(*args)
        cached_results[args] = result
        return result

    return wrapper

@cache
def fib(n):
    if n < 2:
        return n
    return fib(n - 1) + fib(n - 2)

print(fib(35))
```

---

## 17 - POO

### Création de classes et objets

```python 
# ====================
# syntaxe de déclaration de classe 
# ==================================
class NomDeClasse:
    # déclaration des attributs
    variable1 = valeur1
    variableN = valeurN
    
    # déclaration des méthodes
    def fonction1(self):
        code de la fonction

    def fonctionM(self):
        code de la fonction

# instanciation de classe 
variableX = NomDeClasse()

# accès aux attributs
variableX.variable1 = 10

# accès au méthodes
variableX.fonctionM()
```

### Type de méthodes

#### Méthodes d'objet - `self`

Lors de la déclaration d'une méthode d'un objet, il faut transmettre le premier paramètre obligatoire `self`. Lors de l'appel de la méthodem ce paramètre reçoit la référence à l'objet.

```python 
class MyClass:

    def instance_method(self):
        print(type(self))  # <class 'MyClass'>


my_object = MyClass()
my_object.instance_method()
```

#### Méthode de classe - `cls`

Lors de la déclaration d'une méthode de classem il faut transmettre le paramètre obligatoire `cls`. Lors de l'appel de la méthode, ce paramètre reçoit la référence à la classe. Il faut également marquer la méthode  de classe avec le décorateur `@classMethod`

```python 
class MyClass:
    # méthode d'objet
    def instance_method(self):
        print(type(self))  # <class 'MyClass'>

    # méthode de classe
    @classmethod
    def class_method(cls):
        print(type(cls))  # <class 'type'>


my_object = MyClass()
# référence à l'objet
my_object.instance_method()
# référence à la classe
MyClass.class_method()
```

#### Méthode statique - `@staticmethod` 

Lors de la déclaration d'une méthode statiquem il n'y a rien à transmettre, mais elle ne peut pas accèder aux données interne de la classe. La méthode doit être marquée avec le décorateur `@staticmethod`

```python 
class MyClass:
    def instance_method(self):
        print(type(self))  # <class 'MyClass'>

    @classmethod
    def class_method(cls):
        print(type(cls))  # <class 'type'>

    # méthode statique
    @staticmethod
    def static_method():
        return "Cette méthode ne dépend ni de l'instance ni de la classe"

my_object = MyClass()
my_object.instance_method()
MyClass.class_method()

# référence à l'objet
MyClass.static_method()
```

### Types de champs 

#### Champ de classe 

Déclarer dans la classe, avant la déclaration des méthodes de classe.

Pour lire ou écrire une valeur dans variable de classe, on utilise l'objet `cls`

```python 
class MyClass:
    attribute = "Je suis un attribut de classe"

    @classmethod
    def class_method(cls):
        print(MyClass.attribute)  # Je suis un attribut de classe

my_object = MyClass()

print(MyClass.attribute)  # Je suis un attribut de classe
```

#### Champ d'objet 

Les varaibles d'objet sont les champs de l'objet `self`. On y accède avec `self.name`.

```python 
class MyClass:
    attribute = "Je suis un attribut de classe"

    def set_name(self, name):
        self.name = name

    # self permet d'accèder au champs de l'instance
    def print_name(self):
        print(self.name)

my_object = MyClass()
my_object.set_name("Champ d'objet appelé name")
my_object.print_name()  # "Champ d'objet appelé name"
```

### Constructeur - `__init__`

Un constructeur est une méthode spéciale qui se déclenche lors de l'instanciation de l'objet. Il permet d'initialiser les champs de l'objet, et peut venir réaliser toutes les actions initiales nécessaire à la configuration de l'objet.

La méthode `__init__` prends au minimim un paramètre `self` qui fait référence à l'objet en cours de création. D'autres paramètres peuvent être ajouter.

```python 
# ====================
# utilisation de __init__
# =======================
class Cat:
    def __init__(self, name, age):
        self.name = name
        self.age = age


# Création d'un objet Cat avec un nom et un âge
barsik = Cat("Barsik", 5)

print(f"Nom du chat : {barsik.name}, âge : {barsik.age}")  # Affiche: Nom du chat : Barsik, âge : 5

# ================================
# initialisation avec validation de donnée
# ==================================
class Cat:
    def __init__(self, name, age):
        if age < 0: raise ValueError("L'âge ne peut pas être négatif")
        self.name = name
        self.age = age


# Création d'un objet Cat avec vérification de l'âge
try:
    barsik = Cat("Barsik", -3)
except ValueError as e:
    print(e)  # Affiche: L'âge ne peut pas être négatif
```

### Niveaux d'accès

En Python, il existe différents niveaux d'accès aux attributs et méthodes de classes.

- `_`: itilisé pour les attributs et méthodes ne devant pas être utilisée en dehors de la classe ou du module.
- `__`: utilisés pour les attributs et méthodes devant être privés et protégé contre un accès accidentiel ou intentionnel depuis l'extérieur. 

#### Accés public 

Les attributs et méthodes publiques sont accessible de n'importe où dans le code. Par défaut, tous les attributs et méthodes sont publics si leurs nom ne commence pas par un soulignement.

```python 
class MyClass:
    def __init__(self):
        self.public_attribute = "I am public"

    def public_method(self):
        return "This is a public method"


obj = MyClass()
print(obj.public_attribute)  # Disponible
print(obj.public_method())  # Disponible
```

#### Champs et méthodes protégés - `protected` 

Les champs et méthodes sont protégé par un souligmenent `_` devant leur nom, et sont destiné à une utilisation interne dans la classe et sous classe. C'est une convention qui indique au dev que les données ne sont pas destinées à être utilisées en dehors de la classe.

```python 
class MyClass:
    def __init__(self):
        self._protected_attribute = "I am protected"

    # soulignement indique une méthode protected
    def _protected_method(self):
        return "This is a protected method"


obj = MyClass()
print(obj._protected_attribute)  # Disponible, mais déconseillé
print(obj._protected_method())  # Disponible, mais déconseillé
```

#### Champs et méthodes privés - `private`

Les attributs et méthodes private sont désignés par deux soulignements `__` devant le nom. Ces attributs et méthodes sont destiné à une utiliser interne de la classe. Permettent de cacher l'implémentation interne et protégée les données contre des modifications de l'extérieur.

```python
class MyClass:
    def __init__(self):
        # soulignement double indique un attiribut private 
        self.__private_attribute = "I am private"

    def __private_method(self):
        return "This is a private method"

    def access_private_method(self):
        return self.__private_method()


obj = MyClass()
# print(obj.__private_attribute)  # Erreur, inaccessible directement
# print(obj.__private_method())  # Erreur, inaccessible directement
print(obj.access_private_method())  # Accessible via la méthode publique de la classe

# ==================================================
# accès direct 
# ==================================================
class MyClass:
    def __init__(self):
        self.__private_attribute = "I am private"

obj = MyClass()
print(obj._MyClass__private_attribute)  # Affiche : I am private

# ==================================================
# affichage des noms déformés
# ==================================================
class MyClass:
    def __init__(self):
        self.__private_attribute = "I am private"

obj = MyClass()
print(dir(obj))  # Affiche tous les attributs et méthodes de l'objet, y compris les noms "déformés"
```

### `__str__` 

Cette méthode est appelée automatiquement lorsque l'on essaie de convertir un objet en chaîne avec `print()` et `str()`

```python 
class Cat:
    def __init__(self, name, age):
        self.name = name
        self.age = age

    def __str__(self):
        return f"{self.name} is {self.age} years old"


cat = Cat("Barsik", 5)
print(cat)  # Affiche : Barsik is 5 years old
```

### `__len__`

Cette méthode est appeler automatiquement lorsque l'on souhaite obtenir la longueur d'un objet avec `len()`

```python 
class MyList:
    def __init__(self, items):
        self.items = items

    def __len__(self):
        return len(self.items)


my_list = MyList([1, 2, 3])
print(len(my_list))  # Affiche : 3
```

### Héritage 

L'héritage permet à une classe d'hériter des champs et méthodes d'une autre classe. On peut venir utiliser une classe parent qui contient des méthodes également utiliser dans une classe enfant, et ajouter de nouvelle méthodes et attributs spécifique à la classe enfant.

Lors de la déclaration de la classe enfant, on vient passer en argument la classe parent.

```python 
# ==================================
# héritage simple 
# ==================================
# définition d'une classe parent 
class Animal:
    def __init__(self, name):
        self.name = name

# défintion des clase enfants
class Dog(Animal):
    def speak(self):
        return f"{self.name} dit Woof!"

class Cat(Animal):
    def speak(self):
        return f"{self.name} dit Meow!"

dog = Dog("Buddy")
cat = Cat("Whiskers")

print(dog.speak())  # Affiche: Buddy dit Woof!
print(cat.speak())  # Affiche: Whiskers dit Meow!
```

#### Hiérarchie d'héritage 

```python 
# classe de base parent abstraite
class Animal:
    def __init__(self, name):
        self.name = name

    # lance une erreur lorsque cette méthode n'est pas implémenter par une classe enfant
    def speak(self):
        raise NotImplementedError("Subclass must implement abstract method")

# défintion des classes intermédiaire qui correspondent au catérgorie d'animaux 
class Mammal(Animal):
    def __init__(self, name, fur_color):
        super().__init__(name)  # Appel du constructeur de la classe parente
        self.fur_color = fur_color


class Bird(Animal):
    def __init__(self, name, wing_span):
        super().__init__(name)  # Appel du constructeur de la classe parente
        self.wing_span = wing_span

    def fly(self):
        return f"{self.name} vole avec une envergure de {self.wing_span} mètres."

# définition des classes enfant qui hérite de la classe Animal et de leur espèce spécifique 
# dans chacune d'elle ont implémente la méthode absatraite speak()
class Dog(Mammal):
    def speak(self):
        return f"{self.name} dit Woof!"


class Cat(Mammal):
    def speak(self):
        return f"{self.name} dit Meow!"

class Parrot(Bird):
    def speak(self):
        return f"{self.name} dit Squawk!"

# utilisation 
animals = [Dog("Buddy", "brown"), Cat("Whiskers", "white"), Parrot("Polly", 0.5)]

for animal in animals:
    print(animal.speak())

print(f"{dog.name} a un pelage {dog.fur_color}.")  # Affiche: Buddy a un pelage marron.
print(f"{cat.name} a un pelage {cat.fur_color}.")  # Affiche: Whiskers a un pelage blanc.
print(parrot.fly())  # Affiche: Polly vole avec une envergure de 0.5 mètres.
```

### `super()` - appel du parent 

La méthode `super()` permet d'appeler des méthodes de la classe parent depuis l'intérieur d'une classe enfant. 

#### Appel du constructeur du parent 

Le constructeur parent doit être appelé explicitement. Il est souvent nécessaire de leur passer des arguments spécifique.

```python 
class Animal:
    # le constructeur parent possède deux paramètres
    def __init__(self, type, name):
        self.type = type
        self.name = name

# le constructeur de la classe enfant ne possède qu'un paramètre
class Dog(Animal):
    def __init__(self, name):
        # premier argument correspond au type 
        # deuxieme argument correspond au name de l'enfant
        super().__init__("Chien", name)  # Appel du constructeur de la classe de base

class Cat(Animal):
    def __init__(self, name):
        super().__init__("Chat", name)  # Appel du constructeur de la classe de base


# Création d'un objet Dog
dog = Dog("Buddy")
print(dog)
```

#### Appel de méthode du parent 

**Appel d'une méthode parent dans une méthode dérivée**

```python 
class Animal:
    def speak(self):
        return "Un son animal générique"


class Dog(Animal):
    def speak(self):
        parent_speech = super().speak()  # Appel de la méthode de la classe parente
        return f"{parent_speech} Et le chien aboie !"

dog = Dog()
print(dog.speak())  # Affichera : Un son animal générique Et le chien aboie !
```

**Appel d'une méthode parent pour vérifier un état**

```python 
class Animal:
    def check_health(self):
        return "L'animal est en bonne santé"


class Dog(Animal):
    def check_health(self):
        parent_check = super().check_health()  # Appel de la méthode de la classe parente
        return f"{parent_check}. Le chien a besoin d'une promenade !"

dog = Dog()
print(dog.check_health())  # Affichera : L'animal est en bonne santé. Le chien a besoin d'une promenade !
```

**Appel d'une méthode parent dans une méthode modifiant l'état**

```python
class BankAccount:
    def __init__(self, balance):
        self.balance = balance


    def withdraw(self, amount):
        if self.balance >= amount:
            self.balance -= amount
            return f"Retrait de {amount}. Nouveau solde : {self.balance}"
        return "Fonds insuffisants"


class SavingsAccount(BankAccount):
    def withdraw(self, amount):
        if amount > 1000:
            return "Limite de retrait dépassée"
        return super().withdraw(amount)  # Appel de la méthode de la classe parente


savings = SavingsAccount(1500)
print(savings.withdraw(500))  # Affichera : Retrait de 500. Nouveau solde : 1000
print(savings.withdraw(1500))  # Affichera : Limite de retrait dépassée
```

### Polymorphisme 

Le polymorphisme permet aux objets de différentes classes d'utiliser la même interface. On utilise la surchage de méthode et la substitution des méthodes de la classe de base par des méthodes de la classe dérivée.

Dans l'exemple, les trois classes ont une méthode du même nom `moove()`. Cela signifie que l'on peut écrire du code qui fonctionne avec ces trois objets.

Dans ce cas, l'interface commune est le nom de la méthode

```python 
class Car:
    def move(self):
        pass

class Human:
    def move(self):
        pass

class Bird:
    def move(self):
        print("Cui-cui!")

car = Car()
human = Human()
bird = Bird()

for it in [car, human, bird]:
    it.move()
```

#### Redéfinition de méthodes 

La classe parent définit une interface commune, et les sous classes implémentent des détails spécifique. 

Dans cet exemple, les classes ne sont pas obligées d'avoir la méthode `get_salary()` car elle n'existe pas toujours dans la classe parent. L'interface commune de toutes les classes n'est plus la méthode `get_salary()` mais la classe `Employee` avec toutes ses méthodes et attributs.

```python 
class Employee:
    # méthode de base
    def get_salary(self):
        return 1000

class FullTimeEmployee(Employee):
    # redéfinition de méthode
    def get_salary(self):
        return 5000

class PartTimeEmployee(Employee):
    def get_salary(self):
        return 3000

class Intern(Employee):
    pass

def print_salary(employee):
    print(employee.get_salary())

employees = [FullTimeEmployee(), PartTimeEmployee(), Intern()]

for employee in employees:
    print_salary(employee)
```

#### Appel de méthodes de classe dérivée

```python 
class Employee:
    def print_salary(self):
        salary = self.get_salary()
        print(salary)

    def get_salary(self):
        return 1000

class FullTimeEmployee(Employee):
    # on peut tuiliser print_salary() -> c'est la méthode parent qui sera utiliser
    # print_salary() appelle alors get_salary de l'objet self - FullTimeEmployee
    def get_salary(self):
        return 5000

class PartTimeEmployee(Employee):
    def get_salary(self):
        return 3000

    # retourne le salaire en pourcentage du taux de base
    def get_pourcent_salaire_base(self):
        base_salary - super().get_salary() # appel du champ de la class parent
        return base_salary * 5 

class Intern(Employee):
    pass

employees = [FullTimeEmployee(), PartTimeEmployee(), Intern()]

for employee in employees:
    employee.print_salary()
```

#### Surcharge de méthode 

Capacitée de créer plusieurs méthodes avec le même nom mais avec des paramètres différents. On utilise `*args` et `**kwargs` 

```python 
# ============================
# exemple surcharge de méthode en fonction du nombre d'argument
# ============================
class Example:
    def display(self, a=None, b=None):
        if a is not None and b is not None: print(a, b)
        elif a is not None: print(a)
        else: print("Pas d'arguments")


obj = Example()
obj.display(1, 2)  # Output: 1 2
obj.display(1)  # Output: 1
obj.display()  # Output: Pas d'arguments

# =======================================
# surchage en fonction du type 
# =======================================
class Example:
    def mod(self, a, b):
        if type(a) == int and type(b) == int: print(a % b)
        elif type(a) == float or type(b) == float: print(round(a / b))
        else: print("Instruction d'aide : a et b doivent être int ou float")


obj = Example()
obj.mod(5, 2)  # Output: 1
obj.mod(5.0, 2)  # Output: 2
obj.mod("5", 2)  # Output: Instruction d'aide : a et b doivent être int ou float
```

### Vérification des types 

Python fournit des fonctions pour vérifier les types et les classes d'objets.

#### `type()`

Retourne le type d'un objet. Elle permet également de créer de nouvelle classe.

```python 
# ===============================
# vérification de type 
# ===============================
x = 10
print(type(x))  # Output: <class 'int'>
```

Lorsqu'on vient lui passer trois argument, elle vient créer un nouveau type (classe):
- `name`: nom de la classe créer 
- `bases`: tuple de classes de base dont la nouvelle classe hérite
- `dict`: dictionnaire contenant les attributs et méthodes de la nouvelle classe

```python
# ================================
# syntaxe
# ================================
type(name, bases, dict)

# ================================
# création d'une classe simple 
# ================================
MyClass = type('MyClass', (), {'say_hello': lambda self: print("Hello!")})

instance = MyClass()
instance.say_hello()  # Output: Hello!

# =================================
# création d'une classe complexe
# =================================
MyClass = type('MyClass', (), {
    'attribute': 42,
    '__init__': lambda self, value: setattr(self, 'value', value),
    'display_value': lambda self: print(self.value)
})

# Créons une instance de la classe
instance = MyClass(10)
print(instance.attribute)  # Output: 42
instance.display_value()  # Output: 10
```

#### `isinstance()`

Permet de vérifier si un objet appartient à une classe spécifique ou à un tuple de classes. Elle retourne `True` si l'objet est une instance de la classe spécifiée ou de n'importe laquelle des classes spécifiée dans le tuple.

Fonctionne avec l'héritage.

- `object`: objet à vérifier 
- `classinfo`: classe, type ou tuple de classe et de types auxquels l'objet sera comparé

```python
# ===============================
# syntaxe
# ===============================
isinstance(object, classinfo)

# ================================
# vérification appartenance à une seule classe 
# ================================
x = 10
print(isinstance(x, int))  # Output: True

y = "Hello"
print(isinstance(y, str))  # Output: True

# =================================
# vérification d'appartenance à plusieurs classes 
# ==================================
x = 10
print(isinstance(x, (int, float)))  # Output: True

y = "Hello"
print(isinstance(y, (int, str)))  # Output: True

z = 3.14
print(isinstance(z, (int, str)))  # Output: False

# ========================================
# vérification d'appartenance à des classes personnalisées
# ==========================================
class Animal:
    pass

class Dog(Animal):
    pass

dog = Dog()

print(isinstance(dog, Dog))  # Output: True
print(isinstance(dog, Animal))  # Output: True
```

#### `issubclass()`

Permet de vérifier si une classe est une classe enfant d'une autre classe. Retourne `True` ou `False`

```python 
# ===================================
# vérification appartenance à une seule classe 
# =====================================
class Animal:
    pass

class Dog(Animal):
    pass

print(issubclass(Dog, Animal))  # Output: True
print(issubclass(Animal, Dog))  # Output: False 

# =============================================
# vérification appartenance à plusieurs classes
# =============================================
class Animal:
    pass

class Dog(Animal):
    pass

class Cat(Animal):
    pass

print(issubclass(Dog, (Animal, Cat)))  # Output: True
print(issubclass(Dog, (Cat,)))  # Output: False

# =============================================
# classe personnalisée
# =============================================
class MyInt(int):
    pass

print(issubclass(MyInt, int))  # Output: True
print(issubclass(int, MyInt))  # Output: False

# ==============================================
# hiérarchie d'héritage
# ==============================================
class A:
    pass

class B(A):
    pass

class C(B):
    pass

print(issubclass(C, A))  # Output: True
print(issubclass(C, B))  # Output: True
print(issubclass(B, A))  # Output: True
print(issubclass(A, C))  # Output: False
```

### Héritage multiple 

Une classe peut hériter de plus d'une classe parente. Les classes parents sont énumérer dans les parenthèses lors de l'implémentation de la classe enfant.

```python
# =========================================
# héritage multiple 
# =========================================
class Base1:
    def method1(self):
        print("Method1 from Base1")

class Base2:
    def method2(self):
        print("Method2 from Base2")

class Derived(Base1, Base2):
    pass

obj = Derived()
obj.method1()
obj.method2()

# ========================================================
# appel de méthode dans plusieurs classe parent
# ========================================================
class Base1:
    def method(self):
        print("Method from Base1")

class Base2:
    def method(self):
        print("Method from Base2")

class Derived(Base1, Base2):
    pass


obj = Derived()
obj.method() # appel de la méthode la premiere classe parent -> Base1 car passer en première

# ============================================================
# utilisation de super()
# ============================================================
class Base1:
    def method(self):
        print("Method from Base1")
        super().method()

class Base2:
    def method(self):
        print("Method from Base2")
        super().method()

class Derived(Base1, Base2):
    def method(self):
        print("Method from Derived")
        super().method()


obj = Derived()
obj.method()

""" sortie
Method from Derived
Method from Base1
Method from Base2
"""
```

### Method Resolution Order (MRO)

Le MRO détermine la séquence dans laquelle Python recherche les méthodes et attributs dans la hiérarchie des classes. 

L'algo détermine le MRO en comnbinant la classe, la liste des classes parent dans l'ordre et le MRO des classes parent.

#### `__mro__` et `mro()`

Permet de vérifier l'ordre de recherche des méthodes et attributs d'une classe.

```python 
class A:
    def method(self):
        print("A")

class B(A):
    def method(self):
        print("B")

class C(A):
    def method(self):
        print("C")

class D(B, C):
    def method(self):
        print("D")


# Vérification du MRO
print(D.__mro__)

"""sortie
(<class '__main__.D'>,
<class '__main__.B'>,
<class '__main__.C'>,
<class '__main__.A'>,
<class 'object'>)"""
```

--- 

## 18 - Erreurs et exceptions 

Les erreurs et exceptions sont une partie intégrante d'un programme. Elles surviennent lorsque le programme rencontre des situations imprévue qu'il ne peut pas gérer. En Python, il existe un système de gestion des exceptions qui permet de capturer et gérer les erreurs, empêchant le programme de se terminer.

Les exceptions surviennent le plus souvent dans ces situations :

- **Erreurs de syntaxe**
Détecté lors de la compilation du code. 

- **Erreur d'exécution**
Surviennent pendant l'exécution du programme et pouvant être causé par différentes raison comme la division par zéro, accès à une index de liste inexistant, etc 

- **Erreur logique**
Lorsque le programme retourne des résultats incorrect en raison d'une erreur de logique.

### Chemin des exceptions 

Lorsque Python rencontre une erreur, celle ci se propage à travers la pile des appels, jusqu'a ce qu'elle soit gérée. La pile des appels est une séquence d'appel de fonctions qui ont conduit à l'apparition de l'exception.

1. **Apparition d'une exception**: Lorsqu'une erreur se produit, Python crée un objet d'exception
2. **Recherche du gestionnaire d'exception**: L'interpréteur commence à recherche un gestionnaire d'exception dans le bloc de code. Si un gestionnaire n'est pas trouvé, il passe au bloc suivant qui a appelé la fonction actuelle.
3. **Propagation de l'exception dans la pile**: Ce processus se répète jusqu'a ce qu'un gestionnqire soit trouvé ou jusqu'a ce que la pile des appels soit épuisée.
4. **Fin du programme**: Si un gestionnaire n'est pas trouvé, le programme se termine et affiche le message d'erreur.

### Exceptions populaire 

| Exception | Description |
| --------- | ----------- |
| `Exception` | Classe de base pour toutes les exceptions |
| `IndexError` | Accés à un indice inexistant dans une séquence |
| `KeyError` | Accés à une clé inexistante dans un dictionnaire | 
| `NameError` | Accés à une variable inexistante |
| `RuntimeError` | Erreur générale d'exécution |
| `StopIteration` | Signale la fin de l'itération |
| `SyntaxError` | Erreur de syntaxe |
| `IndentationError` | Erreur d'indentation |
| `TabError` | Mélange de tab et d'espaces pour les indentation |
| `TypeError` | Tentative d'opération avec des donnée non compatible |
| `UnboundLocalError` | Accès à une varaible local avant sa déclaration |
| `ValueError` | Transmission d'un argument avec une valeur incorrecte à une fonction ou une opération |
| `ZeroDivisionError`| Division par zéro |

### Gestion des exceptions 

Les exceptions sont des objets spéciaux avec lesquels le programme peut travailler.

#### `try-except`

Le bloc `try-except` est utilisé pour capturer et gérer les exceptions. Le bloc `try` contient le code qui peut déclencher une exception, et le bloc `except` contient le code exécuté en cas d'exception.

```python 
# ===========================
# try-except
# ===========================
try:
    result = 10 / 0
except ZeroDivisionError:
    print("Erreur : division par zéro.")

# ================================
# gestion de plusieurs exceptions
# ================================
try:
    result = int("abc")
except ZeroDivisionError:
    print("Erreur : division par zéro.")
except ValueError:
    print("Erreur : valeur incorrecte.")

# ===================================
# capture de toutes les exceptions 
# ===================================
try:
    result = 10 / 0
except:
    print("Une erreur est survenue.")
```

#### `try-except-else` 

Le bloc `else` est utilisé pour exécuter du code si aucune exception n'a été levée dans le bloc `try`

```python 
# =============================
# try-except-else
# =============================
try:
    result = 10 / 2
except ZeroDivisionError:
    print("Erreur : division par zéro.")
else:
    print(f"Résultat : {result}")
```

#### `try-except-finally`

Le bloc `finally` contient du code qui sera exécuté qu'une exception ait été levée ou non. C'est utilise pour libérer des ressources ou effectuer des opérations de fermeture

```python 
# =====================================
# try-except-finally
# =====================================
try:
    result = 10 / 0
except ZeroDivisionError:
    print("Erreur : division par zéro.")
finally:
    print("Ce bloc s'exécute toujours.")

# ============================================
# exemple complet 
# ============================================
try:
    result = 10 / 2
except ZeroDivisionError:
    print("Erreur : division par zéro.")
else:
    print(f"Résultat : {result}")
finally:
    print("Ce bloc s'exécute toujours.")

# =====================================
# exemple d'utilisation avec lecture de fichier 
# ======================================
try:
    # tentative d'ouverture du ficheir
    file = open("non_existent_file.txt", "r")
    content = file.read()
except FileNotFoundError:
    # si le fichier n'est pas trouvé
    print("Erreur : fichier non trouvé.")
except IOError:
    # erreur de lecture
    print("Erreur : erreur d'entrée-sortie.")
else:
    # affiche le contenu si aucune exception
    print(content)
finally:
    # libération de la mémoire peut importe si exception ou non 
    if 'file' in locals() and not file.closed:
        file.close()
        print("Fichier fermé.")
```

### Gestion d'exception multiple 

Il existe plusieurs approche pour gérer des exceptions multiples.

#### `expect`

```python 
# ========================
# bloc multiple
# ========================
try:
    # Code qui peut provoquer une exception
    result = int("abc")
except ValueError:
    print("Erreur : valeur incorrecte.")
except ZeroDivisionError:
    print("Erreur : division par zéro.")

# ==============================
# tuple d'exception 
# ==============================
try:
    # Code qui peut provoquer une exception
    result = int("abc")
except (ValueError, ZeroDivisionError) as e:
    print(f"Une erreur est survenue : {e}")
```

#### `<ExceptionType>`

Il est possible d'utiliser la syntaxe `except <ExceptionType> as <variable>` pour obtenir l'objet exceptionnel. Cela permet d'obtenir plusieurs informations sur l'exception comme le message d'erreur 

```python 
try:
    # Code qui peut provoquer NameError
    print(undeclared_variable)
except NameError as e:
    print(f"Une erreur est survenue : {e}")
    print(f"Type d'erreur : {type(e)}")
```

La variable dans laquelle l'exception est stockée `e` est disponible uniquement dans son propre bloc `except`. Pour l'utiliser en dehors, il faut la stocker dans une variable séparée.

```python 
exception = None
try:
    # Code qui peut provoquer une exception
    result = int("abc")
except ValueError as e:
    exception = e # stocke la variable d'erreur 
    print("Erreur : valeur incorrecte.")
except ZeroDivisionError as e:
    exception = e
    print("Erreur : division par zéro.")

print(exception)
```

La variable `exception` strocke la derniere exception survenue.

#### Contenue d'une erreur 

L'objet exception contient des informations sur l'erreur. Selon le type d'exceptionm l'objet peut contenir différents attributs.

- **args**: tuple contenant les arguments passées lors de la création de l'exception. Généralement c'est le message d'erreur 
- **message**: string contenant le message d'erreur 
- **__str__**: méthode qui retourne la représentation sous forme de string de l'exception. 

```python
try:
    # Code qui peut provoquer ValueError
    result = int("abc")
except ValueError as e:
    print(f"Une erreur est survenue : {e}")
    print(f"Arguments de l'erreur : {e.args}")
    print(f"Message d'erreur : {str(e)}")

# ========================
# exception multiple 
# ========================
try:
    # Code qui peut provoquer plusieurs types d'exceptions
    result = 10 / 0
except (ValueError, ZeroDivisionError) as e:
    print(f"Une erreur est survenue : {e}")
    print(f"Type d'erreur : {type(e)}")
    print(f"Arguments de l'erreur : {e.args}")
```

### Traceback 

Le Traceback est l'info qui montre la séquence d'appels de fonction ayant conduit à l'exception. Il fournit des fonctions permettant d'extraire, de formater et d'afficher les informations sur le traceback.

Pour travailler avec le traceback, il est necessaire de l'importer.

```python 
import traceback

def function_c():
    return 1 / 0  # Cela va provoquer ZeroDivisionError

def function_b():
    function_c()

def function_a():
    try:
        function_b()
    except ZeroDivisionError as e:
        print("Une exception est survenue :")
        traceback.print_exc()  # Imprime le traceback

function_a()

"""sortie
Une exception est survenue :
Traceback (most recent call last):
    File "example.py", line 12, in function_a
      function_b()
    File "example.py", line 8, in function_b
      function_c()
    File "example.py", line 4, in function_c
      return 1 / 0
ZeroDivisionError: division by zero
"""
```

#### `traceback.print_exc()`

Imprime le traceback de l'exception courante dans le flux d'erreur 

```python 
try:
    1 / 0
except ZeroDivisionError:
    traceback.print_exc()
```

#### `traceback.format_exc()`

Retourne une chaîne contenant le traceback formaté de l'exception courante 

```python 
try:
    1 / 0
except ZeroDivisionError:
    error_message = traceback.format_exc()
    print("Traceback reçu sous forme de chaîne :")
    print(error_message)
```

#### `traceback.extract_tb(tb)`

Extrait les informations brutes sur le traceback de l'objet traceback.

#### `traceback.format_tn(tb)`

Retourne une liste formaté de chaîne représentant le traceback 

```python 
import sys
import traceback

def function_c():
    return 1 / 0  # Cela va provoquer ZeroDivisionError

def function_b():
    function_c()

def function_a():
    try:
        function_b()
    except ZeroDivisionError:
        tb = sys.exc_info()[2]
        formatted_tb = traceback.format_tb(tb)
        print("Traceback formaté :")
        for line in formatted_tb:
            print(line, end="")

function_a()
```

#### `traceback.format_exception(exc_type, exc_value, exc_tb)`

Retourne une liste complète formatée de string représentant l'exception et le traceback 

```python 
import sys
import traceback

def function_c():
    return 1 / 0  # Cela va provoquer ZeroDivisionError

def function_b():
    function_c()

def function_a():
    try:
        function_b()
    except ZeroDivisionError as e:
        exc_type, exc_value, exc_tb = sys.exc_info()
        full_tb = traceback.format_exception(exc_type, exc_value, exc_tb)
        print("Traceback complet formaté :")
        for line in full_tb:
            print(line, end="")

function_a()
```

Il peut etre utile d'examiner en detail chaque frame pour obtenir des informations spécifique sur l'endroit ou l'exceptioon s'est produite et sur le contexte de cet endroit 

```python 
import traceback
import sys

def function_c():
    return 1 / 0  # Cela va provoquer ZeroDivisionError

def function_b():
    function_c()

def function_a():
    try:
        function_b()
    except ZeroDivisionError:
        tb = sys.exc_info()[2]
        for frame in traceback.extract_tb(tb):
            print(f"Fichier : {frame.filename}")
            print(f"Ligne : {frame.lineno}")
            print(f"Nom de la fonction : {frame.name}")
            print(f"Texte : {frame.line}")
            print("-" * 40)

function_a()
```

#### Journalisation 

Il est parfois important de conserver l'information du traceback dans une fichier log pour analyse. 

```python 
import logging
import traceback
import sys

logging.basicConfig(filename='error.log', level=logging.ERROR)

def function_c():
    return 1 / 0  # Cela va provoquer ZeroDivisionError

def function_b():
    function_c()

def function_a():
    try:
        function_b()
    except ZeroDivisionError as e:
        exc_type, exc_value, exc_tb = sys.exc_info()
        full_tb = traceback.format_exception(exc_type, exc_value, exc_tb)
        logging.error("Une exception est survenue :\n%s", ''.join(full_tb))

function_a()
```

### Lancement d'exception 

L'instruction `raise` permet de lancer des exceptions. Cela permet de signaler une erreur ou une situation incorrect dans le programme.

```python 
# ==============================
# lancer une exception standard
# ==============================
def check_number(value):
    if value < 0:
        raise Exception("Désolé, pas de nombres en dessous de zéro")

try:
    check_number(-5)
except Exception as e:
    print(f"Exception capturée : {e}")
```

#### Remballage d'exception 

Il est parfois nécessaire de capture une exception, puis d'en lancer une autre en fournissant des informations plus spécifique. 

```python 
# =================================
# syntaxe
# =================================
raise nouvelle_exception from ancienne_exception 

# ==================================
# remballage d'exception 
# ==================================
class EmptyVariableError(Exception):
    pass

def check_non_empty(value):
    if value == "":
        raise ValueError("La variable est vide")

try:
    check_non_empty("")
except ValueError as e:
    # remballage 
    raise EmptyVariableError("Variable vide détectée") from e
```

Dans l'exemple, si la variable est vide, une `ValueError` est lancé avec un message. Cette exception est ensuite capturée, et une nouvelle exception `EmptyVarialeError` est lancée avec le mnessage "Variable vide détecté", tout en transmettant l'exception d'origine avec `from`

### Exception personnalisée

Créer une exception personnalisée implique de définir une nouvelle classe qui hérite de la class `Exception`. Il est possible d'ajouter ces propres méthodes et attributs à la classe d'exception pour fournir des informations supplémentaire sur l'erreur.

```python
# =========================
# 1. Définition d'une exception perso 
# =======================
class MyCustomError(Exception):
    """Classe pour une exception personnalisée."""
    pass

# ===================================
# 2. Utilisation de l'excption 
# ===================================
def check_value(value):
    if value < 0:
        # lance l'exception perso 
        raise MyCustomError("La valeur ne doit pas être inférieure à zéro")

try:
    check_value(-1)
except MyCustomError as e:
    print(f"Une exception personnalisée s'est produite : {e}")
```

**Ajout d'attribut**

Il est possible d'ajouter des attributs et méthodes supplémentaire sur la nouvelle classe 

```python 
# ===============================
# définition de la nouvelle exception 
# ===============================
class NegativeValueError( Exception ):
    """Classe pour une exception personnalisée lors d'une valeur négative."""
    def __init__(self, value, message = "La valeur ne doit pas être inférieure à zéro"):
        self.value = value
        self.message = message
        super().__init__(self.message)

    def __str__(self):
        return f'{self.message}: {self.value}'

# ============================================
# utilisation 
# ============================================
def check_value(value):
    if value < 0:
        raise NegativeValueError(value)

try:
    check_value(-1)
except NegativeValueError as e:
    print(f"Une exception personnalisée s'est produite : {e}")
```

**Création d'une hérarchie d'exceptions**

Pour des cas plus complexe, il est possible de créer des hiérarchies d'exceptions personnalisées. Cela permet de regrouper des exceptions connexes et de simplifier leur gestion.

Pour l'utilisation des exception, il faut utiliser l'ordre inverse de l'héritage. L'exception la plus globale capture toutes les descendantes. Du plus spécifique au moins large.

```python 
# ============================================
# implèmentation de la hiérarchie 
# ============================================
class ApplicationError(Exception):
    """Classe de base pour toutes les exceptions de l'application."""
    pass

class NegativeValueError(ApplicationError):
    """Classe pour une exception personnalisée lors d'une valeur négative."""
    def __init__(self, value, message="La valeur ne doit pas être inférieure à zéro"):
        self.value = value
        self.message = message
        super().__init__(self.message)

    def __str__(self):
        return f'{self.message}: {self.value}'

class ValueTooLargeError(ApplicationError):
    """Classe pour une exception personnalisée lors d'une valeur trop élevée."""
    def __init__(self, value, message="La valeur est trop élevée"):
        self.value = value
        self.message = message
        super().__init__(self.message)

    def __str__(self):
        return f'{self.message}: {self.value}'


# =================================================
# utilisation 
# =================================================
def check_value(value):
    if value < 0:
        raise NegativeValueError(value)
    elif value > 100:
        raise ValueTooLargeError(value)

try:
    check_value(150)
except NegativeValueError as e:
    print(f"Une exception s'est produite : {e}")
except ValueTooLargeError as e:
    print(f"Une exception s'est produite : {e}")
except ApplicationError as e:
    print(f"Exception générale de l'application : {e}")
```

### `logging` 

Python fournit un lib `logging` qui permet de suivre l'exécution du programme. 

```python 
import logging

# Configuration de la journalisation pour afficher les informations de débogage
logging.basicConfig(level=logging.DEBUG)


def divide(a, b):
    # Journaliser la tentative de division
    logging.debug(f"Division de {a} par {b}")
    if b == 0:
        # Journaliser l'erreur si b est égal à 0
        logging.error("Tentative de division par zéro!")
        return None

    # Effectuer la division si b n'est pas égal à 0
    return a / b

result = divide(10, 2)
print(result)
```

---

## 19 - Modules et packages

### Module 

Un module est un fichier avec l'extension `.py` qui contient du code. Les modules permettent de décomposer le code en partie plus petite. Chaque module pouvant contenir des classes, des fonctions et des variables, et peut également exécuter du code lors de son importation.

```python 
# =======================
# module simple 
# =======================
# mymodule.py

def greet(name):
    return f"Hello, {name}!"

pi = 3.14159
```

Le module peut ensuite être importé et utilisé dans un autre fichier.

#### Importation de module 

Python utilise une recherche dans cet ordre:
1. **Répertoire courant**: recherche le module dans le repertoire courant d'ou le script à été lancé
2. **Variable env `PYTHONPATH`**: il vient ensuite le recherché dans les repertoire indiqué dans la variable env
3. **Répertoire standard**: il recherche ensuite dans les repertoire standard 

**Importation du module complet**

Cette syntaxe importe l'ensemble du module, et rends disponible les fonctions et variable de celui ci.

```python 
# ===========================
# syntaxe 
# ===========================
import module

print(module.greet("Alice"))  # Sortie : Hello, Alice!
print(module.pi)  # Sortie : 3.14159
```

**Importation d'éléments du module**

Il est possible de définir quels éléments doit être importé d'un module.

```python 
# ================================
# syntaxe 
# ================================
from module import func, var

# ================================
# import du module 
# ================================
from mymodule import greet, pi

print(greet("Bob"))  # Sortie : Hello, Bob!
print(pi)  # Sortie : 3.14159
```

**Import du module avec un alias**

Permet d'importer un module et de lui attribuer un nom.

```python 
# ===============================
# import avec alias 
# ===============================
import mymodule as mm

print(mm.greet("Charlie"))  # Sortie : Hello, Charlie!
print(mm.pi)  # Sortie : 3.14159
```

**Importer tous les éléments du module**

Permet d'importer tous les éléments du module. Cependant cette syntaxe n'est pas recommandé car cela peut causer des conflits de noms et rendre le code plus difficile à lire

```python 
from mymodule import *

print(greet("Dave"))  # Sortie : Hello, Dave!
print(pi)  # Sortie : 3.14159
```

#### Importation locale et globale

Les modules peuvent être importés au niveau global (en début de fichier) ou au niveau local (dans une fonction ou méthode).

**Importation globale**

```python 
# =======================
# importation globale 
# =======================
import math

def calculate_circle_area(radius):
    return math.pi * radius ** 2
```

**Importation locale**

Réalisé depuis l'intérieur d'une fonction ou d'une méthode et rend le module importé accessbiel uniquement dans la fonction 

```python
# ===========================
# importation locale 
# ===========================
def calculate_square_root(x):
    import math
    return math.sqrt(x)

print(calculate_square_root(16))
```

#### Importation dynamique 

Permet d'importer des modules pendans l'exécution du programme. 

```python 
# ======================
# syntaxe 
# ======================
module = __import__("module")

# =========================
# exemple 
# =========================
module_name = "math"
module = __import__(module_name)
print(module.sqrt(16))  # Sortie : 4.0
```

#### `getattr`

Cette fonction permet d'accéder dynamiquement aux attrbuts d'un module (ou objet). Permet de connaitre les attributs présent dans un module 

```python 
# ==========================
# syntaxe 
# ==========================
getattr(object, name, default = None)

# ===============================
# utilisation 
# ===============================
import math

# Obtenir l'attribut sqrt du module math
sqrt_function = getattr(math, 'sqrt')

print(sqrt_function(25))  # Sortie : 5.0

# Essayer d'obtenir un attribut inexistant, retourner la valeur par défaut
non_existent_attr = getattr(math, 'non_existent', 'default_value')

print(non_existent_attr)  # Sortie : default_value
```

### Package 

Un package est un repertoire contenant un fichier `__init__.py` et un ou plusieurs modules. Le fichier peut être vide ou contenir du code d'initialisation du package.

`__init__.py` est nécessaire dans un repertoire pour que Python considère ce repertoire comme un package.
Dans ce fichier, on place les imports de fonction pour qu'elle soit disponible au niveau du package.

```python
# =========================
# exemple de structure 
# =========================
mypackage/ # nom du repertoire du package
    __init__.py
    module1.py
    module2.py

# ===========================
# contenu de __init__.py
# ===========================
# __init__.py
# ce code permet d'importer les fonctions des modules au niveau du package
from .module1 import func1
from .module2 import func2

# ===========================
# contenu module1.py
# ===========================
# module1.py
def func1():
    return "Function 1"

# ============================
# contenu module2.py
# ============================
# module2.py
def func2():
    return "Function 2"
    
# ============================
# code utilisant les fonctions du package 
# =============================
import mypackage

print(mypackage.func1())  # Affichage: Function 1
print(mypackage.func2())  # Affichage: Function 2
```

#### `dir()`

Cette fonction permet de lister les attributs et méthodes disponible dans le module.

```python 
# ========================
# exploration module math
# ==========================
import math

print(dir(math))

"""sortie
['__doc__', '__loader__', '__name__', '__package__', '__spec__', 'acos', 'acosh', 'asin', 'asinh', 'atan',
'atan2', 'atanh', 'ceil', 'comb', 'copysign', 'cos', 'cosh', 'degrees', 'dist', 'e', 'erf', 'erfc', 'exp', 'expm1',
'fabs', 'factorial', 'floor', 'fmod', 'frexp', 'fsum', 'gamma', 'gcd', 'hypot', 'inf', 'isclose', 'isfinite', 'isinf',
'isnan', 'isqrt', 'ldexp', 'lgamma', 'log', 'log10', 'log1p', 'log2', 'modf', 'nan', 'perm', 'pi', 'pow', 'prod',
'radians', 'remainder', 'sin', 'sinh', 'sqrt', 'tan', 'tanh', 'tau', 'trunc']"""
```

### Gestionnaire de paquets 

Les gestionnaires de paquets sont des outils permettant de gérer les dépendances et les paquets dans les projets. Il existe 4 gestionnaires de paquets populaire en Python:
- `pip`
- `conda`
- `pipenv`
- `poetry` 

A partir de Python3, `pip` est installé par defaut.

#### `pip`

```shell
# ======================
# version installé
# ======================
pip --version 

# ========================
# installation 
# ========================
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python get-pip.py

# =========================
# installation de paquet 
# =========================
pip install package_name

# =========================
# installation d'une version spécifique 
# ==========================
pip install package_name==1.0.0

# ===============================
# mise à jour d'un paquet 
# ===============================
pip install --upgrade package_name

# =================================
# suppression d'un paquet 
# =================================
pip uninstall package_name

# =================================
# listing des paquets installé
# =================================
pip list
```

#### `conda`

`conda` est un gestionnaire de paquets et un systeme de gestion d'environnements utilisé pour installer et gérer des paquets pour Python ou d'autre language. Il permet de gérer les dépendances et de créer des environnement isolée

```shell
# ===========================
# creation d'un environnement 
# =============================
conda create --name myenv

# ===============================
# activation de l'environnement 
# ===============================
conda activate myenv

# ================================
# désactivation de l'environnement 
# ================================
conda deactivate

# ==================================
# installation d'un paquet 
# ==================================
conda install package_name

# ==================================
# installation depuis un canal spécifique 
# =========================================
conda install -c conda-forge package_name

# =========================================
# listing des paquets installés
# ========================================
conda list

# =========================================
# exemple de workflow
# =========================================
conda create --name myenv
conda activate myenv
conda install numpy
conda list
conda deactivate
```

### Installation de packages 

[pypi](https://pypi.org/) est le site permettant de trouver des packages.

---

## 20 - Iterators 

Les itérateurs sont des objets qui implémentent le protocole de l'itérateur, permettant de récupérer séquentiellement les éléments d'une collection. Ils sont utilisées pour parcourir les éléments d'une listes, d'un tuples et de chaîne.

### Objet itérable - `Iterable` 

Objet qui implémente la méthode `__iter__()`, qui retourne un objet itérateur 

### Objet itérateur - `Iterator` 

Objet spécial qui possède la fonction `__next__()` pour donner l'élément suivant de la séquence. Lorsque tous les éléments sont épuisés, la méthode `__next__()` déclence une exception `StopIteration` comme signal d'arrêt.

Il doit également implémenter la méthode `__iter__()` qui renvoie l'itérateur lui même.

```python 
# Objet itérable
numbers = [1, 2, 3, 4, 5]

# Obtenir un itérateur à partir de l'itérable
iterator = iter(numbers)

# Utiliser l'itérateur pour parcourir les éléments
try:
    while True:
        number = next(iterator)
        print(number)
except StopIteration:
    pass

# ========================
# équivalent à 
# ========================
# Objet itérable
numbers = [1, 2, 3, 4, 5]

for number in numbers:
    print(number)
```

### Définir un itérateur 

```python 
# reçoit une collection sur laquelle on itère
class MyIterable:
    def __init__(self, data):
        self.data = data

    def __iter__(self):
        return MyIterator(self.data)
# itérateur qui retourne les éléments
class MyIterator:
    def __init__(self, data):
        self.data = data
        self.index = 0

    def __iter__(self):
        return self

    def __next__(self):
        if self.index >= len(self.data):
            raise StopIteration
        item = self.data[self.index]
        self.index += 1
        return item

# Utilisation
my_iterable = MyIterable([1, 2, 3, 4])
for item in my_iterable:
    print(item)
```

---

## 21 - Surcharge d'opérateur 

Permet de définir le comportement des opérateurs intégrés pour les classes personnalisées. Cela se fait via des méthodes magiques.

Par exemple, dans la classe, il est possible de venir surcharger les opérateurs de comparaison : 

**Opérateur de comparaison:**

| Opérateur | Méthode sans underscore | Signature de la méthode |
| --------- | ----------------------- | ----------------------- |
| `==` | `eq()` | `__eq__(self, other)` |
| `!=` | `ne()` | `__ne__(self, other)` |
| `<` | `lt()` | `__lt___(self, other_` |
| `<=` | `le()` | `__le__(self, other)` |
| `>` | `gt()` | `__gt__(self, other)` | 
| `>=` | `ge()` | `__ge__(self, other)` |

**Opérateur arithmétique**
| Opérateur | Méthode sans underscore | Signature de la méthode |
| --------- | ----------------------- | ----------------------- |
| `+` | `add`  | `__add__(self, other)` |
| `-` | `sub` | `__sub__(self, other)` |
| `*` | `mul` | `__mul__(self, other)` |
| `/` | `truediv` | `__truediv__(self, other)` |
| `//` | `floordiv` | `_floordiv__(self, other)` |
| `%` | `mod` | `__mod__(self, other)` |
| `**` | `pow` | `__pow__self(self, other)` |

**Opérateur logique**
| Opérateur | Méthode sans underscore | Signature de la méthode |
| --------- | ----------------------- | ----------------------- |
| `&` | `and` | `__and__(self, other)` |
| `|` | `or` | `__or__(self, other)` |
| `^` | `xor` | `__xor__(self, other)` |
| `~` | `invert` | `__invert__(self)` |

**Opérateur d'indéxation et découpage**
| Opérateur | Méthode | 
| --------- | ----------------------- | 
| `obj[key]` | `__getitem__(self, key)` |  
| `obj[key] = value` | `__setitem__(self, key, value)` |  
| `del obj[key]` |`__delitem__(self, key)` |  


**Opérateur unaire**
| Opérateur | Méthode | 
| --------- | ----------------------- | 
| `-` | `__neg__(self)` |  
| `+` | `__pos__(self)` |  
| `abs()` | `__abs__(self)` |  
| `~` | `__invert__(self)` |  
| `` | `__` |  
| `` | `__` |  
| `` | `__` |  
| `` | `__` |  


**Opérateur d'affectation**
| Opérateur | Méthode | 
| --------- | ----------------------- | 
| `+=` | `__iadd__(self, other)` |  
| `-=` | `__isub__(self, other)` |  
| `*=` | `__imul__(self, other)` |  
| `/=` | `__itruediv__(self, other)` |  
| `//=` | `__ifloordiv__(self, other)` |  
| `%=` | `__imod__(self, other)` |  
| `**=` | `__ipow__(self, other)` |  

On as une classe et que l'on souhaite que les objets de la classe soient comparés comme souhaité. On implémente la méthode `__eq__` dans la classe et Python l'apellera chaque fois que les objets de cette classe seront comparé

```python 
class Vector:
    def __init__(self, x, y):
        self.x = x
        self.y = y

    def __eq__(self, other):
        return self.x == other.x and self.y == other.y

# Utilisation
v1 = Vector(2, 3)
v2 = Vector(2, 3)
v3 = Vector(4, 5)
print(v1 == v2)  # Affichera: True
print(v1 == v3)  # Affichera: False
```

A chaque fois que l'on compare deux objets, Python vérifie si la méthode `__eq__` est implémentée dans la classe. Si elle existe, elle sera utilisé pour la comparaison, sinon ce sont les références des objets qui seront comparée

**Classe avec opérateur d'indexaction**

```python 
class CustomList:
    def __init__(self, data):
        self.data = data

    def __getitem__(self, index):
        return self.data[index]

    def __setitem__(self, index, value):
        self.data[index] = value

    def __delitem__(self, index):
        del self.data[index]

    def __repr__(self):
        return repr(self.data)

# Utilisation
c_list = CustomList([1, 2, 3, 4, 5])
print(c_list[1])  # Affichera: 2
c_list[1] = 10
print(c_list)  # Affichera: [1, 10, 3, 4, 5]
del c_list[1]
print(c_list)  # Affichera: [1, 3, 4, 5]
```

--- 

## 22 - Lecture et écriture de fichier

### Ouverture de fichier 

```python 
# ========================
# lecture du contenu d'un fichier
# ========================
file = open('example.txt', 'r') # ouverture du fichier
content = file.read() # lecture du fichier 
print(content) # affichage 
file.close() # fermeture memoire

# =================================
# ecriture dans un fichier 
# =================================
file = open('example.txt', 'w')
file.write("Hello, World!") # le contenu est supprimé, et remplacer par la chaîne
file.close()

# ==================================
# ajout 
# ==================================
file = open('example.txt', 'a')
file.write("\nAppended text.") # ajout à la fin du fichier
file.close()
```

- `open()`: prends en premier argument le nom du fichier, puis le mode d'accès.

#### Mode d'accès 

- `r`: ouverture pour lecture. Le fichier doit exister
- `w`: ouverture pour écriture. Le contenu du fichier sera effacé et s'il n'existe pas, il sera crée 
- `a`: ouverture du fichier pour ajout. Les données sont ajouté à la fin du fichier. si le fichier n'existe pas, il sera crée 
- `r+`: ouverture du fichier pour lecture et écriture, le fichier doit exister 
- `w+`: ouverture pour lecture et écriture. Le contenu sera effacé. Si le fichier n'existe pas, il sera crée
- `a+`: ouverture pour lecture et ajoute. Les données sont ajoutées à la fin du fichier et si le fichier n'existe pas, il sera créer 

#### Fermeture du fichier 

Lorsque l'on vient ouvrir un fichier, l'os vérifie les droits d'accés au fichier et le marque comme utilisé par le programme. Pour travailler avec un fichier, une ressource spéciale est allouée - un handler.

Le nombre de handler par programme est limité. Par conséquent, après avoir terminé de travailler avec un fichier, il faut venir le fermer avec `close()`.

```python
file = open('example.txt', 'r')
# Exécution des opérations avec le fichier
file.close()
```

### Lecture de données depuis un fichier 

Python fournis plusieurs méthodes pour lire des fichiers texte.

#### `read()`

`read()` vient lire le contenu du fichier et le stocke dans une chaîne. 

```python 
# ======================
# read()
# ======================
file = open('example.txt', 'r')
content = file.read()
print(content)
file.close()
```

Si le fichier est trop volumineuxm il est possible de venir le lire morceau par morceau. Dans la méthode `read(n)`, on peut venir un argument pour le nombre de caractère à lire. Si le fichier contient moins de caractère que l'argument, alors la méthode lira le fichier jusqu'a la fin.

Cette approche ignore la division de fichier en lignes, et peut venir couper des lignes au milieu.

```python 
file = open('example.txt', 'r')
content = file.read(10)  # Lit les 10 premiers caractères
print(content)
file.close()
```

#### `readline()`

Cette méthode vient lire une ligne du fichier à la fois, et permet d'itérer sur les lignes lignes du fichier.

```python 
file = open('example.txt', 'r')
line = file.readline()
while line:
    print(line.strip())
    line = file.readline()
file.close()
```


#### `readlines()`

Permet de lire le contenu du fichier mais la retourne sous forme de liste de lignes. Chaque ligne du fichier sera une ligne distincte de la liste.

```python 
# ============================
# readlines()
# ============================
file = open('example.txt', 'r')
lines = file.readlines()
for line in lines:
    print(line.strip())  # strip() supprime les espaces et les caractères de nouvelle ligne inutiles
file.close()
```

#### `file` - itération par lignes du fichier 

L'objet `file` possède un itérateur intégré, et permet de parcourir son contenu avec une boucle `for`. On peut lire le fichier ligne par ligne sans charger tout le fichier en mémoire.

Cette mémoire est plus efficase en mémoire pour les grands fichiers, les lignes étant lues une par une. Cependant, cela peut être plus difficile à traiter si on doit revenir à la ligne précédente ou modifier l'ordre de lecture.

```python
# ===========================
# file 
# ===========================
file = open('example.txt', 'r')
for line in file:
    print(line.strip())
file.close()
```

### Ecriture de données dans un fichier 

```python 
# ===========================
# exemple de création 
# ===========================
file = open('example.txt', 'w')  # Ouvre le fichier pour écriture, le crée s'il n'existe pas
file.write("This is a new file.\n")
file.close()

# ===============================
# création de fichier vide 
# ===============================
file = open('example.txt', 'w')
file.close()
```

#### `write()` - écriture d'une chaine 

Permet d'écrire une chaîne dans un fichier. 

```python 
# Ouverture du fichier en mode écriture
file = open('example.txt', 'w')
file.write("Hello, World!\n")
file.write("This is a test file.\n")
file.close()
```

##### Ajout à la fin d'un fichier 

```python
file = open('example.txt', 'a')  # Ouverture du fichier pour ajout de données
file.write("This is a new line added to the file.\n")
file.write("Another line is appended.\n")
file.close()  # Fermeture du fichier
```

#### `writelines()` - ajoute de liste de chaine

Prends une liste de string et les écrits dans le fichier. Les caractères de nouvelles lignes ne sont pas ajouter automatiquement.

```python 
lines = ["First line.\n", "Second line.\n", "Third line.\n"]

# Ouverture du fichier en mode écriture
file = open('example.txt', 'w')
file.writelines(lines)
file.close()
```

##### Ajout de ligne à la fin du fichier 

```python 
lines = [
    "Appending first line from list.\n",
    "Appending second line from list.\n",
    "Appending third line from list.\n"
]

file = open('example.txt', 'a')  # Ouverture du fichier pour ajout de données
file.writelines(lines)  # Ajout de la liste de lignes
file.close()  # Fermeture du fichier
```

### Encodage du fichier

Il est possible de définir l'encodage du fichier texte de sa lecture ou écriture. Cela se fait en passant un troisième paramètre nommé `encoding`

```python 
# Ouverture du fichier pour écriture avec encodage UTF-8
file = open('example_utf8.txt', 'w', encoding='utf-8')
file.write("Texte en russe.\n")
file.write("More text in UTF-8.\n")
file.close()
```

#### Ajout de ligne avec un encodage spécifique 

```python 
# Ouverture du fichier pour ajout de données avec encodage spécifié
file = open('example_utf8.txt', 'a', encoding='utf-8')
file.write("Ajout d'une ligne avec UTF-8.\n")
file.write("Encore une ligne ajoutée.\n")
file.close()  # Fermeture du fichier
```

### `with`

L'opérateur `with` permet de gérer les ressources comme les fichiers en assurant la fermeture automatique après achevement du bloc. 

Il est utilisé pour envelopper l'exécution d'un bloc avec un gestionnaire de contexte. Lors de son utilisation, Python appelle automatiquement les méthodes `__enter__()` et `__exit__()` de l'objet gestionnaire de contexte.

```python 
# ==========================
# travail avec des fichiers 
# ==========================
with open('example.txt', 'w') as file:
    file.write("Hello, World!\n")
    file.write("This is a test file.\n")
```

Dans ce code, le fichier `example.txt` est ouvert en mode écriture, et le nom du fichier est lié à la variable `file`. Le bloc de code à l'intérieur de `with` ferme automatiquement le fichier après avoir effectué toutes les opérations d'écriture.

Avec l'opérateur, la fermeture automatique se fait même en cas d'exception.

```python 
# =============================
# avec gestion d'exception
# =============================
try:
    with open('example.txt', 'w') as file:
        file.write("Hello, World!\n")
        file.write("This is a test file.\n")
        # Exception pour vérifier que le fichier se ferme malgré tout
        raise Exception("Something went wrong")
except Exception as e:
    print(f"Caught an exception: {e}")
# À ce stade, le fichier est déjà fermé
```

### Fichier binaire 

La fonction `open()` permet d'ouvrir un fichier binaire. Elle retourne un tableau d'octets. Toutes les données peuvent être lues comme binaire.

**Mode d'accés**

- `rb`: mode lecture 
- `wb`: mode écriture 
- `ab`: mode ajout 
- `r+b` | `w+b` | `a+b`: lecture et écriture

#### Lecture 

**Lecture de tout le contenu**
`read()` lit tout le contenu du fichier en octets.

```python
file = open('example.bin', 'rb')
content = file.read()
print(content)
file.close()
```

**Lecture d'un certain nombre d'octets**

`read(n)` vient lire n nombre d'octets dans le fichier 

```python 
file = open('example.bin', 'rb')
content = file.read(10)  # Lit les 10 premiers octets
print(content)
file.close()
```

**Lecture ligne par ligne**

La méthode `readline()` lit une ligne du fichier. Avec les fichiers binaires, la ligne se termine par un caractère `\n`.

```python 
file = open('example.bin', 'rb')
line = file.readline()
print(line)
file.close()
```

**Lecture de toutes les lignes**

`readlines()` lit toutes les lignes du fichiers et les retourne sous forme de liste d'octets.

```python 
file = open('example.bin', 'rb')
lines = file.readlines()
for line in lines:
    print(line)
file.close()
```

#### Écriture 

`write()` écrits des octets dans un fichier. Les données à écrire doivent être sous forme d'octets `(bytes)`

**Lecture et écriture d'images**

Lecture d'une image à partir d'un fichier et écriture dans un autre fichier 

```python 
# Lecture de l'image
with open('input_image.jpg', 'rb') as infile:
    image_data = infile.read()

# Écriture de l'image
with open('output_image.jpg', 'wb') as outfile:
    outfile.write(image_data)
```

Écriture de données texte

```python 
data = b"Hello, World!"
lines = [b"First line.\n", b"Second line.\n", b"Third line.\n"]

file = open('example.bin', 'wb')
file.write(data)
file.writelines(lines)
file.close()
```

### 23 - Manipulation de fichier 

#### `shutil.copy()`

Permet de copier un fichier 

```python 
import shutil

shutil.copy('source.txt', 'destination.txt')
```

#### `shutil.move()` 

Permet de déplacer un fichier 

```python 
import shutil

shutil.move('source.txt', 'destination.txt')
```

#### `os.remove()`

Permet de supprimer un fichier 

```python 
import os

os.remove('example.txt')
```

#### `os.path.exists()`

Permet de vérifier si un fichier spécifier existe

```python 
import os

if os.path.exists('example.txt'):
    print("File exists")
else:
    print("File does not exist")
    # Si le fichier n'existe pas, le programme exécutera les actions décrites dans le bloc else.
    # Par exemple, on peut afficher un avertissement, créer un nouveau fichier ou quitter le programme.
```

#### `os.path.isdir()` | `os.path.isfile()`

Permet de vérifier si l'argument est un fichier ou un répertoire.

```python
# ===========================
# vérifier si répertoire 
# ===========================
if os.path.isdir('example_directory'):
    print("C'est un répertoire")
else:
    print("Ce n'est pas un répertoire")

# ================================
# vérifier si fichier 
# ================================
if os.path.isfile('example_file'):
    print("C'est un fichier")
else:
    print("Ce n'est pas un fichier")
```

#### `os.path.splitext()`

Permet de diviser le nom du fichier en deux partie et renvoie une liste de deux éléments: nom et extension 

```python 
# ==============================
# obtenir l'extension du fichier 
# ===============================
import os.path

file_path = 'example.txt'
file_extension = os.path.splitext(file_path)[1]
print(f"Extension du fichier : {file_extension}")

# ==================================
# obtenir le nom du fichier sans extension 
# ===================================
import os.path

# Obtenir le nom d'un fichier sans extension
file_path = 'example.txt'
file_name = os.path.splitext(os.path.basename(file_path))[0]
print(f"Nom du fichier sans extension : {file_name}")
```

#### `os.path.basename()`

Retourne le nom du fichier 

```python 
import os.path

# Obtenir le nom d'un fichier à partir du chemin
file_path = '/path/to/example.txt'
file_name = os.path.basename(file_path)
print(f"Nom du fichier : {file_name}")
```

#### `os.path.direname()`

Retourne le dossier du fichier 

```python 
import os.path

# Obtenir le répertoire à partir du chemin
file_path = '/path/to/example.txt'
directory = os.path.dirname(file_path)
print(f"Répertoire : {directory}")
```

#### `os.path.join()`

Permet d'obtenir le chemin complet vers le fichier 

```python 
import os.path

# Concatenation des chemins
directory = '/path/to'
file_name = 'example.txt'
full_path = os.path.join(directory, file_name)
print(f"Chemin complet : {full_path}")
```

##### Chemin indépendament de la plateforme 

```python 
import os

# Concatenation des chemins d'une manière indépendante de la plateforme
directory = 'some_directory'
file_name = 'example.txt'
full_path = os.path.join(directory, file_name)
print(f"Chemin complet : {full_path}")
```

#### `os.path.abspath()`

Permet d'obtenir le chemin absolu

```python 
import os.path

# Obtenir le chemin absolu
relative_path = 'example.txt'
absolute_path = os.path.abspath(relative_path)
print(f"Chemin absolu : {absolute_path}")
```

## 24 - Manipulation de répertoire

### `os.mkdir()`

Permet de créer un noveau repertoire 

```python 
import os

# Création d'un nouveau répertoire
os.mkdir('new_directory')
print("Répertoire 'new_directory' créé")
```

### `os.makedirs()`

Permet de créer plusieurs répertoire imbriqués 

```python 
import os

# Création de plusieurs répertoires imbriqués
os.makedirs('parent_directory/child_directory')
print("Répertoires imbriqués 'parent_directory/child_directory' créés")
```

### `os.rmdir()`

Permet de supprimer un reportoire vide 

```python 
import os

# Suppression d'un répertoire vide
os.rmdir('new_directory')
print("Répertoire 'new_directory' supprimé")
```

### `shutill.rmtree()`

Permet de supprimer un repertoire avec du contenu 


```python 
import shutil

# Suppression d'un répertoire avec contenu
shutil.rmtree('parent_directory')
print("Répertoire 'parent_directory' et tout son contenu supprimés")
```

**Attention**: on ne supprime pas un repertoire avec tout son contenu. Il est hautement probable qu'on bug arrive dans le programme. 

Il est recommandé de vérifier l'existence du répertoire avant de le supprimer 

```python 
import os
import shutil

# Vérification de l'existence du répertoire avant suppression
directory_path = 'parent_directory'
if os.path.exists(directory_path):
    shutil.rmtree(directory_path)
    print(f"Répertoire '{directory_path}' et tout son contenu supprimés")
else:
    print(f"Répertoire '{directory_path}' n'existe pas, suppression impossible")
```

### `os.rename()`

Permet de déplacer ou renommer un repertoire

```python
import os

# Création de répertoire pour exemple
os.mkdir('original_directory')

# Renommage du répertoire
os.rename('original_directory', 'renamed_directory')
print("Répertoire 'original_directory' renommé en 'renamed_directory'")
```

### `shutil.copytree()`

Permet de copier un repertoire. Elle copie le repertoire mais créer également un nouveau repertoire dans le chemin de destination.

```python 
import os
import shutil

# Création de répertoire pour exemple
os.mkdir('source_directory')

# Copie du répertoire
shutil.copytree('source_directory', 'destination_directory')
print("Répertoire 'source_directory' copié vers 'destination_directory'")
```

### `os.getcwd()`

Permet d'obtenir le repertoire courant 

```python
import os

# Obtenir le répertoire de travail courant
current_directory = os.getcwd()
print(f"Répertoire de travail courant : {current_directory}")
```

### `os.chdir()`

Permet de changer le repertoire de travail courant

```python 
import os

# Changer le répertoire de travail courant
os.chdir('new_directory')
print(f"Répertoire de travail courant changé en : {os.getcwd()}")
```

### `os.listdir()` - liste les fichiers dans un repertoire 

Permet d'obtenir une liste de fichiers et repertoires dans le repertoire spécifié

```python 
import os

# Obtenir une liste de fichiers et de répertoires dans le répertoire courant
contents = os.listdir('.')
print(f"Contenu du répertoire courant : {contents}")
```

### `os.scandir()` - information sur le contenu du répertoire

Retourne un itérateur qui rends les objets `DirEntry` pour chaque entrée dans le répertoire. Ces objets contiennent ddes informations sur les fichiers et répertoires ce qui est plus efficase que `os.listdir()`

```python 
import os

# Obtenir des informations sur le contenu du répertoire
with os.scandir('.') as entries:
    for entry in entries:
        print(f"Nom : {entry.name}, Est-ce un répertoire : {entry.is_dir()}, Est-ce un fichier : {entry.is_file()}")
```

---

## 25 - Sérialisation 

Processus de transformation d'un objet en séquence d'octets ou un format pouvant être enregistré dans un fichier, transmis sur un réseau ou sauvegardé dans une base de donnée.

Pour enregistrer un objet dans un fichier, il faut le transformer en chaîne qu'il sera facile d'écrire dans un fichier ou transmettre sur un réseau.

- **Enregistrement de l'état des objets**: pour conserver un état entre les exécution 
- **Transmission de données**
- **Mise en cache**: Stocker des objets en cache pour un accès rapide 
- **Bases de données**: Stocker des structures de données complexes dans des BDD

### Module `pickle`

Permet de sauvegarder des objets Python dans un fichier ou une chaîne, puis de le restaurer dans son état initial.

#### Sérialisation dans un fichier 

1. Ouverture du fichier en mode `wb`
2. Sérialisation de l'objet avec `pickle.dump(obj, file)`
3. Déserialisation avec `pickle.load(file)`
4. Fermeture du fichier 

```python 
# ===================================
# serialisation et deserialization dans un fichier 
# ===================================
import pickle

data = [1, 2, 3, 4, 5]

# Sérialisation de la liste dans un fichier
with open('list.pkl', 'wb') as file:
    pickle.dump(data, file)

# Désérialisation de la liste à partir du fichier
with open('list.pkl', 'rb') as file:
    loaded_data = pickle.load(file)

print(loaded_data)  # Affichage : [1, 2, 3, 4, 5]

# =============================================
# serialisation dictionnaire 
# =============================================
import pickle

# Exemple d'objet pour la sérialisation
data = {'name': 'Alice', 'age': 30, 'is_student': False}

# Sérialisation de l'objet dans un fichier
with open('data.pkl', 'wb') as file:
    pickle.dump(data, file)

# Désérialisation de l'objet à partir du fichier
with open('data.pkl', 'rb') as file:
    loaded_data = pickle.load(file)

print(loaded_data)  # Affichage : {'name': 'Alice', 'age': 30, 'is_student': False}
```

#### Sérialisation en chaîne 

Sérialiser des objets en chaîne permet de les envoyer par le réseau.

```python
import pickle

# Exemple d'objet pour la sérialisation
data = {'name': 'Bob', 'age': 25, 'is_student': True}

# Sérialisation de l'objet en chaîne
serialized_data = pickle.dumps(data)
print(serialized_data)

# Désérialisation de l'objet à partir de la chaîne
loaded_data = pickle.loads(serialized_data)
print(loaded_data)  # Affichage : {'name': 'Bob', 'age': 25, 'is_student': True}
```

#### Erreur de sérialization 

Le module déclenche des exceptions en cas d'erreur :
- `pickle.PicklingError`: erreur pendant la sérialisation 
- `pickle.UnpicklingError`: erreur pendant la déserialisation 

```python 
import pickle

data = {'key': 'value'}

try:
    # Sérialisation de l'objet dans un fichier
    with open('data.pkl', 'wb') as file:
        pickle.dump(data, file)
except pickle.PicklingError as e:
    print(f"Erreur de sérialisation: {e}")

try:
    # Désérialisation de l'objet à partir du fichier
    with open('data.pkl', 'rb') as file:
        loaded_data = pickle.load(file)
    print(loaded_data)
except pickle.UnpicklingError as e:
    print(f"Erreur de désérialisation: {e}")
```

### Module `json`

Module intégré pour travailler avec JSON. 

```python 
import json

# Exemple d'objet à sérialiser
data = {'name': 'Bob', 'age': 25, 'is_student': True}

# Sérialisation de l'objet en chaîne JSON
json_string = json.dumps(data)
print(json_string)

# Sérialisation de l'objet dans un fichier JSON
with open('data.json', 'w') as file:
    json.dump(data, file)

# Désérialisation de l'objet à partir de la chaîne JSON
loaded_data = json.loads(json_string)
print(loaded_data)

# Désérialisation de l'objet à partir du fichier JSON
with open('data.json', 'r') as file:
    loaded_data = json.load(file)
print(loaded_data)
```

### Module `yaml`

```python 
import yaml

# Exemple d'objet à sérialiser
data = {'name': 'Carol', 'age': 27, 'is_student': False}

# Sérialisation de l'objet en chaîne YAML
yaml_string = yaml.dump(data)
print(yaml_string)

# Sérialisation de l'objet dans un fichier YAML
with open('data.yaml', 'w') as file:
    yaml.dump(data, file)

# Désérialisation de l'objet à partir de la chaîne YAML
loaded_data = yaml.load(yaml_string, Loader=yaml.FullLoader)
print(loaded_data)

# Désérialisation de l'objet à partir du fichier YAML
with open('data.yaml', 'r') as file:
    loaded_data = yaml.load(file, Loader=yaml.FullLoader)
print(loaded_data)
```

### Module `marshal` 

Module intégré

```python 
import marshal

# Exemple d'objet à sérialiser
data = {'name': 'Dave', 'age': 35, 'is_student': True}

# Sérialisation de l'objet dans un fichier
with open('data.marshal', 'wb') as file:
    marshal.dump(data, file)

# Désérialisation de l'objet à partir d'un fichier
with open('data.marshal', 'rb') as file:
    loaded_data = marshal.load(file)

print(loaded_data)
```

### Module `shelve`

```python 
import shelve

# Exemple d'objet à sérialiser
data = {'name': 'Eve', 'age': 28, 'is_student': False}

# Sérialisation de l'objet dans un fichier
with shelve.open('data.shelve') as db:
    db['person'] = data

# Désérialisation de l'objet à partir d'un fichier
with shelve.open('data.shelve') as db:
    loaded_data = db['person']

print(loaded_data)
```

### Gestion de la sérialisation 

Parfois, les objets contiennent beaucoup de références à différents objets de service que l'on ne souhaite pas transmettre sur le réseau (référence à des fichiers, bases de données, ...)

Des méthodes sont fournis permettant d'indiquer comment les objets doivent être sérialisés et restaurés.

#### `__reduce__()` 

Cette méthode retourne un tuple qui indique comment l'objet doit être sérialisé et désérialisé. Le tuple contient généralement :
- une référence à la fonction ou classe qui sera utilisée pour restaurer l'objet 
- un tuple d'arguments pour cette fonction ou classe 
- un état supplémentaire de l'objet 

```python 
import pickle

class CustomClass:
    def __init__(self, value):
        self.value = value

    def __reduce__(self):
        return (self.__class__, (self.value,))

    def __repr__(self):
        return f"CustomClass(value={self.value})"

# Création de l'objet
obj = CustomClass(42)

# Sérialisation de l'objet
serialized_obj = pickle.dumps(obj)
print("Objet sérialisé :", serialized_obj)

# Désérialisation de l'objet
deserialized_obj = pickle.loads(serialized_obj)
print("Objet désérialisé :", deserialized_obj)
```

#### `__getstate__()` et `__setstate__(self, state)`

Ces méthodes sont utilisées pour gérer l'état d'un objet pendant la sérialisaiton et désérialisation 

- `__getstate__()`: retourne l'état de l'objet, qui doit être sérialisé
- `__setstate__(self, state)`: restaure l'objet à partir de l'état 

Exemple: on souhaite sauvegarder une partie des champs de l'objet. Dans `__getstate__()`, il faut:
- Copier l'état actuel dans une variable séparé `state`
- Supprimer de celle ci tous les champs qui ne doivent pas être sérialisé
- Retourner l'objet obtenu en tant que résultat de la fonction `__getstate__()`

```python 
import pickle

class CustomClass:
    def __init__(self, value):
        self.value = value
        self.internal_state = "internal"

    def __getstate__(self):
        state = self.__dict__.copy()
        del state['internal_state']  # Exclusion de l'état interne
        return state

    def __setstate__(self, state):
        self.__dict__.update(state)
        self.internal_state = "restored internal"  # Restauration de l'état interne

    def __repr__(self):
        return f"CustomClass(value={self.value}, internal_state={self.internal_state})"

# Création de l'objet
obj = CustomClass(42)
print("Objet original :", obj)

# Sérialisation de l'objet
serialized_obj = pickle.dumps(obj)
print("Objet sérialisé :", serialized_obj)

# Désérialisation de l'objet
deserialized_obj = pickle.loads(serialized_obj)
print("Objet désérialisé :", deserialized_obj)
```

Lors de la désérialization, dans `__setstate__()`:
- on met à jour l'état actuel de l'objet avec `update()`
- le champ `internal_state` récupère de nouvelles valeurs 

---

