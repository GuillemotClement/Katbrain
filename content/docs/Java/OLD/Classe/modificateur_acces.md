---
date: 2026-06-16T07:12:40+02:00
---
# Modificateur_acces

En Java, il existe quatre niveaux d'accès pour les classes, les champs, les méthodes et les constructeurs.

## `public`: accès publique 

La classe, le champ, la méthode ou le constructeur sont accessible depuis n'importe où dans le code.

La bonne pratique est de passer uniquement les méthodes qui doivent être accessibles de l'extérieur en public, les champs sont passées en `private`

```java
public class Cat {
    public String name;
    public void sayMeow() {
        System.out.println("Miaou !");
    }
}
```

---

## `private`: accés à l'intérieur d'une classe 

Accessible uniquement dans la classe. Les sous classes ne voient pas les champs et méthodes privées.

Pour les détails interne d'une classe.

```java
public class Cat {
    private String secretName;

    public void setSecretName(String name) {
        secretName = name;
    }

    public String getSecretName() {
        return secretName;
    }
}
```

---

## `protected`: accès protégé

L'accès est autorisé à la classe, ses sous classes, et toutes les classes du package courant.

Par exemple des méthodes utilitaires utilies dans les classes dérivées.

```java
public class Animal {
    protected int age;

    protected void growOlder() {
        age++;
    }
}
```

Toutes les classes qui hérite de `Animal` pourront accéder au champ `age` et à la méthode `growOlder()`.

```java
public class Cat extends Animal {
    public void haveBirthday() {
        growOlder();
        System.out.println("Le chat a " + age + " ans !");
    }
}
```

---

## `package-private`: accès à l'intérieur du package

Si aucun modificateur d'accès n'est définis, alors le membre est définis comme `package-private`. L'accès est permis aux classes du même package.

```java
class Dog {
    String name; // package-private
    void bark() { // package-private
        System.out.println("Ouaf !");
    }
}
```

---

## Bonne pratique 

**Réduire au maximum la visibilité**

On expose que ce qui est réellement nécessaire au code externe. C'est le principe du moindre privilèges:
