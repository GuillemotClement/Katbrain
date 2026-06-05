# 📧 KatMail

## Présentation

KatMail est un microservice dédié à l'envoi d'emails transactionnels depuis des applications statiques ou découplées.

Son objectif est de fournir une interface simple et sécurisée permettant à un formulaire de contact, hébergé sur un site statique, de transmettre des données qui seront ensuite relayées vers un fournisseur d'email tiers.

Cette approche permet de conserver les avantages d'un site statique tout en disposant d'une fonctionnalité d'envoi d'emails fiable et maintenable.

---

## 🎯 Objectif

Les sites statiques ne disposent pas de logique serveur capable de traiter directement les formulaires de contact.

KatMail agit comme intermédiaire entre le frontend et le fournisseur d'email :

```txt
Visiteur
    │
    ▼
Formulaire de contact
    │
    ▼
KatMail API
    │
    ▼
Provider Email
    │
    ▼
Boîte de réception
```

Le frontend transmet les informations du formulaire à KatMail via une requête HTTP.

Le service valide les données reçues, construit le message puis le transmet au fournisseur d'email configuré.

---

## ⚙️ Fonctionnalités

* Réception des données de formulaire
* Validation des entrées utilisateur
* Construction des emails
* Envoi vers un fournisseur SMTP ou API
* Gestion centralisée des configurations d'envoi
* Journalisation des demandes
* Réponses HTTP standardisées

---

## 🏗️ Cas d'usage

KatMail est particulièrement adapté pour :

* Portfolios personnels
* Sites vitrines
* Blogs statiques
* Documentations techniques
* Landing pages
* Applications frontend découplées

---

## 🚀 Avantages

### Séparation des responsabilités

Le frontend reste concentré sur l'expérience utilisateur tandis que KatMail gère toute la logique d'envoi.

### Réutilisabilité

Un même service peut être utilisé par plusieurs sites ou applications.

### Sécurité

Les identifiants SMTP et les clés API restent stockés côté serveur et ne sont jamais exposés au navigateur.

### Maintenabilité

Le changement de fournisseur d'email ne nécessite aucune modification du frontend.

---

## 🔮 Évolutions envisagées

* Templates HTML
* Gestion des pièces jointes
* Limitation du trafic (Rate Limiting)
* Protection anti-spam
* Files d'attente asynchrones
* Tableau de bord d'administration
* Statistiques d'envoi

---

> Simple. Reliable. Delivered.

