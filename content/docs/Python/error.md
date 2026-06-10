---
date: 2026-06-09T22:34:20+02:00
---
# Error

## `try-except`: gestion des exceptions 

Le bloc `try` est exécuté. Dans le cas d'une exception, le bloc `except` est exécuté.

Le bloc `try/except` permet de récupérer l'erreur, et d'empêcher un crash du programme. 

```python
try:
  10 / 0
except Exception as e:
  print(e) # e contient la data de l'exception

# prints "division by zero"
```