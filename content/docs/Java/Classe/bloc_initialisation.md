---
date: 2026-06-16T11:26:45+02:00
---

# Bloc d'initialisation

Il existe deux types de blocs d'initialisation

- **Bloc d'initialisation non statique**: s'exécute à chaque création d'un nouvel objet, immédiatement après l'intialisation des champs et avant l'appel du constructeur.
- **Bloc d'initialisation statiques**: s'exécutent une seule fois lors du chargement de la classe en mémoire

## Bloc d'initialisation non statique 

Déclarer directement dans le corps de la classe. S'exécute à chaque création d'un nouvel objet, immédiatement après l'intialisation des champs et avant l'appel du constructeur.

```java
public class User {
    private String name;

    // Bloc d’initialisation non statique
    {
        System.out.println("Le bloc non statique s’exécute !");
        name = "Nom par défaut";
    }

    public User() {
        System.out.println("Le constructeur s’exécute !");
    }
}
```

## Bloc d'initialisation statique 

Se déclare avec le mot clé `static`. S'exécutent une seule fois lors du chargement de la classe en mémoire

Les blocs statique ne sont pas hérité, chaque classe dispose de son propre  bloc statique. Lors du chargement d'une classe dérivée, le bloc statique de la classe de base s'exécute d'abord, puis celui de la classe dérivée

```java
public class Config {
    public static String appName;

    static {
        System.out.println("Le bloc statique s’exécute !");
        appName = "Mon super-application";
    }
}
```

## Ordre d'initialisation 

1. **Champs statique et blocs statique**
2. **Champs non statique et blocs non statique**
3. **Constructeurs**

```
+-------------------------------+
|   Chargement de la classe     |
|   dans la JVM                 |
+-------------------------------+
| 1. Champs statiques           |
| 2. Blocs statiques            |
|         ↓                     |
|   Création de l’objet         |
|         ↓                     |
| 3. Champs non statiques       |
| 4. Blocs non statiques        |
| 5. Constructeur               |
+-------------------------------+
```

---

## Utilisation des blocs d'initialisation

**Quand un constructeur ne sufft pas**

Lorsqu'une partie de l'initialisation doit être commune à tous les constructeurs. Par exemple, une classe à plusieurs constructeurs et que l'on ne souhaite pas dupliquer la même initalisation dans chacun. 

Dans ce cas, il est pratique de la placer dans un bloc non statique

```java
public class Person {
    private String id;
    private String name;

    {
        // Ce code s’exécute avant n’importe quel constructeur
        id = java.util.UUID.randomUUID().toString();
        System.out.println("Génération d’un id unique: " + id);
    }

    public Person() {
        System.out.println("Person() sans paramètres");
    }

    public Person(String name) {
        this.name = name;
        System.out.println("Person(String name)");
    }
}
```

Lors de la création d'un objet `Person`, l'id est généré, puis le constructeur approprié s'exécute

**Initialisation de donnée statiques compexes**

On utilise souvent les bloc statique pour initialiser des champs statique complexe. Par exemple, la lecture de fichier de configurationm la création de collectionsm la connexion à une base de donnée.

```java
public class Settings {
    public static final java.util.Map<String, String> DEFAULTS;

    static {
        DEFAULTS = new java.util.HashMap<>();
        DEFAULTS.put("theme", "light");
        DEFAULTS.put("language", "ru");
        System.out.println("Bloc statique de Settings: paramètres par défaut");
    }
}
```