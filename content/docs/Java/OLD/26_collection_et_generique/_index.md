# Collection et générique

## Collection

Une collection est un objet qui sert de conteneur pour stocker un groupe d'autres objets. Les collections permettent d'ajouter, de supprimer, d'itérer sur les éléments, ainsi que d'effectuer d'autres opérations: recherche, tri, filtrage, etc

En Java, toutes les collections implémentent ou héritent de l'interface `Collection`, ou pour les association, de `Map`. Une collection c'est une structure qui fournit un ensemble de méthodes pratique pour travailler avec des éléments.

Les collections sont implémentées sous forme de classes. On peut créer des collections de n'importe quels objetsm les combiner, les hériter, les étendre, et les utiliser dans ses propres classes et méthodes.

```java
import java.util.ArrayList;
import java.util.List;

// création de la collection
List<String> students = new ArrayList<>();
// ajouts des éléments
students.add("John");
students.add("Maria");
students.add("Alex");
```

### Tâches résolue par les collections

- **Stockage d'une liste de données dynamique**
- **Recherche et filtrage**: trouver rapidement un élément, vérifier sa présence, obtenir tous les éléments
- **Tri**: Trier facilement les éléments selon le critère voulu
- **Groupement par clé**
- **Garantie d'unicité**
- **Suppression et ajoute d'éléments**

**Collection d'objet de classe**

```java
import java.util.ArrayList;
import java.util.List;

class Student {
    String name;
    int age;
    // Constructeur, getters/setters, etc.
}

public class Main {
    public static void main(String[] args) {
        List<Student> group = new ArrayList<>();
        group.add(new Student("John", 20));
        group.add(new Student("Maria", 21));
        // et ainsi de suite...
    }
}
```

---

## List: `ArrayList` et `LinkedList`, opération de base

### Classe `ArrayList`

En Java, l'interface `List` est un contrat: Je suis une collection ordonnée d'éléments, et on peut obtenir un élément par son numéro (indice).

\*\*Propriétés clés d'une `List`:

- Les éléments sont stokés dans un ordre définis
