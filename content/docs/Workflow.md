# Workflow d'apprentissage Go et gestion des notes

## Objectif

Construire une base de connaissances personnelle :

* claire ;
* concise ;
* réutilisable ;
* orientée compréhension et pratique.

Les notes ne doivent pas être une copie du cours, mais une synthèse des concepts réellement compris et utiles.

---

# Processus d'apprentissage

## 1. Lire la leçon

Lire la leçon une première fois sans chercher à tout noter.

Pendant la lecture, identifier :

* le problème que la notion résout ;
* les concepts importants ;
* les bonnes pratiques ;
* les pièges éventuels.

Questions à se poser :

* Pourquoi cette fonctionnalité existe ?
* Quel problème résout-elle ?
* Quand vais-je l'utiliser ?

---

## 2. Faire les exercices

Passer immédiatement aux exercices.

Les exercices servent à valider la compréhension réelle.

En cas de blocage :

1. relire la partie concernée ;
2. réessayer ;
3. consulter une aide ou la solution seulement en dernier recours.

---

## 3. Reformuler

Une fois les exercices terminés :

* fermer le cours ;
* expliquer la notion avec ses propres mots ;
* identifier ce qui est réellement important à retenir.

Si je suis incapable d'expliquer simplement la notion, alors elle n'est pas encore comprise.

---

## 4. Rédiger la note

La note est rédigée après la compréhension et la pratique.

Structure recommandée :

### Définition

Qu'est-ce que c'est ?

### Pourquoi ?

Quel problème est résolu ?

### Modèle mental

Comment comprendre ou visualiser le concept ?

### Quand l'utiliser ?

Cas d'utilisation typiques.

### Quand l'éviter ?

Situations où ce n'est pas adapté.

### Pièges

Erreurs fréquentes.

### Bonnes pratiques

Règles de conception importantes.

### Exemple minimal

Le plus petit exemple permettant d'illustrer le concept.

### Mon interprétation

Comment je compte utiliser cette notion dans mes projets.

---

# Règles de rédaction

## Ne pas recopier le cours

Le cours sert à comprendre.

La note sert à retenir.

Je ne stocke pas :

* les longues explications ;
* les répétitions ;
* les exemples multiples ;
* les détails facilement retrouvables dans la documentation.

---

## Utiliser ses propres mots

Une note doit être compréhensible même plusieurs mois après l'avoir écrite.

Si je copie le texte du cours, je risque d'oublier rapidement la notion.

---

## Une note = un concept

Éviter les documents contenant plusieurs concepts importants.

Exemple :

Mauvais :

```text
Interface.md
├── Interfaces
├── Valeur d'interface
├── Interface error
├── Conception d'interfaces
├── Composition d'interfaces
```

Meilleur :

```text
Interfaces/
├── interface.md
├── interface-value.md
├── interface-design.md
├── interface-composition.md
```

---

# Organisation de la documentation

## Principe

Organiser la documentation par domaine de connaissance et non par leçon de formation.

---

Exemple :

```text
Go/
├── Types/
├── Functions/
├── Structs/
├── Interfaces/
├── Errors/
├── Generics/
├── Concurrency/
└── Standard-Library/
```

---

## Dossiers

Un dossier représente un thème.

Exemples :

```text
Interfaces/
Errors/
Structs/
Concurrency/
```

---

## Fichiers

Un fichier répond à une seule question.

Exemples :

```text
interface.md
```

Répond à :

> Qu'est-ce qu'une interface ?

```text
interface-value.md
```

Répond à :

> Comment fonctionne une valeur d'interface ?

```text
interface-design.md
```

Répond à :

> Comment concevoir une bonne interface ?

---

## Index

Chaque dossier possède un index servant de sommaire.

Exemple :

```text
Interfaces/
├── index.md
├── interface.md
├── interface-value.md
├── interface-design.md
└── interface-composition.md
```

L'index référence les notions importantes du dossier.

---

# Critère de qualité d'une note

Une bonne note :

* se relit en moins de 2 minutes ;
* répond à une question précise ;
* contient uniquement l'information durable ;
* est écrite avec mes mots ;
* explique quand utiliser le concept.

Une mauvaise note :

* ressemble à un cours ;
* contient plusieurs pages d'explications ;
* mélange plusieurs concepts ;
* duplique la documentation officielle.

---

# Philosophie

Je ne cherche pas à archiver une formation.

Je cherche à construire progressivement ma propre documentation Go, orientée compréhension, pratique et développement backend.

