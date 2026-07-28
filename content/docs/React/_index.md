# React

## Nouveau projet avec Vide

```shell
npm create vite@latest [project_name] -- --template react
```

---

- `main.jsx`: point d'entrée de l'application
- `App.jsx`: composant root

## Définition d'un composant

```jsx
// composant de base React
const App = () => (
  <div>
    <p>Hello world</p>
  </div>
);

export default App;
```

Tout code JS dans les accolades sera évalué et le résultat de cette évaluation sera intégré à l'emplacement définis dans le code HTML.

Pour rendre des expressions JS dans le composant: `{}` :

```jsx
const App = () => {
  const now = new Date();
  const a = 10;
  const b = 20;

  return (
    <div>
      <p>Hello world, it is {now.toString()}</p>
      <p>
        {a} plus {b} is {a + b}
      </p>
    </div>
  );
};
```

## Rendre un composant

React est conçu avec une philosophie ou l'application est découpée en plusieurs composants spécialisé et réutilisable.

Le composant `App` est le composant racine placé en haut de l'arborescence de l'application.

Pour afficher un composant, il suffit de le déclarer dans un autre composant

```jsx
// définition du composant enfant
const Hello = () => {
  return (
    <div>
      <p>Hello world</p>
    </div>
  );
};

// composant parent
const App = () => {
  return (
    <div>
      <h1>Greetings</h1>

      <Hello />
    </div>
  );
};
```

---

## Communication parent -> enfant

Pour transmettre des données du parent vert l'enfant, on les passes comme paramètres du composant enfant.

Le composant enfant reçoit un objet contenant les données.

```jsx
// composant enfant
const Hello = (props) => {
  return (
    <div>
      <p>Hello {props.name}</p>
    </div>
  );
};

// comnposant parent
const App = () => {
  return (
    <div>
      <h1>Greetings</h1>

      <Hello name="George" />
      <Hello name="Daisy" />
    </div>
  );
};
```

---

## Array JS

```js
const t = [1, -1, 3];

t.push(5);

console.log(t.length); // 4 est affiché
console.log(t[1]); // -1 est affiché

t.forEach((value) => {
  console.log(value); // les chiffres 1, -1, 3, 5 sont affichés, chacun sur une ligne
});
```

### Manipulation d'array

**Ajout d'élément**

```js
const t = [1, -1, 3];

// viens créer un nouveau tableau avec le nouvel élément
const t2 = t.concat(5);

console.log(t); // [1, -1, 3] est affiché
console.log(t2); // [1, -1, 3, 5] est affiché
```

**Parcourir et modifier les éléments d'un array**

`map` créer un nouveau tableau, la fonction passer en paramétres est utilisé pour créer un nouvel array

```js
const t = [1, 2, 3];

const m1 = t.map((value) => value * 2);
console.log(m1); // [2, 4, 6] est affiché

// modifications des éléments du tableau
const m2 = t.map((value) => "<li>" + value + "</li>");
console.log(m2);
// [ '<li>1</li>', '<li>2</li>', '<li>3</li>' ] est affiché
```

**Déstructuration**

Permet d'affecter facilement des éléments à des variables

```js
const t = [1, 2, 3, 4, 5];

// first et second reçoivent les éléments du tableau
// ...rest contient les éléments restant regroupé dans un nouveau tableau
const [first, second, ...rest] = t;

console.log(first, second); // 1 2 est affiché
console.log(rest); // [3, 4, 5] est affiché
```

---

## Objet

**Création d'objet**

```js
const object1 = {
  name: "Arto Hellas",
  age: 35,
  education: "PhD",
};

const object2 = {
  name: "Full Stack web application development",
  level: "intermediate studies",
  size: 5,
};

const object3 = {
  name: {
    first: "Dan",
    last: "Abramov",
  },
  grades: [2, 3, 5, 3],
  department: "Stanford University",
};

// accés aux valeurs
console.log(object1.name); // Arto Hellas est affiché
const fieldName = "age";
console.log(object1[fieldName]); // 35 est affiché

// modification
object1.address = "Helsinki";
// pour utiliser des variables ou des clé avec des caractères spéciaux
object1["secret number"] = 12341;
```

### Méthode

Il est possible de déclarer des méthodes dans un objet.

