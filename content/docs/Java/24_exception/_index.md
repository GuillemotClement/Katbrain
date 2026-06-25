# Gestion avancée des exceptions

## Classe `Throwable`

En Java, toutes les exceptions et erreurs sont des objets qui héritent de la classe `Throwable`.

`Throwable` est la classe de base pour tout ce qui peut être `throw` et `catch`. On ne l'utilise pas directement, il sert de base pour des types d'erreurs plus concrets.

```
Throwable
├── Exception
└── Error
```

### `Exception` - erreur normales

`Exception` est la classe de base pour toutes les opérations susceptibles de se produire dans un programme et qu'il faut et qu'on doit traiter.
Ce sont les erreurs opérationnelles: problèmes de fichiers, réseau, E/S, erreurs utilisateur.

La pluparts des `try/catch` travaille avec des sous classe `Exception`. Exemple:

- `IOException`: erreur lors de la manipulation de fichier ou du réseau
- `SQLException`: erreur lors de l'accés à la base de données
- `FileNotFoundException`: fichiers introuvable

### `Error` - erreurs fatales de la JVM

`Error` est la classe de base des erreurs qui se produisent au niveau de la JVM. Ce sont généralement des défaillance critiques que le programme ne peut ni ne doit traiter. Si une `Error` survient, l'application ne pourra probablement pas continuer à s'exécuter. Exemple:

- `OutOfMemoryError`: mémoire insuffisante
- `StackOverflowError`: dépassement de pile
- `NoClassDefFoundError`: classe requise introuvable

### Exceptions vérifiées et non vérifiées

En Java, les exceptions se répartissent en deux grandes catégories

#### Exceptions vérifiées (Checked)

Ce sont des exceptions que le compilateur oblige à traiter ou à relancer explicitement. Elles sont généralement liées à des ressources externes: fichiers, réseau, bases de données, saisie utilisateur.

Il faut les traiter avec un `try/catch`, soit ajouter un `throws` à la signature de la méthode

```java
public void readFile(String path) throws IOException {
    FileReader reader = new FileReader(path); // peut lancer IOException
    // ...
}
```

#### Exceptions non vérifiées (Unchecked)

Ce sont des exceptions qui ne nécessient pas de traitement obligatoire par le compilateur. Il s'agit généralement d'erreur de logique de programme: division par zéro, dépassement des limites d'un tableau, accès à null

On peut les intercepter, mais ce n'est pas obligatoire. Il vaut mieux les prévenir grâce à des vérifications.

```java
int[] arr = {1, 2, 3};
System.out.println(arr[10]); // ArrayIndexOutOfBoundsException
```

### Pattern

#### Exception vérifiée: exemple avec des fichiers

Le compilateur oblige à traiter des `IOException`

```java
import java.io.*;

public class FileDemo {
    public static void main(String[] args) {
        try {
            FileReader reader = new FileReader("nofile.txt"); // FileNotFoundException (checked)
            int data = reader.read();
            System.out.println(data);
            reader.close();
        } catch (IOException e) {
            System.out.println("Erreur lors de la manipulation du fichier : " + e.getMessage());
        }
    }
}
```

#### Exception non vérifiée: exemple de division par zéro

Le compilateur ne demande aucun traitement, mais le programme "plante"

```java
public class ExceptionDemo {
    public static void main(String[] args) {
        int a = 10;
        int b = 0;
        int c = a / b; // ArithmeticException (unchecked)
        System.out.println("Résultat : " + c);
    }
}
```

### Hiérarchie des exceptions

La hiérarchie des exceptions permet :

- **Souplesse du traitement**: on peut intercepter des erreurs spécifiques `FileNotFoundException`, comme des groupes entiers `IOException` ou `Exception`
- **Réutilisation du code**: possibilité de traiter de façon centralisées les erreurs d'un même type
- **Propreté du code**: la logique principale n'est pas encombrtée de vérification pour chaque détail

```java
try {
    // code risqué
} catch (FileNotFoundException e) {
    System.out.println("Fichier introuvable !");
} catch (IOException e) {
    System.out.println("Erreur d’entrée/sortie !");
} catch (Exception e) {
    System.out.println("Quelque chose s’est mal passé : " + e.getMessage());
}
```

---

## Création d'exceptions personnalisées

Java fournis des exceptions comme `NullPointerException`, `IllegalArgumentException`, `IOExceptio`, mais il arrive que ces exceptions ne soit pas suffisament précise.

Les exceptions personnalisées sont une personnalisation pertinente de l'application. Elles permettent d'affiner la gestion des problémes, et via leur nom, indiquent immédiatement ce qui s'est passé.

### Créer une nouvelle exception

On vient créer une classe qui hérite de l'une des classes d'exception standard :

