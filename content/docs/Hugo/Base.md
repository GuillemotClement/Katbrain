# Commandes

## Template

Dans le dossier `archetypes`, on peut venir définir des templates réutilisable pour générer de nouvels notes. 

```shell
-- syntaxe
hugo new [path]/[note_name].md --kind [template_name]

-- exemple 
hugo new docs/Go/Language/Interface/Interface Nil.md --kind ln 
hugo new docs/Java/ --kind ln
```

## Lancer le serveur local 

```shell
hugo server --buildDrafts --disableFastRender
```

# Erreur 

## Déploiement - 403

Une erreur 403 sur la version **build** indique une configuration `draft`. Dans le fichier `.md`, vérifier dans les front-matter que `draft: false`.

---