```js
const arto = {
  name: "Arto Hellas",
  age: 35,
  education: "PhD",
  // déclaration d'une méthode
  greet: function () {
    console.log("hello, my name is " + this.name);
  },
};

// ajout d'une nouvelle méthode sur l'objet
arto.growOlder = function () {
  this.age += 1;
};

arto.greet(); // "hello, my name is Arto Hellas" est affiché
```

---

## Fonction

```js
// syntaxe fléchée complète
const sum = (p1, p2) => {
  console.log(p1);
  console.log(p2);
  return p1 + p2;
};

// appelle de fonction
const result = sum(1, 5);
console.log(result);

// syntaxe simplifiée => un seul argument
const square = (p) => {
  console.log(p);
  return p * p;
};

// une expression simple
const square = (p) => p * p;

// utilisation avec map
const t = [1, 2, 3];
const tSquared = t.map((p) => p * p);
// tSquared est devenu [1, 4, 9]

// syntaxe avec function
function product(a, b) {
  return a * b;
}

const result = product(2, 6);
// result est maintenant 12

// expression de fonction
const average = function (a, b) {
  return (a + b) / 2;
};

const result = average(2, 5);
// result est maintenant 3.5
```

---

## Classe

En Js, il n'existe pas vraiment de système de classe.

```js
// déclaration d'une classe
class Person {
  constructor(name, age) {
    this.name = name;
    this.age = age;
  }
  greet() {
    console.log("hello, my name is " + this.name);
  }
}

const adam = new Person("Adam Ondra", 35);
adam.greet();

const janja = new Person("Janja Garnbret", 22);
janja.greet();
```

---

## État des composants, gestionnaires d'event

### Fonctions d'assistance aux composants

Il est possible de créer des fonction d'assistance pour réaliser des actions.

Dans l'exemple du code, la logique pour deviner l'année de naissance est séparée en une fonction qui est appelée lorsque le composant est rendu.

L'âge de la personne n'as pas besoin d'être passé en tant que paramètre de la fonction, car il peut accéder directement à toutes les props passés au composant.

```jsx
const Hello = (props) => {
  // fonction d'assistance
  const bornYear = () => {
    const yearNow = new Date().getFullYear();
    return yearNow - props.age;
  };

  return (
    <div>
      <p>
        Hello {props.name}, you are {props.age} years old
      </p>

      <p>So you were probably born in {bornYear()}</p>
    </div>
  );
};
```

### Déstructuration

Pour simplifier le code pour passer des données, on peut utiliser la déstructuration

```jsx
// déstructuration de l'objet props directement dans les paramètres du composant.
// On peut directement utiliser les données dans le composant.
const Hello = ({ name, age }) => {
  const bornYear = () => new Date().getFullYear() - age;

  return (
    <div>
      <p>
        Hello {name}, you are {age} years old
      </p>
      <p>So you were probably born in {bornYear()}</p>
    </div>
  );
};
```

### useState - changement d'état

Le hook `useState` permet de gérer les changements d'état d'un composant.

- `counter`: contient la valeur
- `setCounter`: fonction qui permet de changer la valeur de la variable
- `useState(0)`: initialisation du state et valeur initial

A chaque changement de valeur de la variable, le composant est re-rendu.

```jsx
import { useState } from "react";

const App = () => {
  // déclaration du hook useState()
  // initialisé à 0
  const [counter, setCounter] = useState(0);

  // la fontion permet de mettre à jour la valeur d'état
  setTimeout(() => setCounter(counter + 1), 1000);

  return <div>{counter}</div>;
};

export default App;
```

### Gestion des évènements

```jsx
const App = () => {
  const [counter, setCounter] = useState(0);

  // handler d'event
  const handleClick = () => {
    console.log("clicked");
  };

  return (
    <div>
      <div>{counter}</div>
      // l'appel de la fonction se fait au clic
      <button onClick={handleClick}>plus</button>
    </div>
  );
};
```

On peut directement déclarer dans l'event l'instruction à déclencher

```jsx
const App = () => {
  const [counter, setCounter] = useState(0);

  return (
    <div>
      <div>{counter}</div>
      // déclenche l'incrémentation de la valeur
      <button onClick={() => setCounter(counter + 1)}>plus</button>
      // déclenche la remise à zéro
      <button onClick={() => setCounter(0)}>zero</button>
    </div>
  );
};
```

