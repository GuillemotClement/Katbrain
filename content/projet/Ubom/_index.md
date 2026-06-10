# Roadmap 6 mois --- Transition Java Backend + Angular

## 🎯 Objectif principal

Construire un profil **Développeur Backend Java / Spring Boot**,
autonome sur **Angular** pour développer des interfaces modernes, avec
une bonne maîtrise de PostgreSQL et Docker.

Le projet fil rouge sera une **application de gestion de foyer**
(HomeHub) qui évoluera au rythme de la progression sur CodeGym.

---

# Stack cible

## Backend

- Java 21
- Spring Boot
- Spring Data JPA
- Spring Security
- Maven
- PostgreSQL
- Docker / Docker Compose

## Frontend

- Angular
- TypeScript
- Angular Router
- HttpClient

## Bonus (plus tard)

- Go pour les outils, scripts et petits microservices.
- GitHub Actions.
- Swagger / OpenAPI.

---

# Projet fil rouge : HomeHub

## Modules prévus

- Authentification.
- Stock alimentaire.
- Liste de courses.
- Menus de la semaine.
- Bibliothèque.
- Watchlist films/séries.
- Gestion de projets personnels.
- Suivi du budget.

**Règle importante :** \> Ne jamais essayer de tout développer en même
temps. Construire un module complet avant de passer au suivant.

---

# Phase 1 --- Fondations Java (CodeGym \~ chapitres 1 à 10)

## Objectifs CodeGym

- Variables.
- Conditions.
- Boucles.
- Méthodes.
- Premières notions de POO.

## Travail sur le projet

- Créer le dépôt Git.
- Définir l'architecture générale.
- Réaliser des maquettes simples.
- Initialiser le projet Angular.
- Mettre en place le routing et le layout (sidebar, header, pages
  vides).

### Livrable

- Projet GitHub initialisé.
- Frontend Angular avec navigation fonctionnelle.

---

# Phase 2 --- POO et modélisation (CodeGym \~ chapitres 10 à 20)

## Objectifs CodeGym

- Classes.
- Objets.
- Encapsulation.
- Héritage.
- Interfaces.
- Collections (`List`, `Map`, etc.).

## Travail sur le projet

Créer les modèles métier en Java : - FoodItem - Recipe - ShoppingItem -
Book - Movie - PersonalProject - Expense

Faire quelques tests dans une petite application console : - ajouter un
produit, - rechercher un produit, - générer une liste de courses simple.

### Livrable

- Modèle de domaine propre.
- Premiers objets métier fonctionnels.

---

# Phase 3 --- Premiers pas avec Spring Boot (CodeGym \~ chapitres 20 à 30)

## À apprendre

- Spring Initializr.
- Maven.
- `@RestController`.
- `@Service`.
- Injection de dépendances.
- API REST.

## Travail sur le projet

Créer une première API :

- GET /foods
- POST /foods
- DELETE /foods/{id}

Dans un premier temps, utiliser une liste en mémoire.

Côté Angular : - afficher la liste, - créer un formulaire, - consommer
l'API via HttpClient.

### Livrable

- Première boucle complète Front → API → Réponse.

---

# Phase 4 --- Base de données (CodeGym \~ chapitres 30 à 40)

## Objectifs CodeGym

- Exceptions.
- Génériques.
- Lambdas.
- Streams API.

## À apprendre côté Spring

- PostgreSQL.
- Docker Compose.
- Spring Data JPA.
- Hibernate.

## Travail sur le projet

Remplacer les données en mémoire par PostgreSQL.

Créer les premières entités persistées : - foods, - categories, -
recipes, - shopping_items.

### Fonctionnalités

- CRUD stock alimentaire.
- CRUD catégories.
- Liste de courses.

### Livrable

- Première vraie application connectée à une base de données.

---

# Phase 5 --- Authentification

## À apprendre

- Spring Security.
- JWT (ou session classique dans un premier temps).

## Travail sur le projet

- Inscription.
- Connexion.
- Gestion d'un utilisateur propriétaire des données.

### Livrable

- Application multi-utilisateur.

---

# Phase 6 --- Module Menus + Liste de courses

## Fonctionnalités

- Création de recettes.
- Association recette ↔ ingrédients.
- Planning hebdomadaire des repas.
- Génération automatique de la liste de courses.

### Objectif

Commencer à manipuler une logique métier plus riche qu'un simple CRUD.

---

# Phase 7 --- Modules complémentaires

Ajouter progressivement : 1. Bibliothèque. 2. Watchlist. 3. Gestion de
projets. 4. Budget.

Chaque module doit suivre la même architecture : - Entity. -
Repository. - Service. - Controller. - Écran Angular.

---

# Phase 8 --- Qualité et Portfolio

## Backend

- Tests unitaires.
- Tests d'intégration.
- Refactoring.
- Documentation Swagger.

## Infra

- Docker Compose complet.
- GitHub Actions (build + tests).

## Portfolio

- Captures d'écran.
- README détaillé.
- Explication des choix techniques.
- Démo vidéo éventuelle.

---

# 📅 Organisation hebdomadaire

Activité Temps conseillé

---

CodeGym Java 1h30 / jour
Projet HomeHub 1h à 2h / jour
Portfolio 2 à 3 sessions par semaine
Lecture / veille 20 à 30 min quand envie

---

# 🧠 Règles de conduite

## 1. Ne pas changer de stack principale

Pendant les 6 mois : - Java / Spring Boot. - Angular. - PostgreSQL. -
Docker.

Go reste en pause et reviendra plus tard pour les outils techniques.

## 2. Alterner théorie et pratique

Quand CodeGym devient pénible : - travailler sur le portfolio, - ou
implémenter une fonctionnalité du projet HomeHub.

## 3. Chercher le MVP, pas la perfection

Le projet doit vivre et fonctionner avant d'être parfait. Le refactoring
viendra après.

## 4. Une notion apprise = une utilisation dans le projet

Chaque nouveau concept Java ou Spring doit être réinvesti dans HomeHub.

---

# 🎯 Objectif final (fin des 6 mois)

Être capable de présenter un profil de :

> **Développeur Backend Java / Spring Boot**
>
> - API REST.
> - PostgreSQL.
> - Docker.
> - Angular au niveau autonome.
> - Projet métier complet développé de bout en bout.
> - Utilisation de Go pour des outils et microservices annexes.

Le but n'est pas de devenir expert Angular ou expert Spring
immédiatement, mais de construire une base solide et cohérente pour une
carrière backend orientée applications métier.
