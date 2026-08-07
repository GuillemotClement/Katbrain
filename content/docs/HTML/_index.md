# HTML 

## Balise 

### Titre 

Il existe 6 niveaux de titres différents - 1 -> 6

- `<h1></h1>`: titre principale de la page - **un seul par page**
- `<h2></h2>`: sous titre d'une page


### Texte 

- `<p></p>`: paragraphe 

### Commentaire

```html
<!-- Commentaire -->
```

### `<html>` 

L'ensemble d'une page est placer dans les balises `<html>`. C'est le root de la page.
On peut venir y définir le language de la page 

```html
<html lang="en">
  <head>
    <!-- metadata -->
  </head>
  <body>
    <!-- content -->
  </body>
</html>
```

### `<title>` - titre de l'onglet

Permet de définir le titre afficher dans l'onglet du navigateur. Se place dans le `<head>`

```html
<head>
  <title>CatPhotoApp</title>
</head>
```

### `<main>`

Représente le contenue principale de la page

```html
<main>
  <h1>Most important content of the document</h1>
  <p>Some more important content...</p>
</main>
```

### `<section>`

Permet de définir une section du document

```html 
<section>
  <h2>Section Title</h2>
  <p>Section content...</p>
</section>
```

### `<footer>` - pied de page 

Permet de définir le pied de page d'un document ou d'une section. Contient généralement les informations sur l'auteur, les copyrights, les liens vers les termes d'utilisations, etc

```html
<footer>
  <p>No Copyright - <a href="https://www.freecodecamp.org">freeCodeCamp.org</a></p>
</footer>
```

### `<img />`

Permet d'afficher une image

```html
<img src="https://cdn.freecodecamp.org/platform/universal/fcc_secondary.svg" alt="description de l'image" />
```

#### `<figure>`

Permet d'associer une image avec une phrase

`<figcaption>`: permet d'ajouter une description à une image

```html
<figure>
  <img src="image.jpg" alt="A description of the image">
  <figcaption>A cute cat</figcaption>
</figure>
```


### `<a>` 

Permet de créer un lien 

```html
<!-- Lien vers un site externe -->
<a href="https://www.freecodecamp.org" target="_blank"></a>

<!-- Transformation d'une image en lien -->
<a href="example-link">
    <img src="image-link.jpg" alt="A photo of a cat.">
</a>
```

- `target="_blank"`: ouvre la cible du lien dans un nouvel onglet

### `<em>` - mise en valeur de mot 

```html 
<figcaption>Cats <em>love</em> lasagna.</figcaption>
```

### `<strong>` - texte important

```html
<figcaption>Cats <strong>hate</strong> other cats.</figcaption>  
```

### Liste 

```html 
<!-- Liste ordonnée -->
<ol>
  <li>catnip</li>
  <li>laser pointers</li>
  <li>lasagna</li>
</ol>
<!-- Liste non ordonnéee-->
<ul>
  <li>milk</li>
  <li>cheese</li>
</ul>
```

---

## Link - chargement de fichier CSS

Permet de charger des fichiers externes (css, site externe).

```html
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Examples of the link element</title>
// chargement du fichier css
  <link rel="stylesheet" href="./styles.css" />
  // chargement du favicon
  <link rel="icon" href="favicon.ico" />
</head>
```

- `rel`: attribut qui permet de définir le type de fichier chargé. `stylesheet` pour un fichier CSS.
- `href`: attribut qui permet de définir le chemin vers le fichier

--- 

## Boilerplate - basique html

```html
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta
       name="viewport"
       content="width=device-width, initial-scale=1.0" />
    <title>{title}</title>
    <link rel="stylesheet" href="./styles.css" />
  </head>
  <body>
    <h1>Hello World</h1>
  </body>
</html>
```

---

## `<div>` - container 

Permet de créer un container pouvant rassembler plusieurs éléments. 

Cette balise n'as pas de signification particulière.

```html
<div>
  <p>Example paragraph element.</p>
</div>
```

---

## `id`

L'attribut `id` permet de désigner un élément unique dans une page.

```html
<h1 id="title">Movie Review Page</h1>
```

En CSS, pour pointer sur cet élément, on utilise le `#` 

```css
#title {
  color: red;
}
```

---

## `class`

Permet de désigner plusieurs éléments dans une page.

```html
<div class="box"></div>

<div class="box red-box"></div>
```

```css
.box {
  width: 100px;
  height: 100px;
}

.red-box {
  background-color: red;
}
```

---

## `script` - import de fichier JS 

```html
<!-- déclaration du script JS -->
<body>
  <script>
    alert("Welcome to freeCodeCamp");
  </script>
</body>

<!-- import de fichier JS -->
<script src="path-to-javascript-file.js"></script>
```

---

## `meta` 

Les `meta` éléments permettent d'ajouter une description de page pour améliorer le SEO. Ce texte sera lisible dans les résultat de recherche.

Par exemple, l'ajout d'une description de page.
```html
<meta
  name="description"
  content="Discover expert tips and techniques for gardening in small spaces, choosing the right plants, and maintaining a thriving garden."
/>
```

---

## Open Graph Tag - partage réseaux sociaux 

Permet de controler comment le contenu du website apparait sur les différents réseaux sociaux. 

