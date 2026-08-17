# Tmux

[Doc](https://blog.stephane-robert.info/docs/outils/systeme/tmux/)

- `Ctrl + B`: prefix pour que tmux capture la saisie `(C-b)` dans la doc. (C-b d) => Ctrl + b + touche d

## Session 

```shell
tmux new -s [name_session]
```

Démarre une nouvelle session nommée en serveur en arrière plan.

## Commande 

```shell
# détachement de la session => sort de la session
C-b d

# lister les session en cours
tmux ls

# rattacher sur une session
tmux attach -t [name_session]
# connection à la dernière session
tmux attach

# fermer la fenêtre
exit

# supprimer la session
tmux kill-session -t [name_session]

# renommer la session
C-b $

# lister les sessions
C-b s

# nouvelle fenetre
C-b c 
# fenetre suivante
C-b n
# fenetre precedente 
C-b p 
# renommer la fenetre actuel 
C-b ,
# lister les fenetre
C-b w 

# split horizontale
C-b \"
# split vertical
C-b %
# naviguer entre les panels
C-b fleches
# fermer le panel 
C-b x

# doc
C-b ?
```

## Configuration

Dans `~/.tmux.conf`. A créer si nécessaire.