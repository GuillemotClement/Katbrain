# Boucle 

## Boucle `while`

Permet de répéter la même instruction tant que la condition est `true`. 

```java 
// ==========================
// syntaxe 
// ==========================
while (condition)
{
    // Corps de la boucle
}
```

**Compteur** 

```java
// =============================
// compteur classique 
// =============================
int i = 1;
while (i <= 5)
{
    System.out.println("Étape n° " + i);
    i++; // N’oubliez pas d’incrémenter le compteur !
}
// Affichera :
// Étape n° 1
// Étape n° 2
// Étape n° 3
// Étape n° 4
// Étape n° 5
```

**Saisie au clavier**

```java
// =================================
// saisie au clavier jusqu'a une valeur attendu 
// =================================
String password = "";
while (!password.equals("qwerty"))
{
    System.out.print("Entrez le mot de passe : ");
    password = console.nextLine();
}
System.out.println("Bienvenue !");
```

**Boucle infinie**
```java
// =====================================
// boucle infinie 
// =====================================
while (true)
{
    System.out.println("Je suis éternel !");
}
```

---

## Boucle `do-while`

La boucle itère une fois, puis vérifie sa condition.

```java 
// =============================
// syntaxe 
// =============================
do
{
    // Corps de la boucle : ce code s'exécutera au moins une fois
}
while (condition);
```

**Validation de données**

On demande à l'utilisateur de saisir des données valides, et répéter jusqu'a ce qu'elle soit correct : 

```java
String password;
do
{
    System.out.print("Saisissez un nouveau mot de passe (au moins 6 caractères) : ");
    password = console.nextLine();
}
while (password.length() < 6);

System.out.println("Mot de passe accepté !");
```

**Menu d'application console** 

On peut utiliser ce type de boucle pour afficher le menu dans une application CLI. On attends une commande et on quitte que sur une commande spécifique

```java 
String command;
do
{
    System.out.println("Menu :");
    System.out.println("1. Afficher un message de bienvenue");
    System.out.println("2. Quitter");
    System.out.print("Choisissez une action : ");
    command = console.nextLine();

    if (command.equals("1"))
    {
        System.out.println("Bonjour, monde !");
    }
    else if (!command.equals("2"))
    {
        System.out.println("Commande inconnue.");
    }
}
while (!command.equals("2"));

System.out.println("Au revoir !");
```

---

## Boucle `for`

Permet de répéter une action un nombre de fois définie. 

```java 
// =============================
// syntaxe 
// =============================
for (initialisation; condition; mise à jour)
{
    // Corps de la boucle
}

// ================================
// compteur 
// ================================
for (int i = 0; i < 10; i++)
{
    System.out.println("Salut !");
}

// ===============================
// afficher les nombres de 1 à 5 
// ===============================
for (int i = 1; i <= 5; i++)
{
    System.out.println(i);
}

// ================================
// compte à rebours 
// ================================
for (int i = 5; i > 0; i--)
{
    System.out.println(i);
}
System.out.println("C'est parti !");

// =================================
// pas de boucle de 2 
// =================================
for (int i = 0; i <= 10; i += 2)
{
    System.out.println(i);
}
// Affichera : 0 2 4 6 8 10
```

### Plusieurs variables dans la boucle 

Il peut être utile de suivre deux variables à la fois.

```java 

// ===============================
// suivre deux nombres 
// ===============================
for (int left = 1, right = 10; left <= 10; left++, right--)
{
    System.out.println(left + "  " + right);
}
```

### Boucle `for` infinie 

```java 
for (;;) // ni initialisation, ni condition, ni mise à jour
{
    System.out.println("Travailler, travailler et encore travailler !");
}
```

---

## Opérateur `break`

L'opérateur permet de sortir immédiatement d'une boucle. L'exécution reprends à la première ligne après la boucle.

```java
// ========================
// syntaxe 
// ========================
while (condition)
{
    if (kakoe-to_condition)
    {
        break;
    }
    // le reste du code de la boucle
}
```

