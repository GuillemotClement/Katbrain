---
date: 2026-06-15T16:45:36+02:00
---
# Champs

Variable déclaré dans une classe, mais en dehors des méthodes.

Les champs garantissent qu'un objet possède son propre état.

## Déclaration d'un champ 

```java
public class Person {
    private String name;
    private int age;
}
```

---

## Champs statique 

Un champ statique n'appartient pas à un objet mais à la clases. Sa valeur n'existe que dans un seul exemplaire pour tous les objets de la classe.

### Initialisation 

La manière courante d'initialiser un champ static est de lui affecter directement une valeur lors de sa déclaration.

Le champ sera initialiser lors du premier chargement de la classe `User` en mémoire.

```java
public class User {
    private static int userCount = 0; // initialisation ici même

    // ... reste du code
}
```

### Initialisation dans un bloc statique 

Parfois, une logique d'initialisation plus complexe est nécessaire. Par exemple, charger des donnée depuis un fichier, ou effectuer des calculs. Dans ce cas, on utilise un **bloc d'initialisation statique**

Le blox statique sera exécuté :
- lors du premier accès à la classe (création du premier objet, ou appel à n'importe quelle méthode/variable statique de la classe)
- s'exécute une seule fois pour chaque classe

```java
public class Config {
    public static String configPath;

    static {
        // Ce bloc s’exécutera UNE seule fois au chargement de la classe
        configPath = System.getenv("APP_CONFIG_PATH");
        if (configPath == null) {
            configPath = "/etc/app/default.conf";
        }
        System.out.println("Config path initialisé: " + configPath);
    }
}
```

### Accés aux champs statique 

On accéde aux champs statique en utilisant le nom de la classe.

```java
User u1 = new User();
User u2 = new User();
System.out.println(User.userCount); // correct
System.out.println(u1.userCount);   // fonctionne, mais déconseillé !
```

---

## Champs final 

`final` ert un modificateur qui signifie "Ce champ me peut être affecté qu'une seule fois, et ensuite il ne change plus". Après initialisation, la valeur du champ devient immuable: pour un objet c'est sa propriété fixe, et pour une classe (si le champ est statique), une constante partagée

On l'utilise:
- des constante (par exemple `PI`)
- des identifiants unique d'un objet, qui ne peut pas être modifié après sa création 

### Exigence d'initialisation des champs final 

Chaque champs `final` doit obligatoirement être initialisé soit lors de la déclaration, soit dans chacun des constructeurs de classe.

**Initialisation lors de la đéclaration**
```java
public class Circle {
    public static final double PI = 3.1415926535; // constante de classe
    private final String id = "CIRCLE";           // constante d’objet
}
```

**Initialisation dans le constructeur**

Parfois, la valeur du champ `final` n'est connue qu'au moment de la création de l'objet 

Si la classe à plusieurs constructeurs, le champ `final` doit être initalisé dans chacun d'eux.

```java
public class User {
    private final int id;

    public User(int id) {
        this.id = id; // affectation du champ final dans le constructeur
    }
}
```

---

## Combinaison `static` et `final`: Déclaration de constante de classe

On rencontre souvent le trio `public static final`. En Java, on déclare de cette manière les constantes d'une classe. Des valeurs đéfinie une fois pour toutes et qui ne changent pas pendant l'exécution du programme. Ces constantes appartiennent à la classe entière et sont identiques pour tous ses objets.

Le nom des constante s'écrit en MAJUSUCLE.

```java
public class MathUtils {
    public static final double PI = 3.1415926535;
    public static final String APP_NAME = "MyApp";
}
```

- `public`: accessible de partout 
- `static`: appartient à la classe entière
- `final`: ne peut pas être modifié après initialisation

```java
double area = MathUtils.PI * r * r;
System.out.println(MathUtils.APP_NAME);
```

---

## Exemple 

### Classe simple avec une constante 

```java
public class Constants {
    public static final int DAYS_IN_WEEK = 7;
    public static final String COMPANY = "SARL Camomille";
}
```

### Champ statique initialisé dans un bloc statique 

```java
public class AppConfig {
    public static final String DEFAULT_PATH;

    static {
        // On peut exécuter une logique complexe
        String env = System.getenv("APP_PATH");
        if (env != null) {
            DEFAULT_PATH = env;
        } else {
            DEFAULT_PATH = "/usr/local/app";
        }
    }
}
```

### Champ final d'objet, initialiser dans le constructeur 

```java
public class User {
    private static int nextId = 1;
    private final int id;
    private String name;

    public User(String name) {
        this.id = nextId++;
        this.name = name;
    }

    public int getId() {
        return id;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
}
```

Utilisation 

```java
User u1 = new User("Ivan");
User u2 = new User("Maria");
System.out.println(u1.getId()); // 1
System.out.println(u2.getId()); // 2
```

### Erreur lors d'une mauvaise initialisation d'un champ final 

```java
public class BadExample {
    private final int number;

    public BadExample() {
        // number non initialisé !
    }
}
// Erreur de compilation: variable number might not have been initialized
```

---

## Bonne pratique 

**Utiliser `public static final` uniquement pour de vrai constante**

Si la valeur peut changer, ne pas déclarer en `final`. Les constantes doivent être réellement immuables.

```java
public static final int MAX_USERS = 1000; // bien
public static final String[] USERS = new String[100]; // mal !
```

Bien que `USERS` ne change pas, le contenu du tableau peut être modifié. 

**Utiliser des bloc statique pour des initialisations complexe**

Si une constante ne peut pas être exprimée par une simple affectation (un calcul, une lecture de fichier), utiliser un bloc statique

**Abuser de champs statique**

Les champs statique sont des variables globales. Cela peut entrainer des bug difficile a traquer et un code difficile a maintenir.

**Ne rendez pas des objets mutables `public static final`

Si un objet est mutable, ne pas le rendre public et final. Cela ouvre l'acces à son contenu interne à tous le monde.