- `Exception`: pour les exception checked. Lorsque l'erreur est attendue et peut être géré (erreur de validation, fichier manquant)
- `RuntimeException`: pour les unchecked. Si l'erreur est lié à un bug dans la logique du programme (division par zéro, violation d'un invariant)

```java
// checked
public class InvalidCredentialsException extends Exception {
    public InvalidCredentialsException(String message) {
        super(message); // On transmet le message à la classe parente
    }
}

// utilisation
if (!login.equals("admin") || !password.equals("1234")) {
    throw new InvalidCredentialsException("Identifiant ou mot de passe incorrect");
}

// ============================
// unchecked
public class NegativeBalanceException extends RuntimeException {
    public NegativeBalanceException(String message) {
        super(message);
    }
}
```

### Constructeurs: render l'exception informative

Généralement, on implémente au moins un constructeur avec le paramètres `String message`. Mais on ajoute souvent d'autre :

```java
public class ScoreLimitExceededException extends Exception {
    public ScoreLimitExceededException() {
        super();
    }
    public ScoreLimitExceededException(String message) {
        super(message);
    }
    public ScoreLimitExceededException(String message, Throwable cause) {
        super(message, cause);
    }
    public ScoreLimitExceededException(Throwable cause) {
        super(cause);
    }
}
```

- `message`: description textuelle de l'erreur 
- `cause`: la cause (une autre exception), si on souhaite envelopper une erreur 

### Utilisation des exceptions personnalisées dans le code 

On as un utilisateur, il a des points, et on ne peut pas en ajouter plus de `100`

```java
public class User {
    private String name;
    private int score;

    public User(String name) {
        this.name = name;
        this.score = 0;
    }

    public void addScore(int points) throws ScoreLimitExceededException {
        if (score + points > 100) {
            throw new ScoreLimitExceededException("Limite de points dépassée ! Tentative d'ajout : " + points);
        }
        this.score += points;
    }
}
```

Classe d'exception

```java
public class ScoreLimitExceededException extends Exception {
    public ScoreLimitExceededException(String message) {
        super(message);
    }
}
```

Traitement 

```java
try {
    user.addScore(60);
    user.addScore(50); // Une exception sera lancée ici ! Erreur: Limite de points dépassée ! Tentative d'ajout : 50
} catch (ScoreLimitExceededException e) {
    System.out.println("Erreur: " + e.getMessage());
}
```

### Ajouter des champs personnalisées aux exception 

Il est possible d'ajouter des champs supplémentaires qui aide à traiter l'erreur 

```java
public class ScoreLimitExceededException extends Exception {
    private int currentScore;
    private int attemptedAdd;

    public ScoreLimitExceededException(String message, int currentScore, int attemptedAdd) {
        super(message);
        this.currentScore = currentScore;
        this.attemptedAdd = attemptedAdd;
    }

    public int getCurrentScore() {
        return currentScore;
    }
    public int getAttemptedAdd() {
        return attemptedAdd;
    }
}
```

Utilisation 

```java
if (score + points > 100) {
    throw new ScoreLimitExceededException(
        "Limite de points dépassée !",
        this.score,
        points
    );
}
```

### Bonne pratique 

**Nommage des exceptions**
En Java, il est d'usage de nommer les exceptions utilisateur avec le suffixe `Exception`: `InvalidUserInputException`, `InsufficientFundsException`, ...

**Où et quand utiliser ses exceptions**
- Lors de la validation des données utilisateurs
- En cas de violation de règles métier
- En cas d'erreur lors de l'appel de services externe

---

## Chaînage d'exceptions 

Le chaînage d'exception permet de ne pas perdre d'information sur la cause première de l'erreur, même si on envelopper une exception dans une autre.

Dans une application, il arrive souvent qu'une erreur se produise profondement dans la piste d'appels, par exemple, lors de l'utilisation d'une base de donnée, du systeme de fichiers ou du réseau.
Par exemple, une méthode qui interegose la base de données et peut lever une `SQLException`. Mais au niveau de la logique métier, on ne veut pas encombrer le code avec des détails techniques, et on préfère lever une exception, par exemple `UserManagementException`.

```java
try {
    // quelque chose avec la base de données
} catch (SQLException e) {
    throw new UserManagementException("Erreur lors de la gestion des utilisateurs");
}
```

Dans ce cas, l'information sur ce qui s'est précismenet produire dans la base de données et la pile d'appel est perdue. Dans le log, on obtient alors que `UserManagementException` sans connaitre la cause.

### Envelopper l'exception d'origine (chaining)

Java permet d'envelopper une exception dans une autre en passant l'exception d'origine comme cause `cause` qu constructeur de la nouvelle exception. C'est le **chaînage d'exception**

La plupart des exceptions standard ou personnalisé possède un constructeur acceptant un second paramètre - `Throwable cause`

