---
date: 2026-06-14T09:03:01+02:00
---
# Constante

Une constante est une variable qui ne peut plus être modifée après initialisation. Elle permettent de nommer des "nombre magiques", ou de gérer des valeurs de paramètres qui ne doivent pas être modifié.

On utilise `final` pour définir une nouvelle constante.

Les constantes sont nommée en **MAJUSCULE_AVEC_UNDERSCORE** 

```java
final int DAYS_IN_WEEK = 7;
final double PI = 3.1415926535;
final String GREETING = "Salut, Java!";
```


## `static final`: constante au niveau de la classe

En Java, on utilise souvent des constantes qui ne dépendent pas d'une instance d'un objet. C'est une constante qui sera commune à toute la classe.
Pour cela, on utilise `static` + `final`.

On déclare ces constantes en début de classe.

```java
public class MathUtils
{
    // déclaration de la constante static
    public static final double PI = 3.1415926535;

    public static double circleLength(double radius)
    {
        // appelle de la constante static
        return 2 * PI * radius;
    }
}

// utilisation 
double len = MathUtils.circleLength(5);
System.out.println(len); // 31.4159...
```

---

## Différence entre `final` et `static final`

`final`: déclaration d'une constante 
`static final`: déclaration d'une constante indépendnates des objets

```java
public class User
{
    public final String name;                      // Chaque User a son propre nom (final) => constante 
    public static final String COMPANY = "CodeGym"; // Une entreprise commune à tous (static final) => constante static 

    public User(String name)
    {
        this.name = name;
    }
}

// UTILISATION =========================== 
// déclaration de nouvelle instance de la classe
User u1 = new User("John");
User u2 = new User("Peter");

// affichag de la valeur de la constante lié à l'objet 
System.out.println(u1.name);      // John
System.out.println(u2.name);      // Peter
// affichage de la constante statique => lié à la classe
System.out.println(User.COMPANY); // CodeGym
```

