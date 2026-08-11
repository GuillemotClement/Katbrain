# HTML 

## Balise structurante 

### Title 

Il existe 6 niveaux de titres différents - 1 -> 6

- `<h1></h1>`: titre principale de la page - **un seul par page**
- `<h2></h2>`: sous titre d'une page

```html
<h1>most important heading element</h1>
<h2>second most important heading element</h2>
<h3>third most important heading element</h3>
<h4>fourth most important heading element</h4>
<h5>fifth most important heading element</h5>
<h6>least important heading element</h6>
```

### Paragraphe 

- `<p></p>`: paragraphe 

```html
<p>This is a paragraph element.</p>
```

### Image 

```html
<img src="https://cdn.freecodecamp.org/curriculum/cat-photo-app/lasagna.jpg" alt="A slice of lasagna on a plate."/>
```

### `<body>`

Représente le contenu de la page 

```html
<body>
  <h1>CatPhotoApp</h1>
  <p>This is a paragraph element.</p>
</body>
```

### `<div>` - container 

Permet de créer un container pouvant rassembler plusieurs éléments. 

Cette balise n'as pas de signification particulière.

```html
<div>
  <h1>I am a heading</h1>
  <p>I am a paragraph</p>
</div>
```

### `<a>` - lien  

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


#### `tel:`

```html
<p>Phone: <a href="tel:5555555555">555-555-5555</a></p>
```

#### `mailto:`

Permet d'ouvrir directement l'application de mail de l'user avec l'adresse m

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

### `<button>` 

```html
<button type="button">Click me</button>
```



### `id`

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

### `class`

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

### `<footer>` - pied de page 

Permet de définir le pied de page d'un document ou d'une section. Contient généralement les informations sur l'auteur, les copyrights, les liens vers les termes d'utilisations, etc

```html
<footer>
  <p>No Copyright - <a href="https://www.freecodecamp.org">freeCodeCamp.org</a></p>
</footer>
```

---

## Sémantique 

### `<header>`

Définit les élément header d'un document 

```html
<header>
  <h1>CatPhotoApp</h1>
  <p>Welcome to our cat gallery.</p>
</header>
```

### `<main>`

Représente le contenue principale de la page

```html
<main>
  <section>
    <h2>Cat Photos</h2>
    <p>Browse adorable cat pictures.</p>
  </section>
</main>
```

### `<footer>`

Représente le pied de page 

```html
<footer>
  <p>
    No Copyright - <a href="https://www.freecodecamp.org">freeCodeCamp.org</a>
  </p>
</footer>
```



### `<section>`

Permet de définir une section du document

```html 
<section>
  <h2>About Me</h2>
  <p>Hi, I am Jane Doe and I am a web developer.</p>
</section>
```

### `<nav>`

Permet de représenter une section contenant des liens de navigations 

```html
<nav>
  <ul>
    <li><a href="#photos">Photos</a></li>
    <li><a href="#videos">Videos</a></li>
  </ul>
</nav>
```

### `<article>`

Représente un élément autonome de la page

- article de blog 
- actu
- message de forum
- fiche produit
- commentaire

```html
<article>
  <h2>My First Blog Post</h2>
  <p>This is the content of my first blog post.</p>
</article>
```

### `<figure>`

Permet d'associer une image ou diagram avec une phrase

`<figcaption>`: permet d'ajouter une description à une image

```html
<figure>
  <img
    src="https://cdn.freecodecamp.org/curriculum/cat-photo-app/cats.jpg"
    alt="Two tabby kittens sleeping together on a couch."
  />
  <figcaption>Cats <strong>hate</strong> other cats.</figcaption>
</figure>
```

### `<em>` - mettre l'accent

Permet de mettre l'accent sur un mot ou une phrase. Par défaut afficher en italic

```html 
<p>
  Never give up on <em>your</em> dreams.
</p>
```

### `<i>` - mettre en valeur 

Permet de mettre en valeur des term idiomatic, terme technique

```html
<p>
  There is a certain <i lang="fr">je ne sais quoi</i> in the air.
</p>
```

