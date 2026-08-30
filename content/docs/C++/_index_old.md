# C++

```c++
// programme minimal
int main(){
  // affichage
  std::cout << "Le robot est l'ami de l'homme" << '\n';
  return 0;
}
```

Fonction `main()` est point d'entrée du programme.

- `int`: retour de la fonction. `main()` doit retourner un code de sortie. `0` pour indique que l'exécution n'as pas rencontrée d'erreur.

```c++
// inclusion de fonction fournis par la lib std
#include <iostream>

int main() {
    return 0;
}
```

- `#include`: permet d'importer des fonctions fournes par la lib 
- `<iostream>`: nom de la lib entre chevron 

## Affichage 

### `sdt::cout`

Instruction permettant d'afficher du contenu à l'écran.

```c++
std::cout << 1 << '\n'; // 1 -> affichage d'un int 
std::cout << "Amigo" << '\n'; // Amigo -> affichage d'une String
std::cout << 'A'; // A -> affichage de caractère
std::cout << "X=" << 10 << '\n'; // X=10 -> affichage de chaîne complexe

// affichage avec variable
std::string s1 = "Amigo";
std::cout << s1 << '\n'; 
```

- `str::cout`: objet. **cout** est l'abréviation pour "sortie console".
- `<<`: opérateur qui se lit "envoyer dans le flux". La chaîne d'opérateurs imprime les éléments les uns après les autres
- `\n`: saut de ligne

#### Concaténation 

L'opérateur `<<` permet de faire une concaténation.

```c++
std::cout << "Mon âge : " << 28 << '\n'; // Mon âge : 28
```

## Variable

```c++
#include <string>

int main() {
    int x123 = 1;
    // String 
    std::string name = "John";
    double PI = 3.14;

    // String avec concaténation 
    std::string s1 = std::string("Amigo") + " the best";

    // affectation abrégée
    int x = 10;

    x += 5;  // x = 15
    x -= 3;  // x = 12
    x *= 2;  // x = 24
    x /= 4;  // x = 6
}
```

---

## `int` 

Le type `int` permet de stocker des nombres entiers.

```c++
#include <iostream>

int main() {
    int score = 0; // déclaration et affectation de valeur
    std::cout << score << '\n'; // 0

    score = 10; // changement de valeur
    std::cout << score << '\n'; // 10
}
```

### Opération arithmétique 

```c++
#include <iostream>

int main() {
    int a = 7;
    int b = 2;

    std::cout << (a + b) << '\n'; // 9
    std::cout << (a - b) << '\n'; // 5
    std::cout << (a * b) << '\n'; // 14
}
```

#### Division de `int`

Avec la division de `int`, le résultat sera toujours un `int`. La partie décimale est ignorée

```c++
#include <iostream>

int main() {
    int a = 7;
    int b = 2;

    std::cout << (a / b) << '\n'; // 3
}
```

Une division par zéro est interdite, et fait planter le programme.

#### Module - `%` 

Le modulo permet d'obtenir le reste d'une division. Il fonctionne uniquement avec des `int`.

```c++
#include <iostream>

int main() {
    int a = 7;
    int b = 2;

    std::cout << (a % b) << '\n'; // 1
}
```

---

## String 

`str::string` permet de créer une variable de type `String`. Il permet de contenir une séquence de caractère. Il fournit également des méthodes pour travailler avec des chaîne.

Pour utiliser ce type, il est nécessaire d'inclure la lib `string` dans le header du fichier.

Une chaîne est déclarer entre `"`.

```c++
#include <iostream>
#include <string> // import de la lib pour utiliser le type

int main() {
    // déclaration de la variable String
    std::string course = "C++ for beginners";
    // affichage de la variable 
    std::cout << course << '\n'; // C++ for beginners
}
```

### Concaténation

La concaténation permet d'assembler plusieurs chaîne de caractère. Il existe deux façon de réaliser cette opération:
- `a + b`: créer une nouvelle chaîne
- `a += b`: ajoute à la chaîne existante.

```c++
// =====================================================
// a + b ===============================================
// =====================================================
#include <iostream>
#include <string>

int main() {
    std::string first = "Ada";
    std::string last = "Lovelace";

    std::string full = first + " " + last;
    std::cout << full << '\n'; // Ada Lovelace
}
// =====================================================
// a += b ==============================================
// =====================================================
#include <iostream>
#include <string>

int main() {
    std::string badge = "Name: ";
    badge += "Ada";
    badge += " ";
    badge += "Lovelace";

    std::cout << badge << '\n'; // Name: Ada Lovelace
}
```

