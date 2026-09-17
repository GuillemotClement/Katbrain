# Manipulation des fichiers et images 

## `Path` - Chemin d'accès au fichier 

Pour accéder à une fichier sur le disque, il faut indiquer son path. La classe `Path` permet de générer le chemin relatif et absolu d'un fichier 

```java 
Path path = Path.of("hello.txt"); // chemin relatif
Path absPath = Path.of("C:/Users/Me/image.png"); // chemin absolu (Windows)
```

---

## Manipulation de fichier texte 

Si le contenu peut être représenter par du texte compréhensible c'est un fichier texte.

### `writeString` - écriture dans un fichier 

```java 
Path p = Path.of("hello.txt");
Files.writeString(p, "Bonjour, fichier !");
```

1. Création d'un objet `Path` qui pointe vers le fichier 
2. Ecriture d'une chaîne dans le fichier avec `writeString()`
3. Si le fichier n'existait pas, il sera crée automatiquement.

### `readString` - lecture de texte depuis un fichier 

La méthode pernet de charger le fichier dans une String. 

```java 
Path p = Path.of("hello.txt");
String content = Files.readString(p);
System.out.println(content);
```

---

## Manipulation de fichiers binaire 

Les images, musiques, archives sont des ensemble d'octets. 

### `write` - écriture d'octets dans un fichier 

Permet d'écrire dans un fichier un tableau d'octet. On appelle aussi un tampon (byte buffer).

```java 
byte[] data = {65, 66, 67, 68}; // caractères A B C D
Files.write(Path.of("letters.bin"), data);
```

### `readAllBytes` - lecture des octets 

Permet de récupérer le contenu du fichier sous forme de tableau d'octets 

```java 
byte[] buffer = Files.readAllBytes(Path.of("letters.bin"));

// afficher le tableau d'octets lu à l'écran
for (byte b : buffer)
{
    System.out.print((char)b + " ");
}
```

---

## Manipulation de fichier 

### Copie de fichier 

Pour copier un fichier, il faut le lire dans un tableau d'octets et écrire ce tableau dans un nouveau fichier 

```java
Path in = Path.of("logo.png");
Path out = Path.of("logo_copy.png");

byte[] bytes = Files.readAllBytes(in);
Files.write(out, bytes);
```

### Vérification d'existence d'un fichier 

```java 
Path p = Path.of("hello.txt");
if (Files.exists(p))
{
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

Les opérations de fichiers peuvent échouer: fichier absent, droits d'accès insuffisant, disque plein, fichier occupé, etc.

Il faut donc entourer le travail avec le disque dans un bloc `try-catch` et bien propager les exceptions avec `throws`.

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
