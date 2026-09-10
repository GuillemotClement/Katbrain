# 01 - Fondamentaux 

## Méthode `main()` 

Un programme Java doit posséder au minimum une méthode `main()` par laquelle commencer son exécution. Cette méthode est le point d'entrée du programme.

```java
// ==========================
// programme minimal Java 25 
// ==========================
void main()
{
  // instruction de la méthode
}
```

---

## Affichage à l'écran 

### `System.out.println()` & `System.out.print()`

```java
System.out.print("Amigo");
System.out.println("The");
System.out.print("Best");

// sortie 
// AmigoThe
// Best

// ============================
// affichage avec concaténation 
// ============================
System.out.println("Mon âge : " + 28);
```

---

## Variable

Chaque variable possède un **type**, un **nom** et une **valeur**.

```java 
// =======================
// syntaxe de déclaration 
// =======================
type name;

// =======================
// déclaration 
// =======================
int a;
String s;
double c;

// =========================
// affectation de valeur 
// =========================
name = value;

a = 3;
s = "John";
c = 3.14;

// ========================
// déclaration et affectation 
// ========================
int x123 = 1;
String kitty;
double PI = 3.14;
String MAIN_PATH = "c:/"; 
String s1 = "Amigo" + " the best";
String s3 = "Amigo" + x;	
```

---

## Commentaire 

```java 
// commentaire one line 

/* 
  commentaire
  multi
  ligne
*/
```