# C++ 

## Fondamentaux 

```c++
// directive de préprocesseur => permet de charger des lib
// iostream(Input Output stream): lib pour l'affichage 
#include <iostream>

// permet de déclarer un namespace => dossier de nom 
// indique que l'on vas utiliser `std`
using namespace std;

int main(){
  // c out => affiche un message 
  // inclut par iostrean
  // endl => permet de créer un retour à la ligne
  // << séparartion entre chaque morceau de la string
  cout << "Hello world!" << endl;
  // termine l'execution de la fonction 
  return 0;
}
```

## Variables 

### Types

- `bool`: boolean 
- `char`: character
- `int`: entier 
- `unsigned int`: nombre entier positif
- `double`: nombre a virgule 
- `string`: chaine de char 

### Déclaration 

```c++
#include <iostream>
#include <string> // permet de déclarer des strings

using namespace std;

int main(){
  // entier
  int ageUser(16);
  int numberFriends(432);

  // double
  double pi(3.14);

  // boolean
  bool isMyFriend(true);

  // character
  char lettre('a');

  // string 
  string username("Gizmo");

  // déclaration multiple 
  string city("Melrand"), countre("Bretagne");

  // allocation sans valeur 
  int nbPlayer;

  return 0;
}
```

### Utilisation des variables 

```c++
#include <iostream>
#include <string> // permet de déclarer des strings

using namespace std;

int main(){
  int ageUser(16);
  cout << "Votre âge est: " << ageUser << endl;
  // sortie: Votre âge est: 16
  return 0;
}
```

### Modifier une variable 

Le symbole `=` permet de changer la valeur d'une variable.

```c++
int main()
{
  int a(4), b(5); // déclaration des variables

  cout << "a vaut: " << a << " et b vaut: " << b << endl;

  cout << "Affectation !" << endl;

  a = b;

  cout << "a vaut: " << a << " et b vaut : " << b << endl;

  return 0;
}
```

### Utilisation pour des calculs 

- `+`: addition 
- `-`: soustraction 
- `*`: multiplication 
- `/`: division 
- `%`: modulo 

La division de nombre entier aura pour résultat un nombre entier. La partie décimal sera ignoré

```c++
#include <iostream>
using namespace std;

int main()  
{
  int resultat(0), a(5), b(8);

  resultat = a + b;

  cout << "5 + 8 = " << resultat << endl;
  return 0;
}
```

## Référence 

C++ permet d'utiliser d'autre "etiquette" pour faire référence à un emplacement mémoire. IT's like alias.

On as une case mémoire, mais deux "étiquettes" lui sont attribués.

`&` permet de déclarer une référence sur une variable.

```c++
#include <iostream>
#include <string> 

using namespace std;

int main(){
  // utilisation des variables et affichages 
  int ageUser(16);
  cout << "============ Utilisation de variable. ===========" << endl;
  cout << "Votre âge est: " << ageUser << endl;

  // déclaration de référence  
  int& maRef(ageUser);
  cout << "============ Utilisation de référence. ===========" << endl;
  cout << "Votre âge est: " << maRef << endl;


  return 0;
}
```

Les références sont utilisées par exemple, dans deux parties différentes du programme. Dans une partie, le programme vient déclarer la variable, et dans l'autre partie l'affichage. Dans la deuxiéme partie, on pourra venir utiliser une référence pour utiliser la variable initial.

---

## Constante 

```c++
// déclaration d'une constante
int const nombreNiveaux(10);

string const motDePasse("wAsTZsaswQ"); //Le mot de passe secret
double const pi(3.14);
unsigned int const pointsDeVieMaximum(100); //Le nombre maximal de points de vie


---

## `cin` - saisie user

`>>` - `cin` permet de faire entrer des informations dans le programme.

```c++
#include <iostream>
#include <string> 

using namespace std;

int main(){
  cout << "Quel âge avez-vous?" << endl;

  int userAge(0); // préparation de la variable 
  cin >> userAge; // set la valeur dans la variable 

  cout << "Vous avez " << userAge << " ans!" << endl;

  return 0;
}
```

### `getline()` - afficher une string 

`cin` arrête la capture lorsqu'il rencontre un espace, ou bien un saut de ligne. Pour pouvoir récupérer une chaîne complete, il faut venir utiliser `getline()` qui arrête la capture au saut de ligne 

```c++
int main(){
  cout << "Quel est votre nom ?" << endl;
  string username("Sans nom");
  getline(cin, username); // récupère l'ensemble de la ligne saisie et la place dans la variable

  cout << "Combien vaut pi ?" << endl; 
  double piUser(-1); 
  cin >> piUser;

  cout << "Vous vous appelez " << username << " et vous pensez que pi vaut " << piUser << "." << endl;

  return 0;
}
```

### `cin.ignore()` - clean buffer 

Lorsque l'on souhaite récupérer la saisis user aprés une capture de nombre, il faut venir vider le buffer pour capture correctement la valeur.

```c++
int main()
{
  // récupération d'un nombre
  cout << "Combien vaut pi ?" << endl; 
  double piUser(-1); 
  cin >> piUser;

  cin.ignore(); // permet de vider le buffer pour skip le saut de ligne de la capture précédente

  // récupération d'une chaîne
  cout << "Quel est votre nom ?" << endl;
  string username("Sans nom");
  getline(cin, username); // récupère l'ensemble de la ligne saisie et la place dans la variable

  cout << "Vous vous appelez " << username << " et vous pensez que pi vaut " << piUser << "." << endl;

  return 0;
}
```