# Opération de base 

## Ordre d'exécution des requêtes 

1. La table dans `FROM` est traitée: le serveur trouve la table indiquée 
2. Les conditions sur les lignes sont appliquées: seul les lignes qui valide les conditions sont récupérées
3. Les colonnes demandée sont sélectionnées

## Commentaire 

```SQL 
-- commentaire une ligne 
```

## `SELECT` 

Permet d'extraire les données d'une table.

```sql
-- ======================================
-- syntaxe 
-- ======================================
SELECT colonne1, colonne2, … colonneN
FROM table

-- =======================================
-- extraite toutes les colonnes d'une table 
-- ========================================
SELECT * FROM students

-- ========================================
-- extraire certaine colonnes 
-- ========================================
SELECT name, age FROM students
```

### Sélection avec alias - `as`

Permmet de donner un nouveau nom dans le résultat 

```sql 
-- ==========================================
-- sélection avec alias 
-- ==========================================
SELECT 
  first_name AS "Prénom", 
  last_name AS "Nom de famille", 
  grade AS "Note"
FROM students;
```

### Concaténation de colonne

```sql
-- =========================================
-- concatèner deux colonnes dans une colonne du résultat 
-- =========================================
SELECT 
  first_name || ' ' || last_name  AS "Nom complet", 
  grade  AS "Note"
FROM students;
```

---

## `WHERE` - Filtrage des données 

```sql 
-- ======================================
-- syntaxe 
-- ======================================
SELECT colonne1, colonne2
FROM table
WHERE condition;

-- ========================================
-- filtre les étudiants agé de + 18 ans 
-- ========================================
SELECT name, age
FROM students
WHERE age > 18;
```

### Opérateur de comparaison 

| Opérateur | Signification | Exemple | Résultat |
| --------- | ------------- | ------- | -------- |
| `=` | Égal | `age = 20` | Retourne les lignes où l'âge est 20 |
| `<>` | Différent | `age <> 20` | Retourne les lignes où l'âge est différent de 20 |
| `>` | Supérieur | `age > 20` | Retourne les lignes où l'âge est supérieur à 20 |
| `<` | Inférieur | `age < 20` | Retourne les lignes où l'âge est inférieur à 20 |
| `>=` | Supérieur ou égal | `age >= 20` | Retourne les lignes où l'âge est 20 ou supérieur |
| `<=` | Inférieur ou égal | `age <= 20` | Retourne les lignes où l'âge est 20 ou inférieur |

### Opérateur logique 

- `AND`: les deux conditions sont vraie - 2 
- `OR`: au moins une des conditons est vraie - 3
- `NOT`: inverse la condition - 1

```sql 
-- ==================================
-- syntaxe 
-- ==================================
SELECT colonne1, colonne2
FROM table
WHERE condition AND condition2;

-- ====================================
-- retourne les étudiants de plus de 18 ans avec une note A 
-- ====================================
SELECT name, age, grade
FROM students
WHERE age > 18 AND grade = 'A';

-- ====================================
-- retourne les étudiants avec la note A ou B
-- ====================================
SELECT name, age, grade
FROM students
WHERE grade = 'A' OR grade = 'B';

-- ======================================
-- retourne les étudiants qui n'ont pas la note A 
-- =======================================
SELECT name, age, grade
FROM students
WHERE NOT grade = 'A';
```

#### Combinaise des opérateurs logique 

```sql
-- =====================================
-- syntaxe 
-- =====================================
SELECT colonne1, colonne2
FROM table
WHERE (condition1 AND condition2) OR condition3;

-- =====================================
-- retourne les étudiants de plus de 18 ans ET avec la note A OU B
-- =====================================
SELECT name, age, grade
FROM students
WHERE (age > 18 AND grade = 'A') OR grade = 'B';
```

---

## ORDER BY - tri croissant et décroissant 

Permet de trier dans un ordre précis les données retourner par la requête

```sql 
-- ==================================
-- syntaxe 
-- ==================================
SELECT colonne1, colonne2
FROM table
ORDER BY colonne1 DESC;

-- ===================================
-- trie les étudiants par âge croissant
-- ===================================
SELECT name, age
FROM students
ORDER BY age ASC;

-- ======================================
-- trie les étudiants par âge décroissant 
-- ======================================
SELECT name, age
FROM students
ORDER BY age DESC;
```

### Trie sur plusieurs colonnes 

Les données sont trié par la premiére colonne, puis par la suivante 

```sql 
-- ===================================================
-- syntaxe 
-- ===================================================
SELECT colonne1, colonne2
FROM table
ORDER BY colonne1 DESC, colonne2 ASC;

-- ======================================================
-- trie par âge puis par nom 
-- ======================================================
SELECT name, age
FROM students
ORDER BY age ASC, name ASC;
```

### Trie avec des alias 

```sql 
-- ==================================
-- trie avec alias 
-- ==================================
SELECT name AS "Nom", age AS "Âge"
FROM students
ORDER BY "Âge" DESC;
```

### Trie avec colonnes calculées 

```sql 
-- ======================================
-- trie sur calcul simple 
-- ======================================
SELECT name, age, age * 2 AS age_doublé
FROM students
ORDER BY age_doublé DESC;

-- =======================================
-- trie sur résultat de fonction 
-- =======================================
SELECT product_name, price, ROUND(price * 0.9, 1) AS prix_remisé
FROM products
ORDER BY prix_remisé ASC;
```