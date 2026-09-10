---
date: 2026-06-16T08:34:17+02:00
---

# Getter_setter

## Getter

Méthode public qui retourne la valeur d'un champ privé. Son nom commence par `get` + nom du champ

```java
public class Person {
    private String name; // Champ privé

    // Getter pour le champ name
    public String getName() {
        return name;
    }
}
```

---

## Setter

Méthode public qui permet de modifier la valeur d'un champ privé. Son nom commence par `set` + le nom du champ

```java
public class Person {
    private String name;

    // Setter pour le champ name
    public void setName(String name) {
        this.name = name;
    }
}
```

---

## Boolean

Pour les champs de type `boolean`, il est d'uage d'utiliser le prefixe `is` dans les getter :

```java
private boolean active;

public boolean isActive() {
    return active;
}

public void setActive(boolean active) {
    this.active = active;
}
```

## Exemple

```java
public class Contact {
    private String name;
    private String phone;
    private int age;
    private boolean favorite;

    // Getters
    public String getName() {
        return name;
    }

    public String getPhone() {
        return phone;
    }

    public int getAge() {
        return age;
    }

    public boolean isFavorite() {
        return favorite;
    }

    // Setters
    public void setAge(int age) {
        if (age < 0) {
            System.out.println("L’âge ne peut pas être négatif !");
            return;
        }
        this.age = age;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public void setFavorite(boolean favorite) {
        this.favorite = favorite;
    }
}
```

On l'utilise ensuite de cette manière

```java
Contact friend = new Contact();
friend.setName("John Doe");
friend.setPhone("+1-999-123-45-67");
friend.setAge(25);
friend.setFavorite(true);

System.out.println("Nom : " + friend.getName());
System.out.println("Téléphone : " + friend.getPhone());
System.out.println("Âge : " + friend.getAge());
System.out.println("Favori : " + (friend.isFavorite() ? "Oui" : "Non"));
```

---

## Bonne pratique 

**Tous les champs n'ont pas besoin de setters publics**
Parfois un champ doit être en lecture seule, par exemple un identifiant unique définis à la création de l'objet et qui ne change plus. Dans ce cas, on ne fournit pas de setter:
```java
public class Contact {
    private final int id; // final — ne peut pas être modifié après l’initialisation

    public Contact(int id) {
        this.id = id;
    }

    public int getId() {
        return id;
    }

    // Pas de setId !
}
```

**Utiliser les getters/setter pour contrôler l'accès et valider**
```java
public void setName(String name) {
    if (name == null || name.trim().isEmpty()) {
        System.out.println("Le nom ne peut pas être vide !");
        return;
    }
    this.name = name;
}
```

**Ne pas divulguer directement les objets internes mutables**
Si on as un champs, par exemple, un tableau de numéro de téléphone:
```java
private String[] phones;
```

Il ne faut pas retourner directement via un getter. On utilise une copie du tableau pour que le code externe ne puisse pas venir modifier les données interne.

```java
// copy
public String[] getPhones() {
    return Arrays.copyOf(phones, phones.length); // On renvoie une copie
}

// clonage
public String[] getPhones() {
    return phones.clone();
}
```

**Rendre les getters et setters clairs et simples**
- pas de logique métier conmplexe - leur role doit rester simple -> controler d'acces et validation simple 
- si un champ ne doit pas changer, pas de setter 
- si un champ ne doit pas etre accessible depuis l'exterieur -> pas de getter

---

## Getter et setters pour des props calculées et immuables 

Parfois la valeur n'est pas stockées dans un champs mais calculées à la volées

```java
public class Rectangle {
    private int width;
    private int height;

    public int getArea() {
        return width * height;
    }
}
```

Par besoin de setter - on ne peux pas définir directement, seulement modifier la width et lq heigthh