### Transimission de données aux composants => enfant vers parent

Il est recommander d'écrire des composants React petits et réutilisables dans l'application.

Lorsque plusieurs composants utilisent les mêmes données, on peut venir remonter un état partagé jusqu'a leur ancêtre commun.

Par convention, on utilise le nom de l'évènement pour passer le handler dans le composant enfant.

```jsx
// Display.jsx
// Permet d'afficher la valeur
const Display = ({ counter }) => <div>{counter}</div>;

// Button.jsx
// le composant Button permet de déclencher le changement de la valeur
const Button = ({ onClick, text }) => <button onClick={onClick}>{text}</button>;

// App.jsx
const App = () => {
  const [counter, setCounter] = useState(0);

  const increaseByOne = () => setCounter(counter + 1);

  const decreaseByOne = () => setCounter(counter - 1);
  const setToZero = () => setCounter(0);

  return (
    <div>
      <Display counter={counter} />
      // on passe le handler dans le composant enfant
      <Button onClick={increaseByOne} text="plus" />
      <Button onClick={setToZero} text="zero" />
      <Button onClick={decreaseByOne} text="minus" />
    </div>
  );
};
```

Lorsque l'un des boutons est cliqué, le handler est exécuté. Celui ci modifie l'état du composant `App` avec la fonction `setCounter`.

Lorsque le state est modifié, le composant, et les composants enfant sont re-render

---

## Debogage

### Spread Syntaxe

En React, on ne modifie jamais directement une valeur de state, cela pouvant entrainer des effets secondaires.

Le changement d'état doit toujours être effectué en définissant l'état sur un nouvel objet.

```js
const handleLeftClick = () => {
  const newClicks = {
    // spread => on copie l'ensembles des valeurs
    ...clicks,
    left: clicks.left + 1, // une seule valeur est modifier
  };
  setClicks(newClicks);
};

// syntaxe simplifiée
const handleLeftClick = () => setClicks({ ...clicks, left: clicks.left + 1 });
```

### Gestion des tableaux

Chaque clic est stocker dans un tableau. Le state `allClicks` est initialiser sous forme de tableau.

Lorsque un clic est déclencher, celui ci est enregistré dans le tableau.

```jsx
const App = () => {
  const [left, setLeft] = useState(0);
  const [right, setRight] = useState(0);

  // tableau qui enregistre les clics
  const [allClicks, setAll] = useState([]);

  // permet d'enregistrer un click
  const handleLeftClick = () => {
    // l'ajout se fait avec la méthode concat qui ne mute pas le tableau existant
    setAll(allClicks.concat("L"));
    setLeft(left + 1);
  };

  const handleRightClick = () => {
    setAll(allClicks.concat("R"));
    setRight(right + 1);
  };

  return (
    <div>
      {left}
      <button onClick={handleLeftClick}>left</button>
      <button onClick={handleRightClick}>right</button>
      {right}
      // affichage des valeurs du tableau avec join() // les valeurs sont
      afficher sous forme de string.
      <p>{allClicks.join(" ")}</p>
    </div>
  );
};
```

### Rendu conditionnel

Le rendu du composant `History` dépent si le bouton à été cliquer au moins une fois.

```jsx
const History = (props) => {
  // condition => si aucun clic
  if (props.allClicks.length === 0) {
    return <div>the app is used by pressing the buttons</div>;
  }
  // si des clics, on utilise ce rendu
  return <div>button press history: {props.allClicks.join(" ")}</div>;
};

const App = () => {
  // ...

  return (
    <div>
      {left}
      <button onClick={handleLeftClick}>left</button>
      <button onClick={handleRightClick}>right</button>
      {right}

      <History allClicks={allClicks} />
    </div>
  );
};
```

---

## 2 - Communiquer avec le serveur

### Rendu de collection

#### map

Permet de parcourir un tableau.

```jsx
const Note = ({ note }) => {
  return <li>{note.content}</li>;
};

const App = ({ notes }) => {
  return (
    <div>
      <h1>Notes</h1>
      <ul>
        {notes.map((note) => (
          <Note key={note.id} note={note} />
        ))}
      </ul>
    </div>
  );
};
```

---

## Formulaire

### Composant controlé

