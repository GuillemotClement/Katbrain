# 23 - JSON

## Module `json`

Le module `json` fournit des fonctions pour la sérialisation (python -> JSON) et déserialisation (JSON -> Python).

**Travail avec des fichiers**

- `json.dump(obj, file)` - objet JSON -> fichier texte
- `json.load(file)` - déserialize un objet python depuis un fichier texte contenant des données au format JSON

### `json.dumps(obj)` - Objet Python -> chaîne JSON

```python
import json

# Exemple d'objet pour la sérialisation
data = {
    "name": "Alice",
    "age": 30,
    "is_student": False,
    "courses": ["Math", "Science"],
    "address": {
        "city": "New York",
        "zip_code": "10001"
    }
}

# Conversion de l'objet Python en chaîne JSON
json_string = json.dumps(data, indent=4)
print("Données sérialisées (JSON):", json_string)
```

### `json.loads(s)` - Json -> Python

```python
import json

# Exemple de chaîne JSON pour la désérialisation
json_string = ''' { "name": "Alice", "age": 30, "is_student": false, "courses": ["Math", "Science"], "address": { "city": "New York", "zip_code": "10001" } } '''

# Conversion de la chaîne JSON en objet Python
data = json.loads(json_string)
print("Données désérialisées (Python):", data)
```

### `json.dump(obj, file)` - objet json dans un fichier au format json

```python
import json

# Exemple d'objet pour la sérialisation
data = {
    "name": "Bob",
    "age": 25,
    "is_student": True,
    "courses": ["History", "Literature"],
    "address": {
        "city": "Los Angeles",
        "zip_code": "90001"
    }
}

# Écriture de l'objet Python dans un fichier JSON avec gestion des exceptions
try:
    with open('data.json', 'w') as file:
        json.dump(data, file, indent=4)
    print("Données écrites avec succès dans le fichier.")
except IOError:
    print("Erreur lors de l'écriture dans le fichier.")
except json.JSONEncodeError:
    print("Erreur lors de l'encodage JSON.")
```

### `json.load()` - lecture d'objet Python depuis un fichier au format JSON

```python
import json

# Lecture de l'objet Python à partir du fichier JSON avec gestion des exceptions
try:
    with open('data.json', 'r') as file:
        data = json.load(file)
    print("Données désérialisées du fichier (Python):", data)
except IOError:
    print("Erreur lors de la lecture du fichier.")
except json.JSONDecodeError:
    print("Erreur lors du décodage JSON.")
```

### Paramètre supplémentaire

Dans la fonction qui s'occupe de la sérialisation, on peut passer des paramètres suipplémentaire pour améliorer la lisibilité du json :

- `skipkeys`: `True` ignore les clés qui ne sont pas des chaînes
- `ensure_ascii`: caractère non ASCII seront échappés
- `indent`: prends un nombre. Les indentations seront ajoutées
- `sort_key`: si `True`, les clé JSON seront triées

```python
import json

data = {"c": 3, "b": 2, "a": 1}

# Sérialisation avec tri des clés et indentations
json_string = json.dumps(data, indent=4, sort_keys=True)
print(json_string)
```

### Encodeur et décodeur personnalisées

```python
# ====================================
# encodeur personalisé
# ====================================
import json
from datetime import datetime

class CustomEncoder(json.JSONEncoder):
    def default(self, obj):
        if isinstance(obj, datetime): return obj.isoformat()
        return super().default(obj)

data = {
    "name": "Alice",
    "timestamp": datetime.now()
}

# Sérialisation avec un encodeur personnalisé
json_string = json.dumps(data, cls=CustomEncoder, indent=4)
print(json_string)

# ===========================================
# décodeur personnalisé
# ===========================================
import json
from datetime import datetime

def custom_decoder(dct):
    if 'timestamp' in dct: dct['timestamp'] = datetime.fromisoformat(dct['timestamp'])
    return dct

json_string = '''
{
    "name": "Alice",
    "timestamp": "2023-05-15T14:30:00"
}
'''

# Désérialisation avec un décodeur personnalisé
data = json.loads(json_string, object_hook=custom_decoder)
print(data)
```

