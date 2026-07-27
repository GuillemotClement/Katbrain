# Flyway 

Gestionnaire de migration de base de données. Permet d'avoir un versionning des schemé de la DB et des données.

## Processus 

A chaque démarrage de l'application: 
1. Crée une table `flyway_schema_history` en DB -> suivi des migrations 
2. Lectures de tous les fichiers de migrations dans `db/migration/`
3. Compare "Quelle version j'ai déjà exécuté
4. Exécute uniquement les migrations nouvelles
5. Enregistre chaque migration dans `flyway_schema_history`

## Structure des fichiers

```tree
src/main/resources/
└── db/
    └── migration/
        ├── V1__Create_initial_schema.sql
        ├── V2__Insert_initial_categories.sql
        └── V3__Add_user_table.sql
```

**Format du nom de fichier**
```
V{VERSION}__{DESCRIPTION}.sql
```

- `V`: version -> obligatoire 
- `{VERSION}`: numéro croissant
- `__`: double underscore -> séparateur 
- `{DESCRIPTION}`: description lisible 

## Flow 

**Step 1: Ajout de la dépendance**
```xml
<!-- pom.xml -->
<dependency>
    <groupId>org.flywaydb</groupId>
    <artifactId>flyway-core</artifactId>
</dependency>

OU 
<plugin>
    <groupId>org.flywaydb</groupId>
    <artifactId>flyway-maven-plugin</artifactId>
    <version>12.9.0</version> 
</plugin>
```

**Step 2: Configuration Flyway**


**Step 3: Créeation des migrations**

Fichier 1: schéma 

```sql
-- src/main/resources/db/migration/V1__Create_initial_schema.sql

CREATE TABLE category (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE product (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP,
    deleted_at TIMESTAMP,
    user_id BIGINT NOT NULL,
    category_id BIGINT NOT NULL,
    FOREIGN KEY (category_id) REFERENCES category(id)
);

CREATE TABLE product_price (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    amount DECIMAL(10, 2) NOT NULL,
    recorded_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP,
    product_id BIGINT NOT NULL,
    FOREIGN KEY (product_id) REFERENCES product(id)
);
```

Donnée initiale

```sql
-- src/main/resources/db/migration/V2__Insert_initial_categories.sql

INSERT INTO category (name) VALUES ('Électronique');
INSERT INTO category (name) VALUES ('Maison');
INSERT INTO category (name) VALUES ('Livres');
INSERT INTO category (name) VALUES ('Jeux vidéo');
INSERT INTO category (name) VALUES ('Films & Séries');
INSERT INTO category (name) VALUES ('Vêtements');
```

---

## Bonne pratique 

**Interdit de modifier une migration déjà réalisée**

On vient créer une nouvelle migration pour modifier le nécessaire.