### Méthode de String 

Le type `std::string` fournis des méthodes permettant de travailler sur un type `String`. 

#### `size()` - longueur d'une chaîne 

Retourne le nombre de caractères d'une chaîne. 

```c++
#include <iostream>
#include <string>

int main() {
    std::string city = "Boston";
    std::cout << city.size() << '\n'; // 6

    char lastChar = city[city.size() - 1]; // récupération du dernier caractère
    std::cout << lastChar << '\n'; // o
}
```

### Indexation 

Une chaîne est une suite de `char`. On peut y accéder de manière individuel à l'aide de leur index. La numérotation commence à zéro.

L'index doit être dans l'interval de 0 à la longueur de la chaîne -1. Si on sort de cette plage, le programme plante.

```c++
#include <iostream>
#include <string>

int main() {
    std::string animal = "cat";

    std::cout << animal[0] << '\n'; // c
    std::cout << animal[1] << '\n'; // a
    std::cout << animal[2] << '\n'; // t
}
```

Il est possible de venir modifier un caractère par index.

```c++
#include <iostream>
#include <string>

int main() {
    std::string word = "bat";
    word[0] = 'c'; // remplacement du caractère

    std::cout << word << '\n'; // cat
}
```

---

## `char` 

Permet de stocker un caractère. Le caractère est déclarer entre `'`.

```c++
#include <iostream>
#include <string>

int main() {
    char firstLetter = 'C';                     // un seul caractère

    std::cout << firstLetter << '\n'; // C
}
```

---

## Entrée utilisateur - `std::cin`

La saisie se fait avec `std::cin` avec l'opérateur `>>` qui vient lire une portion de donnée à la fois. Cette portion est pratiquement toujours délimitée par des caractères d'espacement.

Pour lire quelque chose, il faut ume variable où placer ce quelque chose. 

```c++
// lecture d'un entier 
#include <iostream>

int main() {
    int age = 0;

    std::cin >> age; // récupération de la saisie
    std::cout << "Age = " << age << '\n'; // si on a saisi 20, affichera : Age = 20
}
```

Un jeton est un morceau de texte sans espace. L'opérateur `>>` fonctionne de cette manière: "saute les espaces, puis prends les caractères consécutifs jusqu'au prochain espace". Les espaces sont `' '`, `\n` ou `\t`.
"
Par exemple, l'use saisit "12 14", ou l'utilisateur saisit un espace entre ces deux saisies. 

```c++
#include <iostream>

int main() {
    int a = 0;
    int b = 0;

    std::cin >> a >> b; // deux lectures consécutive écrit sur une ligne
    std::cout << "a=" << a << ", b=" << b << '\n'; // pour l'entrée "12   34" affichera : a=12, b=34
}
```

Tout caractéres d'espacement est une frontière de jeton. 

Par exemple, pour ces deux saisis, le résultat est le même. L'entrée ou l'espace ont la même signification pour la séparation de jeton.

```c++
// saisie avec entree
Ivan
Ivanov 

// saisie avec espace 
Ivan Ivanov 

// récupération des saisie
#include <iostream>
#include <string>

int main() {
  // déclaration des variables
    std::string first;
    std::string last;
  
  // récupération des saisies
    std::cin >> first >> last;
    std::cout << first << " | " << last << '\n'; // Ivan | Ivanov
}
```

## Lecture de ligne - `std::getline` 

Permet de lire une ligne entière, jusqu'a la fin de la ligne. La ligne est lu jusqu'au caractère de saut de ligne `\n` et celui ci n'est pas inclut dans le résultat. Il sert de délimiteur.

```c++
#include <iostream>
#include <string>

int main() {
    std::string line; // création de la variable 
    std::getline(std::cin, line); // récupération de la saisie 

    // les crochets améliore la lisibilitée
    std::cout << "[" << line << "]\n"; // par exemple: [Hello world]
    // permet de détecter une saisie vide de l'user
    std::cout << "Size=" << line.size() << '\n'; // Size=0 pour une ligne vide
}
```

### Piège du saut de ligne 

Lorsque `std::cin` lit un token, il prend les caractères jusqu'au premier espace/tabulation/saut de ligne. Le séparateur, par exemple `\n` reste dans le flux d'entrée.

