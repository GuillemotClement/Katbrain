# C - Gestion memoire

## Base

**Programme simple en C**

```c
int main() {
    return 0;
}
```

- `main`: fonction principale, c'est le point d'entree du programme.
- `int`: type du retour de la fonction.
- `return 0`: retourne une valeur 0. 0 etant le code de succes -> "nothing bad happened"

---

## `printf`

```c
// import de la lib pour le print
#include <stdio.h>

// ....
//affichage
printf("Hello World!\n");
// ....
```

- `%d`: int
- `%c`: char
- `%f`: float
- `%s`: string
- `\n`: nouvelle ligne

```c
printf("Hello, %s. You're %d years old.\n", name, age);
```

---

## Commentaire

```c
// This is a single-line comment

/*
This is a multi-line comment
I can just keep adding lines
and it will still be a comment
*/
```

---

## Type

- `int`: integer
- `float`: nombre a virgule
- `char`: character
- `char *`: string -> array de char
- `void`: lorsqu'une fonction ne retourne rien

---

## Variable

```c
int main() {

    // declaration et modification de variable
    int x = 5;
    x = 10; // this is ok
    x = 15; // still ok

    // declaration d'une variable string
    char *msg_from_dax = "You still have 0 users";
}
```

---

## Constante 

```c
int main() {
    const int x = 5;
    x = 10; // error
}
```

---

## Fonction 

```c
float add(int x, int y) {
    return (float)(x + y);
}
```

- `float`: type de retour de la fonction 
- `add`: nom de la fonction
- `int x, int y`: type et parametre de la fonction 
- `return (float)(x + y)`: instruction de la fonction -> retourne le resultat de l'operation 
- `(float)`: permet de "caster" le resultat -> convertir en float la valeur issue du resultat

```c
int main() {
    // appel de la fonction
    float result = add(10, 5);
    printf("result: %f\n", result);
    // result: 15.000000
    return 0;
}
```

### Fonction `void`

Lorsqu'une fonction ne retourne rien, on utilise un type special 

```c
void print_integer(int x) {
    printf("this is an int: %d", x);
}
```

---

## Arithmetique 

```c
// operation de base 
x + y;
x - y;
x * y;
x / y;

// incrementation et decrementation 
x++; // += 1
x--; // -= 1

int a = 5;
int b = a++; // b is assigned 5, then a becomes 6
```

---

## Condition 

```c
if (x > 3) {
    printf("x is greater than 3\n");
} else if (x == 3) {
    printf("x is 3\n");
} else {
    printf("x is less than 3\n");
}

// syntaxe courte 
if (x > 3) printf("x is greater than 3\n");
```

---

## Operateur logique 

- `&&`: AND 
- `||` : OR 
- `!`: NOT 

```c
int age = 25;
bool has_license = true;

if (age >= 18 && has_license) {
    printf("Can drive\n");
}
```

C permet d'utiliser les **short circuit evaluation**

- avec `&&`, si la premiere condition est `false`, la seconde n'est jamais evaluer
- avec `||`, si la premiere conditon est `true`, la seconde n'est pas evaluer

```c
if (x != 0 && 10 / x > 2) {
    // The division only happens if x != 0
    // This prevents a division by zero error
    printf("Safe!\n");
}
```

## Ternaire

```c
int a = 5;
int b = 10;
int max = a > b ? a : b;
printf("max: %d\n", max);
// max: 10
```

---

## Type sizes

`sizeof` permet d'obtenir la taille d'un type

### `size_t`

Type special qui garantis la capacite de representer la taille la plus large possible. C'est egalement le type du retour de `sizeof`

```c
int main() {
  // Use %zu for printing `sizeof` result
  printf("sizeof(char)   = %zu\n", sizeof(char));
  printf("sizeof(bool)   = %zu\n", sizeof(bool));
  printf("sizeof(int)   = %zu\n", sizeof(int));
  printf("sizeof(float)   = %zu\n", sizeof(float));
  printf("sizeof(double)   = %zu\n", sizeof(double));
  printf("sizeof(size_t)   = %zu\n", sizeof(size_t));  
}

/*
sizeof(char)   = 1
sizeof(bool)   = 1
sizeof(int)   = 4
sizeof(float)   = 4
sizeof(double)   = 8
sizeof(size_t)   = 4
*/
```

--- 

## Boucle `for`