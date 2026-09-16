# Exception 

Une exception `exception` est un objet créer au moment où un problème survient pendant l'exécution du programme. Les exceptions concerne des problèmes qui apparaissent pendand l'exécution du code.

En Java, il existe deux types de problémes suceptible de survenir pendant l'exécution du programme.

## `Errors`

Problèmes fatals et irrécupérables dus à des défaillance de la JVM. Elles sont généralements liées aux ressources de l'ordinateur ou à des pannes internes de la JVM. Par exemple `OutOfMemoryError` ou `StackOverflowError`.

Généralement, on ne tente pas de gérer de tel erreurs.

---

## `Exceptions`

Ce sont les problèmes que le programme peut et doit gérer. Elle surviennent à cause d'erreurs de logique du programme ou de factuers externes. Par exemple `NullPointerException`, `ArrayIndexOutOfBoundsException`, ou `IOException`.

En Java, il existe deux types d'exceptions : 
- **Checked exceptions**: le compilateur exige qu'elles soivent gérées 
- **Unchecked exception**: le compilateur n'exige pas leur gestion.

---

## `Try-Catch`

Le bloc `try-catch` permet d'attraper une exception et d'éviter le crash du programme en gérant proprement l'erreur. Aprés le traitement de l'erreur, le programme reprend son exécution.

Tout ce qui suit l'erreur dans le bloc `try` ne sera pas exécuté en cas d'erreur.

```java 
try
{
    // Code susceptible de lancer une exception
}
catch (ExceptionType variableName)
{
    // Code pour traiter l’exception
}
```

### Pattern 

#### Division par zéro 

```java 
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

### Fonctionnement `catch`

Aprés le `catch`, dans les parenthèses, on viens indiquer le type d'exception. Par exemple `ArithmeticException` et un nom de variable, généralement `e`.

Dans le bloc, on peut ensuite obtenir :
- `e.getMessage()` : description courte de l'erreur 
- `e.printStackTrace()` : information détaillées 

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

Lorsque l'on travasil avec des ressources (fichiers, connexions réseau, base de données), il est important d'être certain qu'elles seront fermées ou libérées toujours, même si une erreur survient pendant l'exécution.

Le bloc `finally` fait partie du bloc `try-catch`. Le code placer dans `finally` s'exécute toujours, qu'il y est une exception ou non. Même si un `return` ou qu'une exception soit levée dans le `try`, le code du bloc s'exécute.

```java 
// ===========================
// syntaxe 
// ===========================
try {
    // Code susceptible de lever une exception
} catch (ExceptionType e) {
    // Traitement de l'erreur
} finally {
    // Ce code s'exécutera toujours !
}

// ==============================
// utilisation 
// ==============================
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

### `finally` sans `catch` 

Cette variante est utilisée quand la capture et le traitement de l'erreur est effectués par une méthode de niveau supérieur. Mais le bloc `finally` est nécessaire pour garantir l'exécution d'un certain code :
- Fermeture de fichier, connexion réseau, bases de données 
- Libération de toute ressource 
- Journisalisation

```java 
try {
    System.out.println("On divise des nombres");
    int result = 10 / 0;   // erreur !
    System.out.println("Résultat: " + result);
} finally {
    System.out.println("Le bloc finally a été exécuté");
}
```

---

## `throw` - générer une exception 

L'opérateur `throw` permet de générer une exception.

```java 
// =============================
// syntaxe 
// =============================
throw new ExceptionType("Message d'erreur");
```

- `ExceptionType`: toute classe dérivant de `Throwable` (généralement `Exception` ou `RuntimneException`). En argument, un message qui permet de comprendre ce qui s'est mal passé.

### Pattern 

#### Validation des arguments d'une méthode

```java 
public static int safeDivide(int a, int b) {
    // vérification des arguments passer à la fonction
    if (b == 0) {
        throw new IllegalArgumentException("Le diviseur ne peut pas être égal à zéro");
    }
    return a / b;
}

// ============================
// utilisation 
// ============================
public static void main(String[] args) {
    try {
        int result = safeDivide(10, 0); // va déclencher le throw 
        System.out.println("Résultat: " + result);
    } catch (IllegalArgumentException e) {
        // on catch l'exception levée par la méthode
        System.out.println("Erreur: " + e.getMessage());
    }
}
```

---

## Combinaison `try-catch-finally` et `throw`

Ces constructions peuvent fonctionner ensemble. Par exemple, on intercepte une erreur, puis on décide d'en lever une autre avec plus d'information 