`std::getline` fonctionne "je lis jusqu'au `\n`". Si le prechain caractères non lu dans le flux est immédiatement le `\n`, alors `getline` va récupérer une chaîne vide.

Par exemple:
- user saisit l'âge et appuie sur entrée
- puis il saisit le nom et appuie sur entrée

Dans les données, cela ressemble à ceci :

```md
25\n
Ivan Ivanov\n
```

Et dans le code 

```c++
#include <iostream>
#include <string>

int main() {
    int age = 0;
    std::string name;

    std::cin >> age;
    std::getline(std::cin, name); // piège!

    std::cout << "Age=" << age << '\n';
    std::cout << "Name=[" << name << "]\n"; // souvent vide : []
}
```

La sortie probable sera :

```md
Age=25
Name=[]
```

Le `\n` après le nombre est resté dans l'entrée, et que `getline` l'a immédiatement "mangé" comme fin de ligne.

### Mélanger `>>` et `getline`

Pour pouvoir lire avec `std::cin >>`, par exemple, récupérer un nombre, puis lire une ligne entière avec `std::getline`, le moyen le plus simple est de stabiliser le comportement avec un appel supplémentaire à `getline` dans une **variable tampon** afin d'absober le reste de la ligne supplémentaire.

```c++
#include <iostream>
#include <string>

int main() {
    int age = 0;
    std::string dummy;
    std::string name;

    std::cin >> age;
    std::getline(std::cin, dummy); // on a récupéré le '\n' restant => variable tampon
    std::getline(std::cin, name);  // maintenant on lit la vraie ligne

    std::cout << "Age=" << age << '\n';
    std::cout << "Name=[" << name << "]\n";
}
```

### `getline` multiple 

`std::line` peut lire plusieurs ligne à la suite. Il vient lire proprement jusqu'a `\n` et place le flux au début de la ligne suivante.

```c++
#include <iostream>
#include <string>

int main() {
    std::string city;
    std::string street;

    std::getline(std::cin, city);
    std::getline(std::cin, street);

    std::cout << "City=[" << city << "]\n";
    std::cout << "Street=[" << street << "]\n";
}
```

---

## Conversion String en nombre - `std::stoi` 

```c++
#include <iostream>
#include <string>

int main() {
    std::string text = "42";
    int value = std::stoi(text); // conversion du nombre en format int

    std::cout << value << '\n';     // 42
}
```

Généralement, on viens récupérer les saisies avec `getline`, puis on viens tenter de la transformer en nombre.
Cette méthode est plus sur que de récupérer directement sous forme de `int` la saisie.
```c++
#include <iostream>
#include <string>

int main() {
    std::string fullName;
    std::string birthYearText;

    std::cout << "Entrez le nom et le prénom : ";
    std::getline(std::cin, fullName); // récupération du full name 

    std::cout << "Entrez l'année de naissance (par exemple, 2005) : ";
    std::getline(std::cin, birthYearText); // récupération de l'année en format String

    int birthYear = std::stoi(birthYearText); // conversion en int 
    int age = 2026 - birthYear; // calcul 

    std::cout << "Bonjour, " << fullName << "!\n";
    std::cout << "Vous avez environ " << age << " ans.\n";
}
```

### Comportement 

**Espace intial et signe**

`std:stoi` sait ignorer les espaces initiaux.

```c++
#include <iostream>
#include <string>

int main() {
    std::string text = "   15";
    int value = std::stoi(text);

    std::cout << value << '\n'; // 15
}
```

**Conversion partielle**

La chaîne peut contenir un nombre au début, puis des caractères indésirable. `std::stoi` prends souvent le nombre au début et s'arrête au premiere caractère non compatible.

La chaîne "12kg" peut ainsi devenir le nombre 12. 

```c++
#include <iostream>
#include <string>

int main() {
    std::string text = "12kg";
    int value = std::stoi(text);

    std::cout << value << '\n'; // 12
}
```

### Limitation 

`std::stoi` peut prover des erreurs d'exécution lorsque la chaîne ne ressemble pas à un nombre.

---

## Comparaison 

### Type `bool`

Contient une valeur `true` ou `false`.

```c++
#include <iostream>

int main() {
    bool ok = true;
    bool failed = false;

    std::cout << ok << '\n';      // 1
    std::cout << failed << '\n';  // 0
}
```

La comparaison permet d'obtenir une valeur de type `bool`




### Opérateur de comparaison 

