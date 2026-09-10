---
date: 2026-06-11T11:49:56+02:00
---
# Char

Le type `char` permet de stocker un caractère: lettre, chiffre, signe de ponctuation, espace, caractére spécial

```java
char letter = 'A';
char digit = '7';
char symbol = '?';
char cyrillic = '\u0416';
char euro = '€';
char smile = '☺'; // Oui, c'est aussi possible !
```

- La valeur s'écrit en `'`
- Derrière chaque caractère se cache son unicode.

## Obtenir le code unicode d'un caractère 

```java
// char -> unicode 
public class CharToInt {
    public static void main(String[] args) {
        char ch = 'A';
        int code = ch; // Conversion implicite char → int

        System.out.println("Code du caractère '" + ch + "': " + code);
    }
}

// unicode -> char 
public class IntToChar {
    public static void main(String[] args) {
        int code = 1040; // Code du caractère 'A cyrillique' en Unicode (alphabet cyrillique)
        char ch = (char) code; // Conversion explicite int → char

        System.out.println("Caractère avec le code " + code + ": " + ch);
    }
}
```