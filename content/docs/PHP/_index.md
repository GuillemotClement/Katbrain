# PHP

## Date

```php
// créer une nouvelle date au format 27/08/2026 03:01:43
date('d/m/Y h:i:s');
```

- `H`: heure
- `i`: minute
- `d`: jour
- `m`: mois
- `Y`: annee

## Array

### Itérer

```php
foreach($array as $id => $value)
```

#### `array_key_exists` - vérifier si une clé existe

```php
<?php array_key_exists('cle', $array); ?>
```

#### `in_array()` - valeur existe dans le tableau

```php
in_array('valeur', $array)
```

#### `array_search()` - index d'une valeur

Retourne l'index de la valeur, ou `false` si non trouvée

```php
array_search('valeur', $array)
```

#### `count()` - compte le nombre d'éléments du tableau

## String

### `str_replace()` - rechercher et remplacer des mots dans une varaible

```php
str_replace('string_rechercher', 'string_qui_remplace', 'string_dans_lequel_on_recherche');
```

### `strlen()` - longueur d'une string

### `sprintf()` - fromate une string

```php
sprintf(
    '%s par "%s" : %s',
    $recipe['title'],
    $recipe['author'],
    $recipe['recipe']
);
```

- `%s` - placeholder
  On passe ensuite les valeurs à afficher

---

## Fonction

```php
<?php

function isValidRecipe(array $recipe) : bool
{
    if (array_key_exists('is_enabled', $recipe)) {
        $isEnabled = $recipe['is_enabled'];
    } else {
        $isEnabled = false;
    }

    return $isEnabled;
}
```

Argument et retour sont typer

---

## Découpage en bloc fonctionnels

En PHP, il est possible d'inclure des fichier `.php` dans d'autre fichier. Cela permet de créer des blocs fonctionnels qui seront importé dans différentes pages.

```php
// header.php
<nav id="menu">
    <div class="element_menu">
        <h3>Titre menu</h3>
        <ul>
            <li><a href="page1.html">Lien</a></li>
            <li><a href="page2.html">Lien</a></li>
            <li><a href="page3.html">Lien</a></li>
        </ul>
    </div>
</nav>
```

Dans la page principale, on pourras venir importer ce bloc de code :

```php
<?php require_once(__DIR__ . '/header.php'); ?>
```

Le bloc de bloc, sera afficher à l'emplacement où l'instruction d'import est placé.

---

## Constante magique

### `__DIR__`

Retourne le chemin absolu du repertoire du fichier courant. Permet d'éviter les problèmes de chemin relatifs et renforce la sécurité du code.

---

## Vérification

### `isset()` - vérifier si une variable existe

```php
<?php
$getData = $_GET;

if (!isset($getData['email']) || !isset($getData['message']))
{
    echo('Il faut un email et un message pour soumettre le formulaire.');
    // Arrête l'exécution de ce fichier par PHP
    return;
}
?>
```

### `filter_var()` - filtre une variable avec un filtre

