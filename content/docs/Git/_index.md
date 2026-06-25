# Git 

## Bonne pratique de commit 

**Rédaction de messages clairs selon le standards**

```
<type> : <description courte>

# exemple 
fix: Correct user login validation
docs: Update installation instructions
```

- `feat`: nouvelle fonctionnalité
- `fix`: correction de bug 
- `docs`: changement de documentation 
- `style`: ajustestement de formatage qui n'affecte pas la logique de code 
- `refactor`: changement de code qui n'ajoute pas de fonctionnalités et ne corrige pas d'erreurs
- `test`: ajout ou correction de test
- `chore`: tâche de routine non liées au code (maj dépendances, configuration de build)

**Un commit = un changement logique**
Chaque commit doit résoudre une seule tâche spécifique

```
# exemple 
feat: Add avatar upload to user profile
fix: Correct username validation logic
style: Update button colors on user page
```

**Un commit ne doit pas casser le projet**
Chaque commit dans la `main` doit laisser le projet en état de fonctionnement.