```java
public UserManagementException(String message, Throwable cause) {
    super(message, cause);
}
```

Utilisation 

```java
try {
    // quelque chose avec la base de données
} catch (SQLException e) {
    throw new UserManagementException("Erreur lors de la gestion des utilisateurs", e);
}
```

De cette manière, dans la stack trace, on voit à la fois l'exception et toute la chaîne jusqu'a la cause première.

### Obtenir la cause d'une exception - `getCause()`

Tout objet de type `Throwable` possède une méthode `getCause()` qui renvoie l'expression d'origine ou `null` si elle n'existe pas.

```java
try {
    // ...
} catch (UserManagementException e) {
    Throwable cause = e.getCause();
    if (cause != null) {
        System.out.println("Cause racine : " + cause);
    }
    e.printStackTrace();
}
```

Cela permet: 
- Pour le débogage: on voit seulement ce qui s'est mal passé au niveau supérieur, mais aussi où exactement l'erreur s'est produite dans la profondeur de la pile
- Pour la journalisation: on peut consigner toutes la chaîne d'erreur dans les journaux
- Pour transmettre l'information entre les couches de l'application: la couche métier peut envelopper une exception technique dans la sienne sans perdre de détails 

### Exemple: chaînage d'exception dans une application 

On as une méthode qui charge un utilisateur à partir de la base de donnée 

```java
public User loadUser(String username) throws UserManagementException {
    try {
        // Code pouvant lever SQLException
        // ...
    } catch (SQLException e) {
        throw new UserManagementException("Échec du chargement de l’utilisateur : " + username, e);
    }
}

public class UserManagementException extends Exception {
    public UserManagementException(String message, Throwable cause) {
        super(message, cause);
    }
}
```

En cas d'erreur:
- Dans les journeaux, on voit à la fois l'exception `SQLException` d'origine avec tous les détails 
- Si nécessairem on peut accéder à la cause premiére via `getCause()`

### Pratique: implémentation du chaînage d'exceptions 

**Etape 1: création de l'exception** 

```java
public class UserManagementException extends Exception {
    public UserManagementException(String message) {
        super(message);
    }
    public UserManagementException(String message, Throwable cause) {
        super(message, cause);
    }
}
```

**Etape 2: Utiliser le chaînage** 

```java
try {
    // quelque chose de risqué
} catch (SQLException e) {
    throw new UserManagementException("Erreur lors des opérations sur la base de données", e);
}
```

**Etape 3: Traitement au niveau le plus haut** 
Au niveau le plus haut du programme, on interce notre exception et affichons une message d'erreur ainsi que toute la chaîne des cause 

```java
public class Main {
    public static void main(String[] args) {
        try {
            runUserManagement();
        } catch (UserManagementException e) {
            System.err.println("Une erreur s’est produite : " + e.getMessage());
            // Nous affichons la chaîne des causes
            Throwable cause = e.getCause();
            while (cause != null) {
                System.err.println("Cause : " + cause.getMessage());
                cause = cause.getCause();
            }
        }
    }

    private static void runUserManagement() throws UserManagementException {
        try {
            // simulation d’une erreur de base de données
            throw new SQLException("Aucune connexion à la base de données");
        } catch (SQLException e) {
            throw new UserManagementException("Erreur lors des opérations sur la base de données", e);
        }
    }
}
```


---

## Gestion avancée des exceptions et bonnes pratiques 

### `catch` multiple: gestion de différentes exceptions

Dans un programme, un bloc de code peut lever différentes types d'exceptions. Par exemple, lors de la lecture d'un fichier, on peut obtenir un `FileNotFoundException`, un `IOException`, et lors de l'analyse des données, un `NumberFormatException`.
Pour traiter correcte;ent chaque situation, Java permet d'enchaîne plusieurs bloc `catch`

```java
try {
    // opérations dangereuses
} catch (FileNotFoundException e) {
    System.out.println("Fichier introuvable : " + e.getMessage());
} catch (IOException e) {
    System.out.println("Erreur d’entrée/sortie : " + e.getMessage());
} catch (NumberFormatException e) {
    System.out.println("Format de nombre incorrect : " + e.getMessage());
}
```

Les blocs `catch` doivent aller du plus spécifique au plus général.

### `catch` avec plusieurs types (multi-catch)

Parfois des exceptions différentes nécessitent le même traitement. Par exemple, on souhaite simplement afficher un message d'erreur ou la consigner dans les logs, qu'ils s'agissent d'une erreur de lecture de fichiers ou de conversion de nombre

```java
try {
    // opération dangereuse
} catch (IOException | NumberFormatException e) {
    System.out.println("Erreur lors du traitement du fichier ou du nombre : " + e.getMessage());
}
```