[doc](https://www.php.net/manual/fr/function.filter-var.php)

### `empty()` - vérifie que la variable n'est pas vide

### `is_dir()` - vérifier si un dossier existe

````php
$path = __DIR__ . '/uploads/';
if (!is_dir($path)) {
    echo "L'envoi n'a pas pu être effectué, le dossier uploads est manquant";
    return;
}
---

## Sécurité

### `htmlspecialchars()` - echappement de code

Permet de sécuriser les éléments où du contenu soumis par l'utilisateur est afficher

```php
<p><b>Message</b> : <?php echo htmlspecialchars($_POST['message']); ?></p>
````

---

## Gestion de fichier

### Paramétrage du formulaire - `enctype="multipart/form-data"`

```php
<form action="submit_contact.php" method="POST" enctype="multipart/form-data">
    <!-- Ajout des champs email et message -->
    [...]
    <!-- Ajout champ d'upload ! -->
    <div class="mb-3">
        <label for="screenshot" class="form-label">Votre capture d'écran</label>
        <input type="file" class="form-control" id="screenshot" name="screenshot" />
    </div>
    <!-- Fin ajout du champ -->
    <button type="submit" class="btn btn-primary">Envoyer</button>
</form>
```

### Traitement du fichier - `$_FILE`

Lorsque le fichier est envoyer, celui ci est placé dans un dossier temporaire. Il est ensuite nécessaire de la traiter pour le conserver ou non.

La superglobale `$_fILE` contient un tableau contenant des informations sur le fichier envoyer.

- `name`: nom du fichier envoyer
- `type`: type de fichier envoyer -> ex `image/gif`
- `size`: taille -> par défaut 8Mo
- `tmp_name`: emplacement temporaire du fichier -> gérer par PHP
- `error`: code erreur si l'envoi s'est bien effectue (code 0)

Pour le traitement du fichier :

1. Vérifier que l'user à bien envoyer un fichier en testant la variable avec `isset()`, et que le code erreur est bien 0
2. Vérifier que la taille du fichier est inférieur à la limite
3. Vérifier que l'extension du fichier est autorisé

```php
<?php
// Testons si le fichier a bien été envoyé et s'il n'y a pas des erreurs
// screenshot correspond à la valeur name de l'input du formulaire
if (isset($_FILES['screenshot']) && $_FILES['screenshot']['error'] === 0) {

    // Testons, si le fichier est trop volumineux
    if ($_FILES['screenshot']['size'] > 1000000) {
        echo "L'envoi n'a pas pu être effectué, erreur ou image trop volumineuse";
        return;
    }

    // Testons, si l'extension n'est pas autorisée
    $fileInfo = pathinfo($_FILES['screenshot']['name']); // récupération du nom du fichier
    $extension = $fileInfo['extension']; // récupération de l'extension du fichier
    $allowedExtensions = ['jpg', 'jpeg', 'gif', 'png']; // array contenant les extensions autorisé
    // check si extension est correct
    if (!in_array($extension, $allowedExtensions)) {
        echo "L'envoi n'a pas pu être effectué, l'extension {$extension} n'est pas autorisée";
        return;
    }

    // Testons, si le dossier uploads est manquant
    $path = __DIR__ . '/uploads/';
    if (!is_dir($path)) {
        echo "L'envoi n'a pas pu être effectué, le dossier uploads est manquant";
        return;
    }

    // On peut valider le fichier et le stocker définitivement
    move_uploaded_file($_FILES['screenshot']['tmp_name'], $path . basename($_FILES['screenshot']['name']));
}
```

### `move_upload_files()` - déplacement du fichier

Permet d'accepter un fichier provenant du dossier temporaire.

Prends en premier argument le nom temporaire du fichier `tmp_name`. En deuxieme parametre, le nom sous lequel sera stocker le fichier.

### `basename()` - retourne le nom du fichier

Cette fonction retourne le nom du fichier avec son extension, par exemple `fichier.png`

---

## Session

La session permet de conserver des informations.

Les valeurs sont conserver dans la superglobale `$_SESSION`.

### `session_start()` - création d'une session

La fonction permet de démarrer le système de session.

La méthode doit être présente sur chacune des pages avant tout code HTML ou PHP.

### `session_destroy()` - destruction de session

Cette fonction permet de fermer la session. Automatiquement appeler si le visiteur ne charge plus de page pendant une certaine periode ou via une page déconnexion pour la deconnexion manuel

### `setcookie()` - création d'un cookie

```php
<?php
// retenir l'email de la personne connectée pendant 1 an
setcookie(
    'LOGGED_USER',
    'utilisateur@exemple.com',
    [
        'expires' => time() + 365*24*3600,
        'secure' => true,
        'httponly' => true,
    ]
);
```

### `$_COOKIE` - superglobale contenant les cookies

```php
Bonjour <?php echo $_COOKIE['LOGGED_USER']; ?> !
```

---

## Redirection

```php
header("Location: /");
exit();
```

---

## MVC

- **model**: responsable du traitement PHP. Il contient la logique métier du projet (gestion des données, logique)
- **vue**: responsable de l'affichages des données
- **controleur**: permet de faire le lien entre le model et le template. Il reçoit les requêtes de l'utilisateur. Il appelle le model, récupère les données et les fournis ensuite à la vue

### Template de page 

#### Layout 

Le layout est une disposition de page. On y retrouve la structure de la page avec des "trou" où les données dynamique seront affichées.

```php 
<!DOCTYPE html>
<html>
   <head>
      <meta charset="utf-8" />
      <title><?= $title ?></title>
      <link href="style.css" rel="stylesheet" /> 
   </head>

   <body>
      <?= $content ?>
   </body>
</html>
```

- `$title`: variable ou sera afficher le titre de la page 
- `$content`: variable qui contient le contenu de la page 

#### Template 

Dans ce fichier, on viens définir le contenu réel d'une page. Il se charge de mettre en place le contenu, et l'affichage pour une page.

```php 
// templates/homepage.php
<?php $title = "Le blog de l'AVBN"; ?>

<?php ob_start(); ?>
<h1>Le super blog de l'AVBN !</h1>
<p>Derniers billets du blog :</p>

<?php
foreach ($posts as $post) {
?>
    <div class="news">
        <h3>
            <?= htmlspecialchars($post['title']); ?>
            <em>le <?= $post['french_creation_date']; ?></em>
        </h3>
        <p>
            <?= nl2br(htmlspecialchars($post['content'])); ?>
            <br />
            <em><a href="post.php?id=<?= urlencode($post['identifier']) ?>">Commentaires</a></em>
        </p>
    </div>
<?php
}
?>
<?php $content = ob_get_clean(); ?>

<?php require('layout.php') ?>
```

`ob_start()` permet d'enregistrer dans un buffer, les données. Celle ci sont sauvegarder dans la variable `content` et sont ensuite fournis au `layout` qui permet d'afficher le contenu de la page.

---

## Routeur 

`index.php`est le routeur principal. C'est lui qui vient récupérer les requêtes et les dirige vers la bonne page.


---

## Gestion d'erreur 

Les exceptions permette de gérer les erreurs pouvant de déclencher.

```php
<?php

try {
   // Essayer de faire quelque chose
} catch (Exception $e) {
   // Si une erreur se produit, on arrive ici
}

// exemple connexion de db
// Code avant

try {
    $database = new PDO('mysql:host=localhost;dbname=blog;charset=utf8', 'blog', 'password');
} catch(Exception $e) {
    die('Erreur : '.$e->getMessage());
}

// Code après
```

Pour générer une erreur

```php
<?php
throw new Exception('Message d\'erreur à transmettre');
```