- `lang`: permet de spécifier le language

### `<strong>` - texte important

Permet de définir du texte important

```html
<p>
  <strong>Warning:</strong> This product may cause allergic reactions.
</p>
```

### `<b>` 

Permet d'attirer visuellement l'attention sur un texte sans signification particuliere symatiquement.

Généralement utiliser pour mettre en valeur des keywords ou des noms de produits.

```html
<p>
  We tested several products, including the <b>SuperSound 3000</b> for audio quality, the <b>QuickCharge Pro</b> for fast charging, and the <b>Ecoclean Vacuum</b> for cleaning. The first two performed well, but the <b>Ecoclean Vacuum</b> did not meet expectations.
</p>
```

### `<dl>` - liste de description

Permet de définri une liste de description comme un glossaire ou paire clé-valeur 

```html
<dl>
  <dt>HTML</dt>
  <dd>HyperText Markup Language</dd>
  <dt>CSS</dt>
  <dd>Cascading Style Sheets</dd>
</dl>
```

- `dl`: contient l'ensemble de la liste 
- `dt`: représente la clé
- `dd`: représente une valeur 

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


### `<q>`

```html
<p>
  As Quincy Larson said,
  <q cite="https://www.freecodecamp.org/news/learn-to-code-book/">
    Momentum is everything.
  </q>
</p>
```

### `<abbr>` - abréviation

Permet de déclarer des abbréviations. 

```html
<p><abbr title="HyperText Markup Language">HTML</abbr> is the foundation of the web.</p>
```

### `<address>` - adresse

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

### `<br />` - saut de ligne 

```html
<address>
  123 Main Street<br>
  Springfield, IL 62701
</address>
```

### `<time>` - affichage de date et heure

Permet d'afficher une heure ou date.

```html
<!-- affichage pour une heure -->
 <p>The reservations are for <time datetime="20:00">20:00 </time></p>

<!-- affichage pour une date complete -->
 <p>
  The graduation will be on <time datetime="2024-06-15T15:00">June 15</time>
</p>
```

### `<sup>` -- Exposant 

Permet de passer l'élément en exposant

```html
<p>2<sup>2</sup> (2 squared) is 4.</p>

<p>
  Monseigneur is often written as <strong>M<sup>gr</sup></strong>.
</p>
```

### `<sub>` -- inverse de l'exposant 

Permet de passer l'élément en dessous, l'inverse de l'exposant -> notation scientific 

```html 
<p>CO<sub>2</sub></p>
```

### `<code>`

Permet de representer du code 

```html
<p>
  To set the text color to blue in CSS, use the following code:
  <code>color: blue;</code>
</p>
```

Pour repésenter sur plusieurs lignes, il faut utiliser `<pre></pre>`

```html
<pre>
  <code>
    body {
      color: red;
    }
  </code>
</pre>
```

### `<pre>` - texte pré-formater

```html
<pre>
  <code>
    body {
      color: red;
    }
  </code>
</pre>
```

### `<u>` - annotation non textuel 

Permet de faire une annotation non textuel, par exemple un nom propre mal othographier. Par défault l'élément est souligné.

```html
<p>
  You can use the unarticulated annotation element to highlight
  <u>inccccort</u> <u>spling</u> <u>issses</u>.
</p>
```

### `<s>` - text inexact

Cette balise permet d'indiquer du text inexact ou pertinent. Par défaut, l'élément est barré.

```html 
<p><s>Tomorrow's hike will be meeting at noon.</s></p>

<p>Due to unforeseen weather conditions, the hike has been canceled.</p>
```

### `<ruby>` - annotation de prononciation 

Cet élément permet d'ajouter la "prononciation" d'un élément. Peut être utiliser pour indiquer la prononciation de caractère 

```html 
<ruby> 明日 <rp>(</rp><rt>Ashita</rt><rp>)</rp> </ruby>
```

- `rp`: permet d'ajouter un failback 
- `rt`: indique le text 



## old









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


## Formulaire

### `<form>`