- `e` aura le type de la superclasse commune la plus générale, généralement `Exception`
- dans le bloc, il est impossible d'assigner une nouvelle valeur à la variable `e`, elle est automatiquement considérée comme `final`

```java
try {
    BufferedReader reader = new BufferedReader(new FileReader("numbers.txt"));
    String line = reader.readLine();
    int number = Integer.parseInt(line);
    System.out.println("Nombre : " + number);
    reader.close();
} catch (IOException | NumberFormatException e) {
    System.out.println("Erreur : " + e.getMessage());
}
```

---

## Exceptions comme partie de l'API et try-with-ressources

### Exception comme partie de l'API

Lorsque l'on écrit une méthode. on définit les paramètres et la valeur de retour mais également quelles exceptions elle peut lever. Cela fait partie du contrat entre la méthode et ceux qui vont l'utiliser. Si une méthode peut lever une exception, tous ceux qui l'appellent doivent le savoir, afin de gérer correctement l'erreur.

```java
public void readFile(String filename) throws IOException {
    // ... lecture du fichier
}
```

Ici, on indique clairement que la méthode peut lever un `IOException`.

### `@throws` - documentation des exceptions 

L'annotation `@throws` permet de documenter les exceptions 

```java
/**
 * Lit le contenu d’un fichier.
 *
 * @param filename nom du fichier
 * @return le contenu du fichier sous forme de chaîne
 * @throws IOException si une erreur de lecture du fichier s’est produite
 */
public String readFile(String filename) throws IOException {
    // ...
}
```

### Construction `try-with`ressources`

Dans de nombreuse tâches, il faut travailler avec des ressources qu'il est impératifs de fermer après usage: fichiers, connexion réseau, bases de données. Si on oublie de fermer une ressource, on obtient une fuite mémoire, un verouillage de fichier, ou d'autres désagréments.

Avant :
```java
BufferedReader reader = null;
try {
    reader = new BufferedReader(new FileReader("data.txt"));
    String line = reader.readLine();
    // ...
} catch (IOException e) {
    // traitement de l’erreur
} finally {
    if (reader != null) {
        try {
            reader.close();
        } catch (IOException e) {
            // traitement de l’erreur lors de la fermeture
        }
    }
}
```

Avec la construction `try-withressources`, on vient fermer automatiquement toutes les ressources, même si une exception survient dans le bloc.

**Syntaxe** 
```java
try (ResourceType resource = new ResourceType(...)) {
    // travail avec la ressource
} catch (ExceptionType e) {
    // traitement de l’erreur
}
```

**Exemple**
```java
try (BufferedReader reader = new BufferedReader(new FileReader("data.txt"))) {
    String line = reader.readLine();
    System.out.println(line);
} catch (IOException e) {
    System.out.println("Erreur lors de la lecture du fichier : " + e.getMessage());
}
// reader.close() sera appelé automatiquement !
```

- Entre parenthéses après `try`, on déclare la ressources à fermer 
- A la sortie du bloc `try` (même si une exception survient), la méthode `close()` est appelée pour chaque ressource
- Cela ne fonctionne que pour les ressources qui implémentent l'interface `AutoCloseable`

**Interface `AutoCloseable`
```java
public interface AutoCloseable {
    void close() throws Exception;
}
```

Toutes les ressources standard de Java implémentent cette interface.

On peut venir déclarer plusieurs ressources 

```java
try (
    BufferedReader reader = new BufferedReader(new FileReader("input.txt"));
    BufferedWriter writer = new BufferedWriter(new FileWriter("output.txt"))
) {
    String line;
    while ((line = reader.readLine()) != null) {
        writer.write(line);
        writer.newLine();
    }
}
```

Les deux ressources seront fermées automatiquement, même si une exception survient

#### Pattern `try-with-ressources` 

**Lecture d'un fichier**
```java
public static void printFirstLine(String filename) {
    try (BufferedReader reader = new BufferedReader(new FileReader(filename))) {
        String line = reader.readLine();
        System.out.println("Première ligne : " + line);
    } catch (IOException e) {
        System.out.println("Erreur : " + e.getMessage());
    }
}
```

**Ecriture dans un fichier**
```java
public static void writeToFile(String filename, String text) {
    try (BufferedWriter writer = new BufferedWriter(new FileWriter(filename))) {
        writer.write(text);
    } catch (IOException e) {
        System.out.println("Erreur lors de l’écriture : " + e.getMessage());
    }
}
```

**Sa propre ressource**
Si on écrit sa propre classe qui doit être fermée, on implémente `AutoCloseable`
```java
public class MyResource implements AutoCloseable {
    @Override
    public void close() {
        System.out.println("Ressource fermée !");
    }
}
```

On peut maitenant l'utiliser avec `try-with-ressources`
```java
try (MyResource res = new MyResource()) {
    // travail avec la ressource
}
```