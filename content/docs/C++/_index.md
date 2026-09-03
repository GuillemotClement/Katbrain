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
```

---

## Récupération saisie utilisateur

### `cin` - saisie user

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

---

## Mathématique 

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

Syntaxe courte :

```c++
double nombre(5.3);
nombre += 4.2;       //'nombre' vaut maintenant 9.5
nombre *= 2.;        //'nombre' vaut maintenant 19
nombre -= 1.;        //'nombre' vaut maintenant 18
nombre /= 3.;        //'nombre' vaut maintenant 6
return 0;
```

### Incrémentation et décrémentation

```c++
// incrémentation
int nombreJoueur(4); //Il y a 4 joueurs dans la partie
nombreJoueur++;
//À partir d'ici, il y a 5 joueurs

// décrémentation
int nombreJoueur(4); //Il y a 4 joueurs dans la partie
nombreJoueur--; //On en enlève un
//À partir d'ici, il y a 3 joueurs
```

### `<cmath>` - lib 

```c++
// racine carré
#include <iostream>
#include <cmath>  //Ne pas oublier cette ligne 
using namespace std;

int main()
{
    double const nombre(16); //Le nombre dont on veut la racine
                             //Comme sa valeur ne changera pas on met 'const'
    double resultat;         //Une case mémoire pour stocker le résultat

    resultat = sqrt(nombre);  //On effectue le calcul !

    cout << "La racine de " << nombre << " est " << resultat << endl;

    return 0;
}
```

---

## Condition 

- `==` : égalité
- `>`: supérieur
- `>=`: supérieur ou égale
- `<`: inférieur 
- `<=`: inférieur ou égale 
- `!=`: différent

### `if else`

```c++
#include <iostream>

using namespace std;

int main()
{
    int nbAnimaux(2);

    if (nbAnimaux == 0)
    {
        cout << "Vous n'avez pas d'animaux de compagnie" << endl;
    }
    else if (nbAnimaux == 1)
    {
        cout << "C'est super d'avoir un fidele compagnon !" << endl;
    }
    else if (nbAnimaux == 2)
    {
        cout << "Ca doit en faire du monde a la maison !" << endl;
    }
    else
    {
        cout << "Votre budget croquettes doit etre important" << endl;
    }

    cout << "Fin du programme" << endl;
    return 0;
}
```

### `switch`

```c++
#include <iostream>

using namespace std;

int main()
{
    int nbAnimaux(2);

    switch (nbAnimaux)
    {
        case 0:
            cout << "Vous n'avez pas d'animaux de compagnie" << endl;
            break;

        case 1:
            cout << "C'est super d'avoir un fidele compagnon !" << endl;
            break;

        case 2:
            cout << "Ca doit en faire du monde a la maison !" << endl;
            break;

        default:
            cout << "Votre budget croquettes doit etre important" << endl;
            break;
    }

    return 0;
}
```

### Vérification avec boolean 

```c++
bool adulte(true);

if (adulte)
{
    cout << "Vous etes un adulte !" << endl;
}
```

### Opérateur conditionelle 

- `&&`: ET 
- `||`: OU 
- `!`: NOT 

```c++
// ET 
if (adulte and nbEnfants >= 1)

// OR 
if (nbEnfants == 1 or nbEnfants == 2)

// NOT 
if (not adulte)
```

---

## Boucle

### `while` 

```c++
int main()
{
    int nbEnfants(-1); // Nombre négatif pour pouvoir entrer dans la boucle

    while (nbEnfants < 0)
    {
        cout << "Combien d'enfants avez-vous ?" << endl;
        cin >> nbEnfants;
    }

    cout << "Merci d'avoir indique un nombre d'enfants correct. Vous en avez " << nbEnfants << endl;

    return 0;
}
```

### `do ...while`

```c++
int main()
{
    int nbEnfants(0);

    do
    {
        cout << "Combien d'enfants avez-vous ?" << endl;
        cin >> nbEnfants;
    } while (nbEnfants < 0);

    cout << "Merci d'avoir indique un nombre d'enfants correct. Vous en avez " << nbEnfants << endl;

    return 0;
}
```

### `for`

```c++
int main()
{
    for (int compteur(0) ; compteur < 10 ; compteur++)
    {
        cout << compteur << endl;
    }

    return 0;
}
```