---
date: 2026-06-14T23:53:54+02:00
---
# Map

## `HashMap<K, V>`: dictionnaire personnel 

Permet de stocker des valeurs par clé/valeur. 

En premier argument, le type de la clé, en second, le type de la valeur.

Les clés sont unique, si on tente d'ajouter une nouvelle valeur pour une clé existante, l'ancienne valeur sera écrasée.

```java 
import java.util.HashMap;

HashMap<String, String> phonebook = new HashMap<String, String>();

HashMap<String, Integer> grades = new HashMap<String, Integer>();  // nom → note
HashMap<Integer, String> users = new HashMap<Integer, String>();   // id → nom
HashMap<String, Boolean> flags = new HashMap<String, Boolean>();   // clé → valeur booléenne
```

### `put(key, value)`: ajouter une paire 

```java
phonebook.put("Alice", "+380501112233");
phonebook.put("Bob", "+380671234567");
```

### `get(key)`: obtenir une valeur 

Si la clé n'existe pas, la méthode retourne `null`

```java
System.out.println(phonebook.get("Alice"));
```

### `containsKey(key)`: vérifier la présence 

Retourne `true`si la clé est présente.

```java
// si la clé est présente on affiche, sinon on ajoute la valeur
if (phonebook.containsKey("Alice"))
{
    System.out.println("Alice a déjà un numéro!");
}
else
{
    phonebook.put("Alice", "+10111111111");
}
```

### `remove(key)`: supprime une entrée 

```java
phonebook.remove("Bob");
System.out.println(phonebook.get("Bob"));
```

### `entrySet()`: Parcourir le map 

```java
for (var entry : phonebook.entrySet()) {
    System.out.println(entry.getKey() + " -> " + entry.getValue()); //Alice -> +10501112233
}
```

### Compatage de mots 

On veux compter le nombre d'occurence des mots dans un texte.

```java
String text = "java java core java";
HashMap<String, Integer> freq = new HashMap<String, Integer>();

// parcours la string et explose en se basant sur l'espace comme séparateur 
for (String w : text.split(" "))
{
    // on récupère chaque valeur du hashMap 
    Integer old = freq.get(w);
    // si déjà trouvé, on incrémente la valeur du mot 
    freq.put(w, (old == null) ? 1 : old + 1);
}

System.out.println(freq); //{core=1, java=3}
```

### Application: annuaire téléphonique 

```java
import java.util.HashMap;
import java.util.Scanner;

public class PhonebookApp {
    public static void main(String[] args)
    {
        HashMap<String, String> phonebook = new HashMap<String, String>();
        Scanner console = new Scanner(System.in);

        while (true)
        {
            System.out.print("Saisissez un nom (ou une ligne vide pour quitter): ");
            String name = console.nextLine();
            if (name.isEmpty()) break;

            System.out.print("Saisissez le numéro: ");
            String phone = console.nextLine();

            phonebook.put(name, phone);
        }

        System.out.println("Annuaire téléphonique:");
        for (var entry : phonebook.entrySet())
        {
            System.out.println(entry.getKey() + " -> " + entry.getValue());
        }
    }
}
```


