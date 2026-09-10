# 02 - Filtre, Trie et Pagination 

## `LIMIT` - Limiter le nombre de lignes 

Permet de définir le nombre de lignes retourner par la requête. Permet de réduire la charge du serveur et du réseau et de simplifier l'analyse des données issue de la requête.

Le trie se fait de manière aléatoire, il faut utiliser `LIMIT` avec un `ORDER BY` afin de fixer l'ordre d'affichage des données.

```sql
-- ====================================
-- Syntaxe 
-- ====================================
SELECT colonne1, colonne2
FROM table
LIMIT nombre_de_lignes;

-- =====================================
-- obtenir les 3 premiers étudsiants
-- ======================================
SELECT *
FROM students
LIMIT 3;

-- =======================================
-- nom et prix des 5 articles les plus chère
-- =======================================
SELECT product_name, price
FROM products
ORDER BY price DESC
LIMIT 5;

-- =======================================
-- combinaison avec WHERE 
-- ========================================
SELECT *
FROM students
WHERE age > 18
LIMIT 5;

-- =========================================
-- afficher la première page de donnée 
-- =========================================
SELECT *
FROM employees
ORDER BY hire_date
LIMIT 10;

-- ==========================================
-- les trois catégories les plus populaire
-- ==========================================
SELECT category, COUNT(*) AS total_products
FROM products
GROUP BY category
ORDER BY total_products DESC
LIMIT 3;  
```

---

## `OFFSET` - saut de ligne et pagination 

`OFFSET` permet de sauter des lignes dans les résultats d'une requête.

```sql 
-- ================================
-- syntaxe 
-- ================================
SELECT colonne1, colonne2
FROM table
OFFSET nombre_de_lignes; -- nombre de ligne à sauter

-- ===================================
-- afficher les étudiants à partir du troisièmes
-- =====================================
SELECT *
FROM students
OFFSET 2;

-- =====================================
-- afficher 2 lignes à partir de la troisième ligne 
-- =====================================
SELECT *
FROM students
LIMIT 2
OFFSET 2;
```

### Mettre en place une pagination 

Principe de base :
- Première page: on saute 0 ligne 
- Deuxieme page: on saute 2 lignes
- etc ...

```sql
-- ==========================
-- méthode manuel 
-- ==========================
-- premiere page 
SELECT *
FROM students
ORDER BY id
LIMIT 2;

-- deuxieme page 
SELECT *
FROM students
ORDER BY id
LIMIT 2
OFFSET 2;

-- troisieme page 
SELECT *
FROM students
ORDER BY id
LIMIT 2
OFFSET 4;
```

**Formule pour calculer OFFSET**

```sql
-- formule 
OFFSET = (numero_page - 1) * nb_enregistrement_par_page
```

**Pagination avec curseur**

Pour optimiser, on peut utiliser la technique du curseur. Au lieu de sauter les lignes avec `OFFSET`, on mémore l'id de la dernière ligne reçue sur la page précédente, et on viens l'utiliser pour la requête suivante:

```sql 
SELECT *
FROM students
WHERE id > dernier_id_affiche
ORDER BY id
LIMIT 2;
```