---
date: 2026-06-15T07:30:44+02:00
---
# Io

## `Path`: chemin d'accès 

Un fichier se trouve toujours quelque part sur le disque, et pour y accéder, il faut préciser le chemin. Java propose la classe `Path`, et on peut créer un nouvel objet à l'aide de la méthode `Path.of()`.

```java
Path path = Path.of("hello.txt"); // chemin relatif
Path absPath = Path.of("C:/Users/Me/image.png"); // chemin absolu (Windows)
```

- Le chemin relatif cherche le fichier dans le dossier courant du projet 
- Le chemin absolu indique l'adresse complète: disque, dossier et nom du fichier

---

## Travailler avec des fichiers textes

Du point de vue de Java, tous les fichiers se répartissent en 2 types: texte et binaire. Si le texte peut être compréhensible par un humain, c'est un fichier texte. Dans tous les autres cas, c'est un ensemble d'octets (fichier binaire).


### `writeString`: écrire du texte dans un fichier 

Pour écrire une chaîne dans un fichier, on utilise la méthode `writeString`.

Si le fichier n'existe pas, il sera crée automatiquement.

En troisième argument, on peut venir définir l'encodage utilisé pour l'écriture du fichier.

```java
// création d'un objet path qui pointe vers le fichier 
Path p = Path.of("hello.txt");
// écriture dans le fichier
Files.writeString(p, "Bonjour, fichier !", tandardCharsets.UTF_8);
```

## `readString`: Lire du texte depuis un fichier 

La méthode `readString` permet de charger tout le fichier dans une chaine 

```java
// création d'un objet path qui pointe vers le fichier
Path p = Path.of("hello.txt");
// récupération du contenu dans la chaîen 
String content = Files.readString(p);
// affichage du content 
System.out.println(content);
```

La variable `content` contient désormais le contenu du fichier. C'est pratique pour les petits fichiers: configuration, textes, documents JSON.

## Travailler avec des fichiers binaires 

Les images, la musique, les archives sont des ensembles d'octets.

### `write()`: écriture d'octets dans un fichier 

La méthode `write()` permet d'écrire dans un fichier un tableau d'octets. On l'appelle aussi un tampon (byte buffer).

```java
// création du tableau d'octets (tampon - byte buffer)
byte[] data = {65, 66, 67, 68}; // caractères A B C D
// écriture dans le fichier 
Files.write(Path.of("letters.bin"), data);
```

Le code vient écrire dnas le fichier un tableau d'octect. Si on ouvre le fichier comme du text, il contiendra les lettres "ABD".

### `readAllBytes()`: lire des octets 

Pour récupérer le contenu du fichier sous forme de tableau d'octets, on utilise la méthode `readAllBytes()`

```java
// déclartion d'un tableau de byte => le contenu du fichier est passer dans ce tableau 
byte[] buffer = Files.readAllBytes(Path.of("letters.bin"));

// afficher le tableau d'octets lu à l'écran
for (byte b : buffer)
{
    System.out.print((char)b + " ");
}
```

## Manipulation de fichier 

### Copie de fichier 

Pour copier un fichier, on vient le lire dans un tableau d'octets et écrire ce tableau dans leur format 

```java
Path in = Path.of("logo.png");
Path out = Path.of("logo_copy.png");

byte[] bytes = Files.readAllBytes(in); // lecture du fichier original
Files.write(out, bytes); // copie du fichier 
```

### Vérifier l'existence et la taille 

```java
Path p = Path.of("hello.txt");
// vérification si le fichier existe 
if (Files.exists(p))
{
    // récupérération de la taille du fichier 
    long size = Files.size(p);
    System.out.println("Fichier trouvé, taille : " + size + " octets");
}
else
{
    System.out.println("Fichier introuvable !");
}
```

---

## Exception 

Les opérations sur les fichiers peuvent échouer: fichier absent, droit d'accès insuffisant, disque plein, fichier occupé par un autre programme. Il est donc nécessaire d'entourer avec un bloc `bloc-catch`, ou bien propager les exceptions vers l'extérieur

```java 
try
{
    String content = Files.readString(Path.of("hello.txt"));
    System.out.println(content);
}
catch (IOException e)
{
    System.out.println("Erreur de lecture : " + e.getMessage());
}
```