---

## Module `requests` - Travail avec le réseau

Ce module permet de gérer les requêtes HTTP.

### Installation du module

```python
# ==============================
# installation du module
# ==============================
pip install requests
```

### Utilisation

**Déterminer son addresse IP interne**

```python
import requests

response = requests.get("http://ip.jsontest.com/") # envoie de la requête vers le service
print(response.status_code)  # Affiche le code de statut de la réponse
print(response.json())       # Affiche la réponse JSON
```

**Envoie d'une requête GET**

```python
# =====================================
# GET sans paramètres
# =====================================
import requests

response = requests.get('https://jsonplaceholder.typicode.com/posts')
print(response.status_code)  # Affiche le code de statut de la réponse
print(response.json())       # Affiche la réponse JSON

# ======================================
# GET avec paramètres
# ======================================
import requests

params = {'userId': 1}
response = requests.get('https://jsonplaceholder.typicode.com/posts', params=params)
print(response.json())
```

**Envoie d'une requêtes POST**

```python
# ===========================
# POST
# ===========================
import requests

# données envoyer avec la requête
data = {
    'title': 'foo',
    'body': 'bar',
    'userId': 1
}
response = requests.post('https://jsonplaceholder.typicode.com/posts', json=data)
print(response.status_code)
print(response.json())
```

**Envoie d'une requête PUT**

```python
# ==========================
# PUT
# ==========================
import requests

data = {
    'title': 'foo',
    'body': 'bar',
    'userId': 1
}
response = requests.put('https://jsonplaceholder.typicode.com/posts/1', json=data)
print(response.status_code)
print(response.json())
```

**Envoie d'une requête DELETE**

```python
import requests

response = requests.delete('https://jsonplaceholder.typicode.com/posts/1')
print(response.status_code)
print(response.json())
```

### Traitement des réponses

Le module fournis des méthodes pour traiter les réponses du serveur.

**Code status**
Le serveur envoie un statut pour le traitement de la requête.

```python
import requests

response = requests.get('https://jsonplaceholder.typicode.com/posts/1')

print(response.status_code)  # Affiche le code de statut de la réponse
print(response.reason)  # Affiche la description textuelle du statut
print(response.ok)  # Retourne True si le code de statut est inférieur à 400
```

**Headers**

```python
import requests

response = requests.get('https://jsonplaceholder.typicode.com/posts/1')

print(response.headers)  # Affiche les en-têtes de la réponse
print(response.headers['Content-Type'])  # Affiche la valeur d'un en-tête spécifique
```

**Body**

```python
import requests

response = requests.get('https://jsonplaceholder.typicode.com/posts/1')

print(response.text)  # Affiche le corps de la réponse sous forme de texte
print(response.json())  # Affiche le corps de la réponse sous forme de JSON
print(response.content)  # Affiche le corps de la réponse sous forme d'octets
```

### Gestion d'erreurs

Le module fournis des exceptions permettant de gérer les erreurs. Pour qu'une exception soit générée en cas de requête échouer, il faut utiliser la fonction `raise_for_status()`

```python
import requests

try:
    # envoie de la requête
    response = requests.get('https://jsonplaceholder.typicode.com/posts/1')
    response.raise_for_status()  # Génère une exception pour les codes de statut 4xx et 5xx
except requests.exceptions.HTTPError as err:
    print(f"Une erreur HTTP est survenue : {err}")
except Exception as err:
    print(f"Une autre erreur est survenue : {err}")
else:
    print("Succès !")
```

### Envoie de donnée

**Envoie de donnée avec GET**

```python
import requests

params = {'key1': 'value1', 'key2': 'value2'}
response = requests.get('https://httpbin.org/get', params=params)
print(response.url)  # Affiche l'URL avec les paramètres ajoutés
```

