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

### `<main>`

Représente le contenue principale de la page

```html
<main>
  <h1>Most important content of the document</h1>
  <p>Some more important content...</p>
</main>
```

### `<img />`

Permet d'afficher une image

```html
<img src="https://cdn.freecodecamp.org/platform/universal/fcc_secondary.svg" alt="description de l'image" />
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