### Utilisation  

#### Test de primalité d'un nombre 

Un nombre premier n'est divisible que par 1 et par lui même.  

```java 
int number = 111;
boolean found = false;
for (int i = 2; i < number; i++)
{
    if (number % i == 0)
    {
        found = true;
        System.out.println("Diviseur trouvé " + i );
        break; // On arrête la boucle, il n'y a plus rien à chercher !
    }
}

if (!found)
{
    System.out.println("Aucun diviseur trouvé - le nombre est premier.");
}
```

#### Validation de saisie utilisateur 

Questionnaire intéractif de collecte de données 

```java 
while (true)
{
    System.out.print("Entrez votre âge: ");

    if (console.hasNextInt())
    {
        int age = console.nextInt();
        if (age > 0)
        {
            System.out.println("Parfait! Votre âge: " + age);
            break; // données valides - on sort
        }
        else
        {
            System.out.println("Erreur! Entrez un âge positif.");
        }
    }
    else
    {
        System.out.println("Erreur! Entrez un nombre.");
        console.nextLine(); // on consomme la saisie incorrecte
    }
}
```

---

## Opérateur `continue`

L'opérateur ne termine pas la boucle. Il permet de passer à l'itération suivante.

```java 
// ========================
// syntaxe 
// ========================
for (int i = 0; i < 10; i++)
{
    if (condition)
    {
        continue;
    }
    // cette partie ne s'exécute que si continue ne s'est pas déclenché
}
```

### Utilisation 

#### Sauter les nombres pairs 

```java 
for (int i = 1; i <= 10; i++)
{
    if (i % 2 == 0)
    {
        continue; // si le nombre est pair - on saute tout ce qui suit !
    }
    System.out.println("Nombre impair: " + i);
}
```

---

## Boucles imbriquées

Une boucle extérieur commence une itération, dans cette boucle, une boucle interne se déclenche et réalise l'ensemble de ses itération. Lorsque celle ci à terminer, la boucle extérieur viens réaliser son itération, la boucle interne relances l'ensemble de ses itérations.

```java
// ===========================
// syntaxe 
// ===========================
// Boucle externe for
for (int i = 0; i < 3; i++)
{
    for (int j = 0; j < 4; j++)  // Boucle interne for
    {
        System.out.print(i + "," + j + " ");
    }
    System.out.println(); // Saut de ligne après la boucle interne
}

/* 
Sortie: 
0,0 0,1 0,2 0,3
1,0 1,1 1,2 1,3
2,0 2,1 2,2 2,3
*/

// ================================
// version avec while 
// ================================
int i = 0;
while (i < 3)
{
    int j = 0;
    while (j < 4)
    {
        System.out.print(i + "," + j + " ");
        j++;
    }
    System.out.println();
    i++;
}
```

### `break` et `continue` dans les boucles imbriqués 

En cas d'utilisation d'un de ses opéateurs dans une boucle interne, ils n'affecteront que celle ci 

```java
// ===========================
// sortie anticipée boucle interne 
// ===========================
for (int i = 0; i < 3; i++)
{
    for (int j = 0; j < 5; j++)
    {
        if (j == 3)
            break; // on sort uniquement de la boucle interne !
        System.out.print(i + "," + j + " ");
    }
    System.out.println();
}
```

### Utilisation 

#### Afficher un échiquier 

```java 
for (int row = 0; row < 8; row++)
{
    for (int col = 0; col < 8; col++)
    {
        // Si la somme des indices ligne + colonne est paire — la case est blanche, sinon noire
        if ((row + col) % 2 == 0)
            System.out.print("_");
        else
            System.out.print("#");
    }
    System.out.println(); // Retour à la ligne après chaque rangée
}
```

#### Table de multiplication 

```java 
for (int i = 1; i <= 9; i++)
{
    for (int j = 1; j <= 9; j++)
    {
        System.out.print(i * j + "\t");
    }
    System.out.println();
}
```
