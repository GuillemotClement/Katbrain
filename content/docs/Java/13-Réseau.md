# Réseau 

## `URL`

La classe `URL` repésente une adresse réseau. Elle permet d'ouvrir une connexion et d'obtenir un flux de données (`Inputstream`). Ce flux peut être manipulé comme un fichier: lecture des octets, copie vers un autre flux, traitement du texte.

### `openStream` 

```java 
URL url = new URL("https://example.com/image.jpg");
Files.copy(url.openStream(), Path.of("a.jpg"));
```

1. On viens créer un objet `URL` en lui passant la chaîne contenant l'adresse de l'image.
2. On appelle `openStream()` qui permet d'ouvrir une connexion réseau et retourne un flux `InputStream`
3. `Files.copy()` permet de copier le flux dans un fichier `a.jpg`

Le fichier provenant d'internet est copier dans le dossier de travail.

### `transferTo`

Il existe une seconde manière d'acheminer les données du flux vers un autre fichier.

```java 
InputStream in = new URL("https://example.com/image.jpg").openStream();
in.transferTo(Files.newOutputStream(Path.of("b.jpg")));
```

On indique explicitement à `in` de prendre le flux, et de transfèrer toutes les données avec la méthode `transferTo` vers le flux qui écrit le fichier `b.jpg`.

---

## `HttpClient` - méthode moderne 

`HttpClient` permet d'effectuer des requêtes HTTP de façon morder: travailler avec des méthode GET, POST, etc, gérer les délais d'attente, surveiller les en-têtes et les status, traiter les redirections.

Pour le téléchargement d'image, on peut s'assurer que le fichier a bien été télécharger avec succès et non une erreur.

### Utilisation pour télécharger une image

```java 
URI uri = URI.create("https://example.com/image.jpg");   // URI — version plus moderne de URL

HttpClient client = HttpClient.newHttpClient();          // Crée un objet HttpClient
HttpRequest request = HttpRequest.newBuilder(uri).build(); // Crée un objet "requête"

HttpResponse<byte[]> response = client.send(request, HttpResponse.BodyHandlers.ofByteArray());
Files.write(Path.of("c.jpg"), response.body());
```

1. On créer un client `HttpClient`
2. On construit une requête `HttpRequest` vers l'adresse indiquée
3. On envoie la requête et on reçoit la réponse sous forme de tableau d'octets: `HttpResponse.BodyHandlers.ofByteArrays()`
4. On écrit les octets dans un fichier `Files.write` - `c.jpg`

#### Vérification du statut de la réponse 

L'objet `response` possède la méthode `statusCode()`. Elle permet de s'assurer que le serveur a renvoyé une réponse réussie:

```java 
if (response.statusCode() == 200)
{
    Files.write(Path.of("ok.jpg"), response.body());
}
else
{
    System.out.println("Erreur : code " + response.statusCode());
}
```

#### Récupération des en-têtes 

```java 
String type = response.headers().firstValue("Content-Type").orElse("inconnu");
System.out.println("Type de contenu : " + type);
```

Si le serveur retourne `image/png` ou `image/jpeg`, c'est bien une image.

#### Délais d'attente 

Pour éviter que le programme se bloque si le serveur met trop de temps, on peut définir une limite 

```java 
URI uri = URI.create("https://example.com/image.jpg");
HttpRequest req = HttpRequest.newBuilder(uri)
    .timeout(Duration.ofSeconds(5))
    .build();
```

#### Gestion des redirections 

Parfois les liens ne pointent pas directement vers le fichier mais d'abord vers une page de redirection. Pour activer le suivi automatique des redirections 

```java 
HttpClient client = HttpClient.newBuilder()
    .followRedirects(HttpClient.Redirect.NORMAL)
    .build();
```

#### Téléchargement d'image multiple 

Par exemple, un programme qui enregistre des avatars d'utilisateurs ou des photos de profil.

```java
var client = HttpClient.newHttpClient();

String[] urls = {
    "https://example.com/img1.jpg",
    "https://example.com/img2.jpg"
};

for (int i = 0; i < urls.length; i++)
{
    var uri = URI.create(urls[i]);
    var request = HttpRequest.newBuilder(uri).build();
    var response = client.send(request, HttpResponse.BodyHandlers.ofByteArray());
    if (response.statusCode() == 200) {
        Files.write(Path.of("img" + i + ".jpg"), response.body());
    }
}
```

#### Vérification de la taille du fichier 

```java 
String length = response.headers().firstValue("Content-Length").orElse("?");
System.out.println("Taille : " + length + " octets");
```

Dans le cas ou l'en-tête est absent, on peut utiliser `response.body.length`

#### Téléchargement et affichage d'une image 

Pour télécharger puis afficher immétiatement une image 

```java 
InputStream in = new URL("https://example.com/pic.png").openStream();
BufferedImage img = ImageIO.read(in);
System.out.println("Largeur : " + img.getWidth() + ", hauteur : " + img.getHeight());
```

---

## Utilisation API 

### Requête vers endpoint 

```java 
String url = "https://api.open-meteo.com/v1/forecast?latitude=50.45&longitude=30.52&current_weather=true";

HttpClient client = HttpClient.newHttpClient();
HttpRequest req = HttpRequest.newBuilder(URI.create(url)).GET().build();
HttpResponse<String> resp = client.send(req, HttpResponse.BodyHandlers.ofString());

System.out.println("Statut HTTP: " + resp.statusCode());
System.out.println("Réponse du serveur:");
System.out.println(resp.body());
``` 

1. Création d'un client `HttpClient`
2. Construction d'une requête GET - `HttpRequest`
3. Envoi - `client.send`
4. Reception d'une réponse sous forme de String - `HttpResponse<String>`