```html
<form action="">
  <label for="email"> Email Address: </label>
  <input type="email" id="email" required/>
  <button type="reset">Reset form</button>
  <button type="submit">Submit form</button>
</form>
```

- `<form></form>`: définis le formulaire
- `action`: définis où les données seront envoyer à la soumission du formulaire
- `method`: GET ou POST

- `<input />`: définis un input du formulaire
- `type`: text, email, number, radio, checkbox...
- `placeholder`: text helper dans l'input
- `value`: valeur de l'input
- `name`: nom de l'input

Les inputs dispo de validation HTML basique :
- `required`: une valeur doit être saisis
- `minLength` | `maxLength`: nombre d'éléments max et min  
- `min` | `max`: valeur numerique max et min 

- `size`: permet de définir le nombre de caractères visible dans l'input

Les inputs disposent de plusieurs state 
- `default`: état par défaut
- `focused`: lorsque l'input est selectionner
- `disabled`: lorsque l'input ne peut pas etre selectionner
- `readonly`: lorsqu'il n'est pas possible de faire des saisie dans l'input

### `<fieldset>` 

Permet de rassembler plusieurs label et input 

```html
<fieldset>
  <legend>Personal Information</legend>
  <label for="full-name">Name (required):</label>
  <input type="text" id="full-name" name="name" placeholder="e.g., John Doe" required size="20">

  <label for="email">Email address (required):</label>
  <input
    placeholder="example@email.com"
    required
    id="email"
    type="email"
    name="email"
    size="20"
  />
  <label for="age">Age (optional):</label>
  <input type="number" name="age" id="age" min="3" max="100" />
</fieldset>
```

### Boutton radio 

Les valeur de l'attribut `name` doivent être les même pour lier les input avec le bouton radio

```html
<fieldset>
  <legend>Was this your first time at our hotel?</legend>
  <input 
    id="yes-option" 
    type="radio" 
    name="hotel-stay" 
    value="yes" 
  />
  <label for="yes-option">Yes</label>
  
  <input 
      type="radio" 
      id="no-option" 
      name="hotel-stay" 
      value="no"
    />
  <label for="no-option">No</label>
</fieldset>
```

### Checkbox 

```html
<fieldset>
  <legend>
    Why did you choose to stay at our hotel? (Check all that apply)
  </legend>

  <input type="checkbox" id="ads" name="choice" value="ads" />
  <label for="ads">Social Media Ads</label>

  <input
    type="checkbox"
    id="recommendation"
    name="choice"
    value="recommendation"
  />
  <label for="recommendation">Personal Recommendation</label>
  
  <input type="checkbox" id="location" name="choice" value="location" />
  <label for="location">Location</label>

  <input
    checked
    type="checkbox"
    id="reputation"
    name="choice"
    value="reputation"
  />
  <label for="reputation">Reputation</label>
  
  <input
    checked
    type="checkbox"
    id="price"
    name="choice"
    value="price"
  />
  <label for="price">Price</label>
</fieldset>
```

- `checked`: rend la checkbox checked par defaut

### Select list

```html
<fieldset>
  <legend>Ratings</legend>

  <label for="service">How was the service?</label>

  <select name="service" id="service">
    <option value="poor">Poor</option>
    <option value="satisfactory">Satisfactory</option>
    <option value="good">Good</option>
    <option value="very-good">Very Good</option>
    <option selected value="excellent">Excellent</option>
  </select>

  
</fieldset>
```

- `selected`: selectionne par defaut

### Textarea

```html
<label for="comments">Other Comments?</label>
<textarea cols="30" rows="10" name="comments" id="comments"></textarea>
```

---

## Table

```html
<table>
  <thead>
    <tr>
      <th>The title of this table</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>First Row</th>
      <td>
        First Data Cell
      </td>
    </tr>
    <tr>
      <th>Second Row</th>
      <td>
        Second Data Cell
      </td>
    </tr>
  </tbody>
  <tfoot>
    <tr>
      <td colspan="2">Average Grade</td>
      <td >78.8</td>
    </tr>
  </tfoot>
</table>
```

- `colspan`: fusion de colonne