```java
public static int parseAndDivide(String text, int divisor) {
    try {
        int number = Integer.parseInt(text);
        if (divisor == 0) {
            throw new IllegalArgumentException("Le diviseur ne peut pas être égal à zéro");
        }
        return number / divisor;
    } catch (NumberFormatException e) {
        throw new IllegalArgumentException("La chaîne '" + text + "' n'est pas un nombre");
    } finally {
        System.out.println("Tentative de traiter la chaîne: " + text);
    }
}

// ================================
// utilisation 
// ================================
try {
    int result = parseAndDivide("42a", 2);
    System.out.println("Résultat: " + result);
} catch (IllegalArgumentException e) {
    System.out.println("Erreur: " + e.getMessage());
}

/* Sortie:
Tentative de traiter la chaîne: 42a
Erreur: La chaîne '42a' n'est pas un nombre
*/
```

---

## Propagation des exceptions

Il arrive souvent qu'une méthode rencontre une erreur sans savoir comment la traiter correctement. Par exemple, une méthode lit un fichier mais ne sais pas quoi faire si le fichier est absent. Dans de tel cas, la méthode peut transférer la responsabilité à l'appelant, c'est à dire propager l'exception plus loin dans la chaîne des appels.

La **propagation d'exception** est un mécanisme permettant à une méthode de ne pas gérer l'erreur elle-même, mais d'informer le code appelant de l'exception.

On vient propager une exception :
- Quand une méthode ne peut pas ou ne doit pas décider comment gérer l'erreur -> code de librairie
- Quand le traitement dépend du contexte (dans un cas, terminer le programme, dans un autre essayer un autre fichier)
- Réduire l'encombrement dans un block `try-catch`.

### `throws`

La propagation d'exception se fait avec le mot clé `throws` dans la déclaration de la méthode. On indique après le `throws` le type d'exception susceptible de se produire dans la méthode.

```java
returnType methodName(...) throws ExceptionType
{
    // code de la méthode
}

// =========================
// exemple 
// =========================
public void readFile(String filename) throws FileNotFoundException
{
    FileReader reader = new FileReader(filename); // peut lever FileNotFoundException
    // ...
}
```

Ici, la méthode `readFile` ne gère pas l'erreur elle même, mais indique qu'elle peut lever une exception `FileNotFoundException`. L'apellant decide ensuite quoi faire en cas d'erreur.

### Gestion de propagation 

Lorsque l'on appelle une méthode déclarée avec `throws`, il existe deux options:
- Gérer l'exception avec un `try-catch`
- Propager l'excetion plus loin en ajoutant un nouveau `throws`

#### Gestion avec `try-catch`

Dans ce cas, on intercepte et on décide quoi faire.

```java 
public static void main(String[] args)
{
    try
    {
        readFile("data.txt"); // appelle de la méthode pouvant lancer l'exception
    }
    catch (FileNotFoundException e) // on catch l'exception
    {
        // action réaliser en cas d'erreur
        System.out.println("Fichier introuvable : " + e.getMessage());
    }
}
```

#### Propagation plus loin

La responsabilité du traitement de l'erreur se fait maintenant au niveau supérieur. C'est à dire, à l'appelant de la méthode.

```java 
public static void main(String[] args) throws FileNotFoundException
{
    readFile("data.txt");
}
```

#### Exemple: Lecture d'un fichier avec propagation d'exception 

La méthode `printFirstLine()` ne sais pas quoi faire en cas de ficher absent. Elle se contente de propager l'exception. Dans `main()`, on intercepte et on affiche un message.

```java 
import java.io.*;

public class FileDemo
{
    // La méthode déclare qu’elle peut lever IOException
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
            printFirstLine("nofile.txt");
        }
        catch (IOException e)
        {
            System.out.println("Erreur lors de la lecture du fichier : " + e.getMessage());
        }
    }
}
```

### Propagation multiple 

Il est possible de propager plusieurs exception d'une méthode 

```java 
public void process() throws IOException, SQLException
{
    // ...
}
```

---

## Stack Trace - pile d'appels 

La **Stack Trace** c'est la liste des méthodes appelées par le programme jusqu'au moment où l'exception se produit. Lorsqu'une erreur survient, Java affiche automatiquement la trace de pile à l'écran.

```
Exception in thread "main" java.lang.ArithmeticException: / by zero
    at Main.divide(Main.java:10)
    at Main.main(Main.java:5)
```

- **Exception in thread "main"* : indique dans quel thread s'est produite l'erreur 
- `java.lang.ArithmeticException : / zero` : type d'exception et son message 
- `at Main.divide (Main.java: 10)`: la méthode `divide` dans la classe `Main` ligne 10
- `at Main.main(Main.java:5)`: la méthode `main` dans la classe `Main` ligne 5

Chaque ligne `at ...` est une étape dans la pile d'appels. La ligne la plus haute est l'endroit où l'erreur s'est produite.
