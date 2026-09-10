---
date: 2026-06-14T18:35:51+02:00
---

# Exception

Une exception est un objet créer au moment où un problème survient pendant l'exécution du programme. L'exception indique que quelque chose s'est mal passé.

- Division par zéro
- Tentative d'accès à un élément du tableau inexistant
- Ouverture de fichier qui n'existe pas sur le disque
- Conversion impossible.

Les exceptions permettent :

- Code clair: la logique principale du programme n'est pas encombrée de vérification constantes pour chaque détails
- Flexibilité: il est possible de gérer les erreurs de manière centralisée (par exemple, toutes les erreurs de lecture de fichiers dans un seul endroit)
- Fiabilité: le programme ne plante pas avec un message mystérieux, il indique ce qu'il s'est passé

## `Exceptions` & `Errors`

En Java, il existe deux types de problèmes susceptibles de survenir pendant l'exécution d'un programme.

**Errors**

Problèmes fatals et irrécupérables dus à des défaillances de la JVM. Généralement liées aux ressources de l'ordinateur ou des pannes internes de la JVM.

- `OutOfMemoryError`: mémoire épuisée
- `StackOverflowError`: débordement de pile

On ne vient pas gérer ce type d'erreurs.

**Exceptions**
Problèmes que le programme doit gérer. Elle surviennent en cas d'erreur logique du programme, ou de facteurs externes (saisis incorrect).

- `NullPointerException`: tentative d'utiliser `null` comme un objet
- `ArrayIndexOutOfBoundsException`: dépassement de limite du tableau
- `IOException`: erreur lors du travail avec des fichiers

Il existe deux types d'exceptions :

- **Checked exceptions**: le compilateur exige qu'elles soient gérées
- **Unchecked exceptions**: le compilateur n'exige pas leur gestion

---

## `try-catch`

Le bloc `try-catch` permet d'attraper une exception et d'éviter le crash du programme en gérant proprement l'erreur.

Si une exception se produit dans le bloc `try`, l'exécution du bloc est interrompue, et le contrôle passe au premier bloc `catch` approprié.
S'il n'y a pas de d'exception, le bloc `catch` est ignoré.

```java
// DIVISION PAR ZERO
int a = 10;
int b = 0;

try
{
    int result = a / b; // Une exception peut survenir ici
    System.out.println("Résultat : " + result);
}
catch (ArithmeticException e)
{
    System.out.println("Erreur : division par zéro impossible !");
}

System.out.println("Le programme a poursuivi son exécution.");
```

### Bloc catch

Dans le bloc `catch`, on passe le type d'exception, par exemple `ArithmeticException`, et le nom de la variable, généralement `e`. On peut obtenir `e.getMessage()` pour obtenir une description courte de l'erreur, `e.printStackTrace()` pour obtenir les informations détaillées.

```java
try
{
    int[] arr = new int[2];
    int x = arr[10]; // Erreur : index inexistant
}
catch (ArrayIndexOutOfBoundsException e)
{
    System.out.println("Erreur : " + e.getMessage()); // On affiche le message d’erreur
    e.printStackTrace();                             // On imprime dans la console toutes les informations sur l’erreur
}
```

---

## `finally`

Lorsque l'on travail avec des ressources (fichiers, connexions, base de données), il est important qu'elles soient fermées ou libérées, même si une erreur survient pendant l'exécution.

Le bloc `finally` fait partie du bloc `try-catch`. Le code s'exécute toujours, qu'il y est une exceptions ou non.

```java
try {
    System.out.println("Début de l'exécution");
    int result = 10 / 0; // une erreur va se produire ici
    System.out.println("Résultat: " + result);
} catch (ArithmeticException e) {
    System.out.println("Erreur: division par zéro");
} finally {
    System.out.println("Ce code s'exécutera dans tous les cas");
}
```

On peut trouver une version avec uniquement le `try` et le `finally` pour gérer les fermetures de fichiers, les connexions réseaux, et bases de données, la libération des ressources, et la journalisartion

```java
try {
    System.out.println("On divise des nombres");
    int result = 10 / 0;   // erreur !
    System.out.println("Résultat: " + result);
} finally {
    System.out.println("Le bloc finally a été exécuté");
}
```

`finally` ne s'exécute pas dans ces cas :

- le programme à été terminé de force avec `System.exit(0)`
- le thread dans lequel s'exécute `finally`a été tué de force
- l'ordinateur à été éteint

---

## `throw`: générer une exception

L'opérateur `throw` permet de signaler de manière explicite une erreur.

On utilise cette syntaxe : `throw new ExceptionType("Message d'erreur");`

- `ExceptionType`: toute classe dérivant de `Throwable` (généralement `Exception`ou `RuntimeException`). Entre parenthèses, un message qui aide à comprendre ce qui à provoquer l'erreur.

Les exceptions sont des objets issus d'une hiérarchie de classes [doc](https://docs.oracle.com/en/java/javase/21/docs/api/java.base/java/lang/package-summary.html)

Validation des arguments d'une méthode

```java
public static int safeDivide(int a, int b) {
    if (b == 0) {
      // classe issue de la doc 
        throw new IllegalArgumentException("Le diviseur ne peut pas être égal à zéro");
    }
    return a / b;
}
```

Utilisation:

```java
public static void main(String[] args) {
    try {
        int result = safeDivide(10, 0); // cela provoque l'exception, on passe dans le bloc true 
        System.out.println("Résultat: " + result);
    } catch (IllegalArgumentException e) { // on viens utiliser la classe définie dans le throw
        System.out.println("Erreur: " + e.getMessage()); // on affiche alors le message d'erreur définis dans le throw
    }
}
```

On vient utiliser `throw`: 

