# 🧠 KatBrain - Vision & Idées

## Contexte

Initialement, l'objectif était simplement de remplacer MkDocs pour disposer d'une documentation plus flexible et plus simple à personnaliser.

Au fil de l'exploration de Hugo et Hextra, l'idée a progressivement évolué vers un véritable système de gestion de connaissances et de projets destiné aux développeurs.

L'objectif n'est plus uniquement de documenter, mais de construire un véritable **second cerveau numérique**.

---

# Vision

KatBrain est un système de gestion de connaissances destiné aux développeurs.

Il centralise :

* Documentation technique
* Notes personnelles
* Connaissances
* Projets
* Décisions d'architecture
* Retours d'expérience
* Roadmaps
* Objectifs

Le tout dans des formats ouverts et pérennes.

---

# Philosophie

## Local First

Les données appartiennent à l'utilisateur.

Aucun service cloud n'est requis.

---

## Open Formats

Toutes les données sont stockées sous forme de :

* Markdown
* YAML
* Git

Aucun format propriétaire.

---

## Self Hostable

KatBrain doit pouvoir être déployé partout :

* VPS
* Docker
* Coolify
* GitHub Pages
* Serveur personnel

---

## Hackable

L'utilisateur reste libre de modifier :

* Le thème
* Les layouts
* Les shortcodes
* Les composants
* Les workflows

---

# Architecture

```txt
Markdown
     │
     ▼
 KatBrain
     │
     ▼
    Hugo
     │
     ▼
 Site statique
```

---

# Contenus

## Documentation

* Go
* Docker
* PostgreSQL
* Hugo
* Symfony
* NestJS
* Linux

---

## Projects

Documentation complète des projets :

* Présentation
* Architecture
* Déploiement
* Monitoring
* Roadmap
* Retours d'expérience

---

## Knowledge Base

* Notes
* Concepts
* Snippets
* Cheatsheets
* Références

---

## Decisions

* ADR
* Choix techniques
* Compromis
* Historique

---

# Katogo

## Vision

Katogo est le compagnon CLI de KatBrain.

L'objectif est de fournir une interface de travail orientée terminal permettant :

* Capture rapide
* Gestion du focus
* Gestion des tâches
* Suivi du temps

---

## Fonctionnalités

### Focus

* Pomodoro
* Sessions personnalisées
* Notifications

### Tasks

* Création
* Suivi
* Progression

### Notes

* Capture rapide
* Création automatique de notes

### Statistics

* Temps travaillé
* Sessions focus
* Historique

---

# Intégration KatBrain ↔ Katogo

Principe :

```txt
Katogo
    │
    │ écrit
    ▼
Markdown / YAML
    │
    ▼
KatBrain
    │
    │ affiche
    ▼
Dashboard
```

---

# Cas d'usage

## Gestion de tâches

```bash
katogo task add
```

Ajoute une tâche dans :

```yaml
data/tasks.yaml
```

Puis KatBrain l'affiche automatiquement.

---

## Session Focus

```bash
katogo focus start
```

Enregistre :

* durée
* projet
* tâche

Puis KatBrain affiche :

* temps passé
* sessions
* progression

---

## Capture d'idées

```bash
katogo note create
```

Crée automatiquement une note Markdown dans KatBrain.

---

# Fonctionnalités futures

## GitHub

* Activité des projets
* Derniers commits
* Langages utilisés
* Statistiques globales

---

## Dashboard

Vue d'ensemble :

* Projets actifs
* Tâches ouvertes
* Temps travaillé
* Dernières notes

---

## Roadmaps

Suivi des objectifs :

* Court terme
* Moyen terme
* Long terme

---

## Learning Journal

Historique d'apprentissage :

* Ce qui a été appris
* Quand
* Sur quel projet

---

# Distribution

## Utilisation personnelle

KatBrain reste le cerveau numérique principal.

---

## Open Source

Possibilité de publier :

* KatBrain Template
* Katogo CLI

afin que d'autres développeurs puissent construire leur propre second cerveau.

---

# Positionnement

KatBrain n'est pas :

* Un clone de Notion
* Un clone de Todoist
* Un clone d'Obsidian

KatBrain est :

> Un second cerveau pour développeurs construit sur des formats ouverts.

---

# Slogan

## KatBrain

> Own your knowledge.

ou

> A second brain built on open formats.

---

## Katogo

> Focus. Track. Build.