```html
<!-- set du title afficher sur les réseaux -->
<meta content="freeCodeCamp.org" property="og:title" />

<!-- définition du type -->
<meta property="og:type" content="website" />

<!-- définition de l'image afficher -->
<!-- 1200 x 630 pour une meilleur resolution -->
<!-- 600x315 minimum  -->
<meta
  content="https://cdn.freecodecamp.org/platform/universal/fcc_meta_1920X1080-indigo.png"
  property="og:image"
/>

<!-- définition de l'url -->
<meta property="og:url" content="https://www.freecodecamp.org" />
```

---

## `audio`

Permet d'afficher des éléments audio sur une page.

```html
<audio
  src="https://cdn.freecodecamp.org/curriculum/js-music-player/can't-stay-down.mp3"
  loop
  controls
  muted
></audio>

<!-- utilisation de source multiple -->
 <audio controls>
  <source src="audio.ogg" type="audio/ogg" />
  <source src="audio.wav" type="audio/wav" />
  <source src="audio.mp3" type="audio/mpeg" />
</audio>
```

- `controls`: permet d'ajouter le panneau de contrôle 
- `loop`: lance en boucle le contenu audio
- `muted`: passe l'audio en mute en état initial

---

## `video`

Permet d'afficher une lecteur video dans une page

```html 
<video
  src="https://archive.org/download/BigBuckBunny_124/Content/big_buck_bunny_720p_surround.mp4"
  loop
  controls
  muted
  poster="https://peach.blender.org/wp-content/uploads/title_anouncement.jpg?x11217"
  width="400"
></video>

<!-- source multiple -->
 <video
  controls
  width="400"
  poster="https://peach.blender.org/wp-content/uploads/title_anouncement.jpg?x11217"
>
  <source
    src="https://archive.org/download/BigBuckBunny_124/Content/big_buck_bunny_720p_surround.mp4"
    type="video/mp4"
  />
  <source
    src="https://archive.org/download/BigBuckBunny_124/Content/big_buck_bunny_720p_surround.webm"
    type="video/webm"
  />
  Your browser does not support the video tag.
</video>
```

- `autoplay`: lance la video au chargement de la page
- `width`: permet de définir la largeur du lecteur
- `poster`: permet de définir une image pendant le chargement de la vidéo

---

## Image 

---

## `iframe` 

Les `iframe` permettent d'intégrer des éléments comme des video, des cartes, une page web, etc dans une page.
Cela vient créer une fenêtre contenant un autre élément.

```html
<!-- intération d'une vidéo -->
 <iframe
  width="400"
  height="400"
  src="https://www.youtube.com/embed/PkZNo7MFNFg?si=-UBVIUNM3csdeiWF"
  title="Learn JavaScript - Full Course for Beginners (YouTube video)"
  allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
  referrerpolicy="strict-origin-when-cross-origin"
  allowfullscreen
></iframe>

<!-- intégration d'une carte -->
<h1>A Map from Openstreetmap.org Embedded with the iframe Element</h1>

<iframe
  width="425"
  height="350"
  src="https://www.openstreetmap.org/export/embed.html?bbox=3.006134033203125%2C6.150112578753815%2C3.6357879638671875%2C6.749850810550778&amp;layer=mapnik"
  title="Map of Lagos area, Nigeria"
  style="border: 1px solid black"
>
</iframe>
<br />
<small>
  <a href="https://www.openstreetmap.org/#map=11/6.4501/3.3210">
    View Larger Map
  </a>
</small>
```

- `allowfullscreen`: permet d'afficher en full screen l'élément

---

## Texte 

### `<blockquote>`

Ajoute du texte avec des `"`, et permet de représenter une phrase provenant d'une autre source.

```html
<blockquote cite="https://www.freecodecamp.org/news/learn-to-code-book/">
  "Can you imagine what it would be like to be a successful developer? To have built software systems that people rely upon?"
</blockquote>

<!-- Ligne multiple  -->
 <blockquote cite="https://www.freecodecamp.org/news/learn-to-code-book/">
  <p>Build your projects. Show them to your friends. Build projects for your friends.</p>
  <p>Build your network. Help the people you meet along the way. What goes around comes around. You'll get what's coming to you.</p>   
  <p>It is not too late. Life is long.</p>
  <p>You will look back on this moment years from now and be glad you made a move.</p>
</blockquote>

<!-- avec text de citation -->
<div>
  <blockquote cite="https://www.freecodecamp.org/news/learn-to-code-book/">
    Can you imagine what it would be like to be a successful developer? To have built software systems that people rely upon?
  </blockquote>
  <p>—Quincy Larson, <cite>How to Learn to Code and Get a Developer Job [Full Book].</cite></p>
</div>
```

- `cite`: sa valeur est une url valide de la source. Aide les screen reader.


### `<abbr>`

Permet de déclarer des abbréviations. 

```html
<p><abbr title="HyperText Markup Language">HTML</abbr> is the foundation of the web.</p>
```

### `<address>`

Permet d'afficher des adresse de contact par exemple 

```html
<address>
  <h2>Company Name</h2>
  <p>
    1234 Elm Street<br />
    Springfield, IL 62701<br />
    United States
  </p>
  <p>Phone: <a href="tel:+15555555555">+1 (555) 555-5555</a></p>
  <p>Email: <a href="mailto:contact@company.com">contact@company.com</a></p>
</address>
```

### `<time>`

Permet d'afficher une heure ou date.

```html
<!-- affichage pour une heure -->
 <p>The reservations are for <time datetime="20:00">20:00 </time></p>

<!-- affichage pour une date complete -->
 <p>
  The graduation will be on <time datetime="2024-06-15T15:00">June 15</time>
</p>