```jsx
import { useState } from "react";

const App = () => {
  // stocke les numeros ajouter
  const [persons, setPersons] = useState([
    { name: "Arto Hellas", phone: "012-546-334" },
  ]);
  // permet de gerer l'input
  const [newName, setNewName] = useState("");
  const [newPhone, setNewPhone] = useState("");

  //permet d'ajouter une nouvelle personne
  const addPerson = (event) => {
    // empeche le rechargement de la page
    event.preventDefault();
    let isExisting = false;
    persons.forEach((person) => {
      if (person.name.toLowerCase() === newName.toLowerCase()) {
        // return;
        isExisting = true;
      }
    });

    if (isExisting) {
      alert(`${newName} deja present`);
      newName("");
      return;
    }

    // creation du nouvel objet a ajouter
    const personObj = {
      name: newName,
      phone: newPhone,
    };

    // concat permet d'ajouter la nouvelle personne
    setPersons(persons.concat(personObj));
    // reset de l'input
    setNewName("");
  };

  // permet de gerer le changement de valeur
  const handleAddPerson = (event) => {
    setNewName(event.target.value); // ajout dans le state de la valeur
  };

  const handleAddPhone = (event) => {
    setNewPhone(event.target.value);
  };

  return (
    <div>
      <h2>Phonebook</h2>
      // lier au handler de submit
      <form onSubmit={addPerson}>
        <h2>add a new</h2>
        <div className="">
          <label htmlFor="name">Name:</label>
          <input
            type="text"
            id="name"
            className=""
            // lier au state
            value={newName}
            // lier au handler
            onChange={handleAddPerson}
            required
          />
        </div>
        <div className="">
          <label htmlFor="phone">Phone: </label>
          <input
            type="text"
            id="phone"
            className=""
            value={newPhone}
            onChange={handleAddPhone}
            required
          />
        </div>
        <div>
          <button type="submit">add</button>
        </div>
      </form>
    </div>
  );
};

export default App;
```

### Search Bar

```jsx
import { useState } from "react";

const App = () => {
  // Gestion de la searchBar
  // input controller de la recherche
  const [newSearch, setNewSearch] = useState("");
  // permet d'activer le filtrage
  const [showAll, setShowAll] = useState(true);

  // permet de faire le filtrage => on itere sur cet objet pour l'affichage
  const personsToShow = showAll
    ? persons
    : persons.filter((person) => {
        // permet de passer tout en minuscule pour inclure les recherches
        const name = person.name.toLocaleLowerCase();
        const search = newSearch.toLocaleLowerCase();
        return name.includes(search);
      });

  const handleSearch = (event) => {
    setShowAll(false);
    setNewSearch(event.target.value);
  };

  return (
    <div>
      <h2>Phonebook</h2>
      // permet de recuperer la valeur rechercher
      <div className="searchBar">
        <label htmlFor="">Filter shown with: </label>
        <input type="text" onChange={handleSearch} />
      </div>
      <div className="repertoire">
        <h2>Numbers</h2>
        <ul>
          // parcours l'objet contenant les valeur filtrer ou l'ensemble des
          valeurs
          {personsToShow.map((person) => (
            <li key={person.id}>
              {person.name}: {person.number}
            </li>
          ))}
        </ul>
      </div>
    </div>
  );
};

export default App;
```

---

## UseEffect 

Hook qui permet de faire des call 

```jsx
import { useEffect, useState } from "react";
import SearchBar from "./SearchBar";
import Persons from "./Persons";
import PersonForm from "./PersonForm";
import axios from "axios";

const App = () => {
  // stocke les numeros ajouter
  const [persons, setPersons] = useState([]);
  // permet de gerer l'input
  const [newName, setNewName] = useState("");
  const [newPhone, setNewPhone] = useState("");

  // permet de recuperer les donnees sur le serveur => au build du composant
  useEffect(() => {
    // fais une requete vers le serveur au montage du composant
    axios.get("http://localhost:3001/persons").then((response) => {
      setPersons(response.data);
    });
  }, []);

  // ...

  return (
    <div>
      <h2>Phonebook</h2>

      <SearchBar onChange={handleSearch} />

      <PersonForm
        onSubmit={addPerson}
        newName={newName}
        handleAddPerson={handleAddPerson}
        newPhone={newPhone}
        handleAddPhone={handleAddPhone}
      />

      <Persons persons={personsToShow} />
    </div>
  );
};

export default App;
```