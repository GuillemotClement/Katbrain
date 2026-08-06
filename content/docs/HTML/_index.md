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