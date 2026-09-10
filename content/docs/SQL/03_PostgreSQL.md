# PostgreSQL 

## Commande 

```shell
# connexion au serveur 
psql -U postgres

# changer le mdp 
ALTER ROLE {role_name} PASSWORD '{new_passwor}';

# créer un nouvel user 
createuser --interactive 

# configurer le port 
nano /usr/local/var/postgres/postgresql.conf

# COMMANDE PG 

# créer une base de donnée
CREATE DATABASE {db_name}

# voir la liste des bases 
\l

# connection à une base 
\c {db_name}

# quitter la session 
\q

# obtenir la version postgreSQL
SELECT version();

# afficher le port actuel
SELECT name, setting 
FROM pg_settings
WHERE name = 'port';

# obtenir la date et heure du serveur 
SELECT now()::text;
```