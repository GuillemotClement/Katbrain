---
date: 2026-06-15T08:19:45+02:00
---
# Request

## `URL`

La classe `URL` représente une adresse réseau. Elle permet d'ouvrir une connexion et d'obtenir un flux de données (`InputStream`). Ce flux peut être manipulé comme un fichier: lire des octests, copier vers un autre fulx, traiter comme du texte 

Utiliser cette classe est le moyen le plus simple pour accéder à internet et télécharger du contenu.

### Télécharger une image 

```java
// instanciation de l'url 
URL url = new URL("https://example.com/image.jpg");
// copie du flux dans le file system 
Files.copy(url.openStream(), Path.of("a.jpg"));
```

- `openStream()`: la méthode qui permet d'ouvrir une connexion réseau et retourne un flux `InputStream`

Il existe une autre façon d'acheminer les données du flux vers un fichier avec `trasnferTo()`

```java
InputStream in = new URL("https://example.com/image.jpg").openStream();
in.transferTo(Files.newOutputStream(Path.of("b.jpg")));
```

On indique explicitement: prends le flux `in`, et transfère les données avec la méthode `transferTo` vers le flux qui écrit le fichier `b.jpg`.

Cette approche est simple mais ne permet pas de vérifier ce qui est réellement arriver depuis le lien. 

### `HttpClient`: méthode moderne

`HttpClient` fait partie de la lib standard depuis la version 11 de Java. Elle permet d'effectuer des requête HTTP: travailler avec les méthode POST, GET, etc, gérer les délais d'attente, surveiller les en-tête et les status, et traiter les redirections.

```java
URI uri = URI.create("https://example.com/image.jpg");   // URI — version plus moderne de URL

// création du client 
HttpClient client = HttpClient.newHttpClient();          // Crée un objet HttpClient
// construction de la requête 
HttpRequest request = HttpRequest.newBuilder(uri).build(); // Crée un objet "requête"

// envoie de la requête et reception de la reponse sous forme d'un tableau d'octets (HttpReponse)
HttpResponse<byte[]> response = client.send(request, HttpResponse.BodyHandlers.ofByteArray());
// écriture des octets dans un fichier 
Files.write(Path.of("c.jpg"), response.body());
``` 

**Vérification du statut de la réponse**

L'objet `response` possède la méthode `statusCode()` qui permet de vérifier le code HTTP 

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

**Récupération des en-têtes**

On peut venir vérifier le type d'élément récupérer avec la requete :
```java
String type = response.headers().firstValue("Content-Type").orElse("inconnu");
System.out.println("Type de contenu : " + type);
```

**Délais d'attente**

Pour éviter que le programme se bloque si le serveur met trop de temps à répondre, on peut venir définir une limite

```java
URI uri = URI.create("https://example.com/image.jpg");
HttpRequest req = HttpRequest.newBuilder(uri)
    .timeout(Duration.ofSeconds(5))
    .build();
```

Si le serveur met plus de 5 secondes, la requête se termine par une ereur.

**Gestion des redirections**

```java
HttpClient client = HttpClient.newBuilder()
    .followRedirects(HttpClient.Redirect.NORMAL)
    .build();
```

### Pattern 

#### Téléchargement de plusieurs images d'affilée

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

#### Téléchargement et affichage d'une image dans le programme 

Permet de vérifier l'image directement en mémoire, sans avoir besoin de l'enregistrer

```java
InputStream in = new URL("https://example.com/pic.png").openStream();
BufferedImage img = ImageIO.read(in);
System.out.println("Largeur : " + img.getWidth() + ", hauteur : " + img.getHeight());
```

---

## API 

Une API (Application Programming Interface) est un "contrat" qui dit: si vous vous addressez à une certaines adresse sur internet, et indiquez tels paramètres, on obtient une réponse dans un format convenu.

Un endpoint, est l'adresse sur lequel on pointe pour obtenir des données. Généralement un URL. Souvent, elle inclut des paramètres de requête -> les paramètres de requêtes.

### Faire une requête vers une api 

La requête vient call l'api de météo.

```java
// définition du endpoint 
String url = "https://api.open-meteo.com/v1/forecast?latitude=50.45&longitude=30.52&current_weather=true";

// création du client 
HttpClient client = HttpClient.newHttpClient();
// création de la requete 
HttpRequest req = HttpRequest.newBuilder(URI.create(url)).GET().build();
// envoie de la requête et récupération de la response
HttpResponse<String> resp = client.send(req, HttpResponse.BodyHandlers.ofString());

// vérification du code HTTP
System.out.println("Statut HTTP: " + resp.statusCode());
System.out.println("Réponse du serveur:");
System.out.println(resp.body());
```