**Envoie de données de formulaire**

```python
import requests

data = {
    'username': 'example',
    'password': 'password'
}
response = requests.post('https://httpbin.org/post', data=data)
print(response.json())
```

**Envoie de fichiers**
Pour l'envoie d'image, ou de fichier, il faut passer le fichier dans la requête avec le paramètre `files`

```python
# ============================
# envoie d'un fichier
# ============================
import requests

with open('example.txt', 'rb') as f:
    files = {'file': f}
    response = requests.post('https://httpbin.org/post', files=files)
print(response.json())
```

### Authentification

Une fois la connexion réussie, on obtient un objet `session` qui contient le numéro de la session autorisé sur le serveur. Pour les requêtes suivante, il est nécessaire d'utiliser cet objet

```python
# ================================
# authentification
# ================================
import requests
from requests.auth import HTTPBasicAuth

response = requests.get('https://httpbin.org/basic-auth/user/pass', \
                        auth=HTTPBasicAuth('user', 'pass'))
print(response.status_code)
```

### Utilisation des sessions

Les sessions permettent de conserver des paramètres entres les requêtes, comme les `cookies` ou les informations d'autorisation de l'utilisateur.

```python
import requests

payload = {
    'username': 'your_username',
    'password': 'your_password'
}

# Création de la session
session = requests.Session()

# Connexion au site
login_response = session.post('https://example.com/login', data = payload)

# Poursuite du travail avec la session de l'utilisateur connecté
data_response = session.get('https://example.com/api/data')
print(data_response.json())
```

## `http.client`

Il permet d'effectuer des requêtes HTTP de bas niveau et de travcailler avec les répenses HTTP. Il permet de créer des connexions aux serveurs HTTP et d'intéragir avec.

### Utilisation 

**Requête GET**

1. Etablir une connexion
2. Envoye la requête
3. Recevoir la réponse
4. Fermer la connexion 

```python
import http.client

# Création de la connexion
conn = http.client.HTTPSConnection("jsonplaceholder.typicode.com")

# Envoi de la requête GET
conn.request("GET", "/posts/1")

# Recevoir la réponse
response = conn.getresponse()
print(response.status, response.reason)

# Lecture et décodage des données de la réponse
data = response.read().decode('utf-8')
print(data)

# Obtenir tous les en-têtes de la réponse
headers = response.getheaders()
for header in headers:
    print(f"{header[0]}: {header[1]}")

# Fermeture de la connexion
conn.close()
```

**Requête POST**

Les données doivent être convertis en JSON il faut ajouter un en-tête `Content-Type`

```python 
import http.client
import json

# Données à envoyer
payload = json.dumps({
    "title": "foo",
    "body": "bar",
    "userId": 1
})

# En-têtes
headers = {
    'Content-Type': 'application/json'
}

# Création de la connexion
conn = http.client.HTTPSConnection("jsonplaceholder.typicode.com")

# Envoi de la requête POST
conn.request("POST", "/posts", body=payload, headers=headers)

# Recevoir la réponse
response = conn.getresponse()
print(response.status, response.reason)

# Lecture et décodage des données de la réponse
data = response.read().decode('utf-8')
print(data)

# Fermeture de la connexion
conn.close()
```

### Gestion d'erreur 

`http.client` lève automatiquement les exceptions en cas de problèmes

```python 
import http.client

try:
    # Création de la connexion
    conn = http.client.HTTPSConnection("jsonplaceholder.typicode.com")

    # Envoi de la requête GET
    conn.request("GET", "/posts/1")

    # Recevoir la réponse
    response = conn.getresponse()
    print(response.status, response.reason)

    # Lecture et décodage des données de la réponse
    data = response.read().decode('utf-8')
    print(data)

except http.client.HTTPException as e:
    print("Erreur HTTP s'est produite:", e)
except Exception as e:
    print("Une erreur s'est produite:", e)
finally:
    # Fermeture de la connexion
    conn.close()
```