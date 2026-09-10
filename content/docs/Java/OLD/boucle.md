---
date: 2026-06-11T07:25:23+02:00
---

# Boucle

## While

Répète des instructions tant que la condition évaluée est `true`.

```java
// Boucle
int i = 1;
// évaluation de la condition
while (i <= 5)
{
    System.out.println("Étape n° " + i);
    i++; // N’oubliez pas d’incrémenter le compteur !
}
// =========================================================================
// Saisie au clavier
String password = "";
// tant le password n'est pas valide, on demande a saisir le mot de passe
while (!password.equals("qwerty"))
{
    System.out.print("Entrez le mot de passe : ");
    password = console.nextLine();
}
System.out.println("Bienvenue !");

// Boucle infinie ===========================================================
while (true)
{
    System.out.println("Je suis éternel !");
}
```

---

## Do While

Effectue une itération avant d'évaluer la condition.

```java
int count2 = 0;
do
{
    System.out.println("count2 = " + count2);
    count2--;
}
while (count2 > 0);
// Affichera "count2 = 0", même si la condition est fausse !

// ===========================================
// Validation de saisie
String password;
do
{
    System.out.print("Saisissez un nouveau mot de passe (au moins 6 caractères) : ");
    password = console.nextLine();
}
while (password.length() < 6);

System.out.println("Mot de passe accepté !");

// =========================================================
// Menu de CLI
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

## For

Permet de créer une boucle pour un nombre définis d'itération.

```java
// for basique
for (int i = 0; i < 10; i++)
{
    System.out.println("Salut !"); // affiche 10 fois le message
}

// variable multiple dans la boucle ==============================
for (int left = 1, right = 10; left <= 10; left++, right--)
{
    System.out.println(left + "  " + right);
}

// incrémente de deux =============================================
for (int i = 0; i <= 10; i += 2)
{
    System.out.println(i);
}
// Affichera : 0 2 4 6 8 10

// Boucle For infinie =============================================
for (;;) // ni initialisation, ni condition, ni mise à jour
{
    System.out.println("Travailler, travailler et encore travailler !");
}
```

---

## break

Permet de quitter immédiatemment la boucle.

```java
// test si nombre premier
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

// test saisie user
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

## continue

Permet de passer à l'itération suivante.

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

La boucle intérieur est réaliser en entier, avant d'avancer dans la boucle extérieur.

Permet de parcourir un tableau, une grille, une structure multidimensionnelle.

```java
// Boucle externe for
// +1 lorsque la boucle interne à terminer son itération 
for (int i = 0; i < 3; i++)
{
    for (int j = 0; j < 4; j++)  // Boucle interne for
    {
        System.out.print(i + "," + j + " ");
    }
    System.out.println(); // Saut de ligne après la boucle interne
}

// boucle imbriqué while
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

// ====================================================
// table de multiplication 
for (int i = 1; i <= 9; i++)
{
    for (int j = 1; j <= 9; j++)
    {
        System.out.print(i * j + "\t");
    }
    System.out.println();
}
```

### `break` et `continue` dans les boucles imbriquées

L'utilisation des opérateurs dans la boucle imbriquée n'affecte que celle ci.

```java
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