- pour valider des arguments d'une méthode 
- vérifier l'état d'un objet 
- dans un `catch` si on souhaite relancer l'exception plus loins.

### Combiner `try-catch-finally` et `throw`

Parfois, on intercepte une erreur, puis on décide d'en lever une autres, plus informative:

```java
public static int parseAndDivide(String text, int divisor) {
  try {
      int number = Integer.parseInt(text);
      if (divisor == 0) {
        // lance une exception
          throw new IllegalArgumentException("Le diviseur ne peut pas être égal à zéro");
      }
      return number / divisor;
  } catch (NumberFormatException e) {
      // ajout d'un contexte dans l'exception 
      throw new IllegalArgumentException("La chaîne '" + text + "' n'est pas un nombre");
  } finally {
      // affichage pour les logs 
      System.out.println("Tentative de traiter la chaîne: " + text);
  }
}

// UTILISATION =======================
try {
    int result = parseAndDivide("42a", 2);
    System.out.println("Résultat: " + result);
} catch (IllegalArgumentException e) {
    System.out.println("Erreur: " + e.getMessage());
}
```

---

## `throws`: Propagation d'exceptions 

En Java, il arrive souvent qu'une méthode rencontre une erreur sans savoir comment la traiter correctement. Par exemple, une méthode lit un fichier, mais ne sais pas quoi faire si le fichier est absent. 

Dans le cas, la méthode peut **transférer la responsabilité** à l'appellant, c'est à dire le propager plus loin dans la chaîne des appels.

**Propagation d'exception**: c'est un mécanisme permettant à une méthode de ne pas gérer l'erreur elle-même, mais d'informer le code appelant: "j'ai un problème, débrouille toi".

En Java, la propagation des exceptions se fait avec le mot clé `thows` dans la déclaration de la méthode.

```java 
returnType methodName(...) throws ExceptionType
{
    // code de la méthode
}
```

Après `thorws`, on indique le type d'exception susceptible de se produire dans la méthode. 

```java
public void readFile(String filename) throws FileNotFoundException
{
    FileReader reader = new FileReader(filename); // peut lever FileNotFoundException
    // ...
}
```

La méthode `readFile` ne gère pas l'erreur elle-même, mais indique: Je peux lever `FileNotFoundException` - que celui qui m'apelle décide quoi faire.

### Traitement des exceptions `throws`

Si on appele une méthode déclarée avec `throws`, on dispose de deux options: 
- Gérer l'exception avec un `try-catch`
- Propager l'exception plus loin, en ajoutant un nouveau `throws` dans la méthode 

**Gestion avec `try-catch`**

L'exception est intercepter, et on décide quoi faire directement.

```java
public static void main(String[] args)
{
    try
    {
        // appel de la fonction pouvant throws 
        readFile("data.txt");
    }
    catch (FileNotFoundException e)
    {
      // si l'exception est lever, on gère directmenet 
        System.out.println("Fichier introuvable : " + e.getMessage());
    }
}
```

**Propagation**

La responsabilité du traitement de l'erreur incombe maintenant à celui qui appelera `main`, généralement la JVM, si l'erreur n'est pas traitée, le programme termine avec un message d'erreur.

```java
public static void main(String[] args) throws FileNotFoundException
{
    readFile("data.txt");
}
```

### Exemple: lecture d'un fichier avec propagation d'exception 

```java
import java.io.*;

public class FileDemo
{
    // La méthode déclare qu’elle peut lever IOException
    // la méthode se contente de propager l'exception.
    public static void printFirstLine(String filename) throws IOException
    {
        BufferedReader reader = new BufferedReader(new FileReader(filename));
        String line = reader.readLine();
        System.out.println("Première ligne : " + line);
        reader.close();
    }

    public static void main(String[] args)
    {
        try
        { 
            // on gère le cas où une exception est levé dans la méthode
            printFirstLine("nofile.txt");
        }
        catch (IOException e)
        {
            System.out.println("Erreur lors de la lecture du fichier : " + e.getMessage());
        }
    }
}
```

### Bonne pratique 

**Quand et pourquoi utiliser la propagation des exceptions**

- Quand une méthode ne peut pas ou ne doit pas décider comment gérer l'erreur (code de blibliothèque)
- quand le traitement de l'erreur dépend du contexte (dans un cas, on termine le programme, dans l'autre on essaie un autre fichier)
- pour ne pas encombrer le code de `try-catch` inutiles.

On propage les exceptions lorsque l'on ne peut pas les traiter de mmanière pertinente.

### Propagation multiple 

Il est possible de propager plusieurs exceptions 

```java
public void process() throws IOException, SQLException
{
    // ...
}
```

---

## Stack Trace 

La **Stack Trace** c'est la liste des méthodes qui ont été apelées dans le programme jusqu'au moment où l'erreur s'est produite. Lorsqu'une exception survient, Java affiche automatiquement la trace de pile à l'écran. 

```shell
Exception in thread "main" java.lang.ArithmeticException: / by zero
    at Main.divide(Main.java:10)
    at Main.main(Main.java:5)
```

- `Exception in thread "main"`: indique le thread où l'erreur s'est produit 
- `java.lang.ArithmeticException: / by zero`: le type d'exception et son message 
- `at Main.divide(Main.java:10) `: la méthode `divide` dans la classe `Main`, ligne 10 => la où l'erreur s'est produit
- `at Main.main(Main.java:5)`: la méthode `main` dans la classe `Main`, ligne `5` => indique qui à appeler la méthode 

Chaque ligne `at...` est une étape dans la Stack Trace. La ligne la plus haute est l'endroit où l'erreur s'est produite. En dessous, se trouve les méthodes qui ont appelé cette méthode, et ainsi de suite jusqu'au tout début du programme.