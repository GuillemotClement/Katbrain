# C++



## Affichage 

```c++
// import de package
#include <iostream>

int main() {
  // print 
    std::cout << "C'est génial d'être programmeur!😎\n";

    // afficher une chaîne en plusieurs parties
    std::cout << "X=" << 10 << '\n';
    return 0;
}
```

- `std::cout`: objet 
- `<<` : opérateur qui se lit comme "envoyer dans le flux"


## Variable

```c++
#include <string>

int main() {
    int x123 = 1;
    std::string kitty;
    double PI = 3.14;
    std::string MAIN_PATH = "c:/";

    // concaténation
    std::string s1 = std::string("Amigo") + " the best";

    // concanénation avec entier
    int x = 333;
    std::string s3 = std::string("Amigo") + std::to_string(x);

    // affectation abrégée 
    int x = 10;

    x += 5;  // x = 15
    x -= 3;  // x = 12
    x *= 2;  // x = 24
    x /= 4;  // x = 6

    std::string s = "Hello";
    s += " World";   // "Hello World"
}
```

