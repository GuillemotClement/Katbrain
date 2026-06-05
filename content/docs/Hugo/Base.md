# Lancer le serveur local 

```shell
hugo server --buildDrafts --disableFastRender
```

# Erreur 

## 403 

Une erreur 403 sur la version **build** indique une configuration `draft`. Dans le fichier `.md`, vérifier dans les front-matter que `draft: false`.
