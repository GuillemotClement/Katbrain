# Shell 

## `echo` - afficher du texte 

```shell
echo "hello world"
```

## `expr` - evaluer une expression

```shell
expr 1 + 2
3
```

## `whoami` - afficher l'utilisateur

```shell
whoami
```

## Variable 

```shell
# declarer une variable
name="username"

# afficher une variable
echo $name

# interpolation
echo Hello $name 
# Hello username
```

## `history` - historique des commandes

```shell
history
```

---

## Base 

### Navigation 

- **Chemin absolu**: commence a la racine `/`. Par exemple `/home/student/documents`
- **Chemin relatif**: commence a partir du repertoire courant. Par exemple `documents/file.txt`

#### `cd` - deplacement 

#### `ls` - lister 

Permet de lister les elements du repertoire.

```shell
$ ls 
Documents Downloads Pictures Video

# informations detaille
$ ls -l 
drwxr-xr-x 2 student student 4096 Oct 21 10:00 Documents
-rw-r--r-- 1 student student  234 Oct 21 09:45 notes.txt

# afficher les types, droits, etc
```

#### `pwd` 

Affiche le repertoire actuel. 

```shell
$ pwd
/home/student
```

