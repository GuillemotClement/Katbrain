# JavaScript 

## Type 

- `number`: nombre entier et float 
- `boolean`: true ou false 
- `string`: chaine de caractere
- `undefined`: une variable qui n'as pas encore de valeur assigner (utiliser pour declarer une valeur sans valeur)
- `null`: la variable existe mais est vide

```js
let myName;
console.log(myName); // undefined

let myName = null;
console.log(myName); // null
```

`typeof` permet de recuperer le type d'une variable

### String 

Pour acceder aux caracteres d'une string, on utilise les crochets 

```js
const greeting = "Hello";
console.log(greeting[0]); // 'H'
console.log(greeting[1]); // 'e'
console.log(greeting[2]); // 'l'
console.log(greeting[3]); // 'l'
console.log(greeting[4]); // 'o'
// you can also get the last char at length-1
console.log(greeting[greeting.length - 1]); // 'o'
```

`.length` permet d'acceder aux nombres de caracteres de la chaine

#### Template literals 

Permet d'interpoler des valeurs dans une string 

```js
const shadeOfRed = 101;
console.log(`The shade is ${shadeOfRed}`);
// The shade is 101
```

---

## Variable

- `var`: ancienne maniere de declarer une variable
- `let`: une variable pouvant etre reassigner
- `const`: une variable statique

```js
let username = "dengar_the_bh";
username = "boba_fett";

const smsSendingLimit = 1000;
```

Il est possible de declarer plusieurs variable sur une seule ligne 

```js
let miles = 80276, org = "Tesla";
```

## Commentaire 

```js
// This is a single-line comment

/*
   This is a multi-line comment
   neither of these comments will execute
   as code
*/
```

---

## Condition 

```js
if (height > 6) {
  console.log("You are super tall!");
} else if (height > 4) {
  console.log("You are tall enough!");
} else {
  console.log("You are not tall enough!");
}
```

### Operateur 

Operateur:
- `===`: egale 
- `!==`: non egale 
- `<`: inferieur
- `>`: superieur
- `<=`: inferieur ou egale
- `>=`: superieur ou egale

- `&&`: and 
- `||`: or 
- `!`: not 

### Switch 

```js
const os = "mac";
let creator;
switch (os) {
  case "linux":
    creator = "Linus Torvalds";
    break;
  case "windows":
    creator = "Bill Gates";
    break;
  case "mac":
    creator = "Steve";
    break;
  default:
    creator = "Unknown";
    break;
}

console.log(creator);
// Steve
```

### Ternaire 

Si la condition est `true`, alors on applique la premiere valeur, sinon on prends la seconde

```js
const price = isMember ? "$2.00" : "$10.00";
```

### Valeur falsy 

- `false`
- `0`
- `""`
- `null`
- `undefined`
- `NaN`

### Nullish Coalescing 

Si la premiere valeur est evaluer a true, alors elle est utiliser

```js
let myName = null;
console.log(myName ?? "Anonymous"); // "Anonymous"

myName = "Lane";
console.log(myName ?? "Anonymous"); // "Lane"
```

---

## Fonction 

```js
// function declaration
function getSum(a, b) {
  return a + b;
}

// function call
const result = getSum(60, 9);

console.log(result);
// 69
```

### Fonction as values 

On peut passer une fonction comme valeur a une autre fonction.

```js
function add(x, y) {
  return x + y;
}

function mul(x, y) {
  return x * y;
}

// la fonction utilise une fonction en troisieme argument 
function aggregate(a, b, c, arithmetic) {
  const firstResult = arithmetic(a, b);
  const secondResult = arithmetic(firstResult, c);
  return secondResult;
}

// utilisation 
function main() {
  const sum = aggregate(2, 3, 4, add);
  // sum is 9
  const product = aggregate(2, 3, 4, mul);
  // product is 24
}
```

### Fonction anonyme 

Utiliser pour une fonction qui sera utiliser qu'une seule fois.

```js
// une fonction qui prends une fontion en premier argument 
function conversions(converter, x, y, z) {
  const convertedX = converter(x);
  const convertedY = converter(y);
  const convertedZ = converter(z);
  console.log(convertedX, convertedY, convertedZ);
}

// avec une fonction nommer
function double(a) {
  return a + a;
}
conversions(double, 1, 2, 3);
// 2 4 6

// avec une fonction anonyme 
conversions(
  function (a) {
    return a + a;
  },
  1,
  2,
  3,
);
// 2 4 6
```

### Parametre par defaut 

On peut set une valeur par defaut pour le parametre d'une fonction. Si aucune valeur n'est passer dans la fonction, c'est la valeur par defaut qui est utiliser

```js
function getGreeting(email, name = "there") {
  console.log(`Hello ${name}, welcome! You've registered your email: ${email}`);
}

getGreeting("lane@example.com", "Lane");
// Hello Lane, welcome! You've registered your email: lane@example.com

getGreeting("lane@example.com");
// Hello there, welcome! You've registered your email: lane@example.com
```

### IIFE

Il est possible d'invoquer immediatement une fonction avec sa definition

```js
(function () {
  console.log("JavaScript: at least it's not Java");
})();
// JavaScript: at least it's not Java

// passer des arguments et retourner une valeur
const result = (function (a, b) {
  return a + b;
})(1, 2);

console.log(result);
// 3
```

### Fonction flechees

Syntaxe alternative pour declarer une fonction.

```js
// declaring a function without a variable
function add(x, y) {
  return x + y;
}

// declaring a function with a variable
const add = function (x, y) {
  return x + y;
};

// using the fat arrow syntax
const add = (x, y) => {
  return x + y;
};
```

---

## Objet 

Permet de stocker sous forme de cle valeur

```js
// declaration d'un objet
const apple = {
  name: "Apple",
  radius: 2,
  color: "red",
};

// acces aux valeurs
console.log(apple.name); // prints "Apple"
console.log(apple.radius); // prints "2"
console.log(apple.color); // prints "red"

// update de valeur 
apple.numSeeds = 3; // new property
apple.color = "green"; // update property
// {"name":"Apple","radius":2,"color":"green","numSeeds":3}

// objet nested
const tournament = {
  referee: {
    name: "Sally",
    age: 25,
  },
  prize: {
    units: "dollars",
    value: 100,
  },
};

console.log(tournament.referee.name); // Sally
console.log(tournament.prize.value); // 100
```

### Optionnal Chainning 

Lorsque l'on tente d'acceder a un champ de l'objet qui possede une valeur `null`, ou `undefined` n'existe cela provoque une erreur.

Pour eviter ce genre d'erreur, on peut utiliser `?`

```js
const tournament = {
  prize: {
    units: "dollars",
    value: 100,
  },
};

const h = tournament.referee?.height;
```

### Methode d'un objet 

Les objets peuvent contenir des methodes. Les methodes peuvent acceder aux champs de l'objet avec `this` 

```js
// acces aux champs de l'objet
const person = {
  firstName: "Lane",
  lastName: "Wagner",
  getFullName() {
    return this.firstName + " " + this.lastName;
  },
};

console.log(person.getFullName());
// Lane Wagner

// modification du champ de l'objet 
const tree = {
  height: 256,
  color: "green",
  cut() {
    this.height /= 2;
  },
};

tree.cut();
console.log(tree.height);
// prints 128

tree.cut();
console.log(tree.height);
// prints 64
```

### Verification objet vide

Pour verifier si un objet contient des valeurs, on utilis `!`

```js
const balances = {
  lane: 100,
  breanna: 150,
  john: 200,
};

// if bob doesn't have a balance yet
// create a new prop for him
// set to 0
if (!balances.bob) {
  balances.bob = 0;
}
```

### Variable pour un key 

Pour acceder aux cle d'un objet en utilisant une variable, il faut utiliser des `[]`

```js
const desk = {
  wood: "maple",
  width: 100,
};

console.log(desk.wood);
// prints "maple"

console.log(desk["wood"]);
// also prints "maple"

const key = "wood";
console.log(desk[key]);
// also prints "maple"

// par exemple, la cle est passer comme parametre d'une fonction 
function getLastName(lastNames, firstName) {
  return lastNames[firstName];
}
```

### Spread Syntax

Syntaxe simplifier pour extraire des valeurs, et merge des proprietes d'un objet 

```js
// fusion d'objet 
const engineering_dept = {
  lane: "grand magus",
  hunter: "software engineer",
  allan: "software engineer",
  matt: "software engineer",
  dan: "software engineer",
  waseem: "software engineer",
};

const video_dept = {
  stass: "video producer",
  alex: "video producer",
};

const all_employees = { ...engineering_dept, ...video_dept };
/*
{
  lane: 'grand magus',
  hunter: 'software engineer',
  allan: 'software engineer',
  matt: 'software engineer',
  dan: 'software engineer',
  waseem: 'software engineer',
  stass: 'video producer',
  alex: 'video producer'
}
*/
```

### Destructuring 

Permet de recuperer des valeurs d'un objet

```js
const apple = {
  radius: 2,
  color: "red",
};

const { radius, color } = apple;

// extraction des valeurs retourner par une fonction 
function getApple() {
  const apple = {
    radius: 2,
    color: "red",
  };
  return apple;
}

const { radius, color } = getApple();
console.log(radius); // 2
console.log(color); // red

// extraction pour les parametre d'une fonction 
// without
function eatApple(apple) {
  console.log(`ate a ${apple.color} apple with a radius of ${apple.radius}`);
}
// with
function eatApple({ radius, color }) {
  console.log(`ate a ${color} apple with a radius of ${radius}`);
}
```

## Classes

```js
// création d'une nouvelle classe
class User {
  constructor(name, age) {
    this.name = name;
    this.age = age;
  }
}

// création d'une nouvelle instance
const user = new User("Lane", 100);
```

- `constructor`: méthode spéciale appeler lorsqu'une nouvel objet est créer

### Portée des champs 

Par défaut, toutes les propriétés d'une classes sont public.

Pour rendre private un éléments, on utilise `#` devant le nom du champs, et le champs se déclare en haut de la classe

```js
class Movie {
  #title;
  constructor(title, rating) {
    this.#title = title;
    this.rating = rating;
  }
}

const matrixMovie = new Movie("The Matrix", 9.5);
console.log(matrixMovie.#title);
// Uncaught SyntaxError: Private field '#title' must be declared in an enclosing class
```

Les propriétés privée peuvent toujours utiliser dans la classe.

```js
class Movie {
  #title;
  constructor(title, rating) {
    this.#title = title;
    this.rating = rating;
  }

  getTitleAllCaps() {
    const allCaps = this.#title.toUpperCase();
    return allCaps;
  }
}

const matrixMovie = new Movie("The Matrix", 9.5);
console.log(matrixMovie.getTitleAllCaps());
// THE MATRIX
```

### Méthode static 

Une méthode statique est une méthode associé à la classe, et pas à l'instance e la classe.

```js
class User {
  static numUsers = 0;

  constructor(name, age) {
    this.name = name;
    this.age = age;
    // acces aux static via le nom de la classe
    User.numUsers++;
  }

  static getNumUsers() {
    return User.numUsers;
  }
}

const lane = new User("Lane", 30);
console.log(User.getNumUsers()); // 1
const allan = new User("Allan", 30);
console.log(User.getNumUsers()); // 2

// This doesn't work because its not a method on the object
console.log(lane.getNumUsers());
// TypeError: lane.getNumUsers is not a function
//    at main.js:20:18
```

### Getter et Setter 

Methodes speciale permettant de manipuler les champs de la classe.

```js
class User {
  constructor(name, age) {
    this._name = name;
    this.age = age;
  }

  // getter permettant d'acceder au champ
  get name() {
    return this._name.toUpperCase();
  }

  // setter permettant de modifier la valeur
  set age(value) {
    if (value < 0) {
      throw new Error("Age can't be negative.");
    }
    this._age = value;
  }
}

const lane = new User("Lane", 30);
console.log(lane.name); // LANE

lane.age = -5; // "Age can't be negative."
console.log(lane.age); // 30
```

### Heritage 

L'heritage se fait via le `extends`. 

```js
class Titan {
  constructor(name) {
    this.name = name;
  }
}

class BeastTitan extends Titan {
  speak(msg) {
    console.log(`${this.name} says, "${msg}"`);
  }
}

const beast = new BeastTitan("Zeke");
beast.speak("You know, it's almost like throwing a baseball");
// Zeke says, "You know, it's almost like throwing a baseball"
```

Il est possible de modifier le comportement d'une methode de la classe enfant 

```js
class Titan {
  constructor(name) {
    this.name = name;
  }

  speak() {
    // this gets overridden in the BeastTitan class
    console.log("*titan noises*");
  }
}

class BeastTitan extends Titan {
  speak() {
    console.log(`${this.name} says, "I'm the Beast Titan"`);
  }
}

const pureTitan = new Titan("Eren's mom");
pureTitan.speak();
// *titan noises*

const beast = new BeastTitan("Zeke");
beast.speak();
// Zeke says, "I'm the Beast Titan"
```

### Super 

`super` permet d'utiliser une methode de l'objet parent. Generalement utiliser pour les constructeur 

```js
class Titan {
  constructor(name) {
    this.name = name;
  }

  toString() {
    return `Titan - Name: ${this.name}`;
  }
}

class BeastTitan extends Titan {
  constructor(name, power) {
    // call the parent's constructor
    super(name);
    this.power = power;
  }

  toString() {
    // call the parent's `toString` method
    return `${super.toString()}, Power: ${this.power}`;
  }
}

const beast = new BeastTitan("Zeke", 9000);
console.log(beast.toString());
// Titan - Name: Zeke, Power: 9000
```

---

## Boucle 

```js
for (let i = 0; i < 5; i++) {
  console.log(i);
}
// 0
// 1
// 2
// 3
// 4
```

### Break

Permet de stoper l'execution de la boucle 

```js
for (let i = 0; ; i++) {
  if (i === 3) {
    break;
  }
  console.log(i);
}

```

### Continue

Permet de passer a l'iteration suivante 

```js
for (let i = 0; i < 10; i++) {
  if (i % 2 === 0) {
    continue;
  }
  console.log(i);
}
// Prints:
// 1
// 3
// 5
// 7
// 9
```

### While 

```js
const jane = {
  name: "Jane",
  mom: {
    name: "Alice",
    mom: {
      name: "Lilly",
      mom: {
        name: "Granny",
      },
    },
  },
};

let currentPerson = jane;
while (currentPerson) {
  console.log(currentPerson.name);
  currentPerson = currentPerson.mom;
}
console.log("No more ancestors!");
// Jane
// Alice
// Lilly
// Granny
// No more ancestors!
```

### For ... in

```js
let titan = {
  name: "Eren",
  power: "Attack Titan",
  age: 19,
};

for (const key in titan) {
  console.log(`${key}: ${titan[key]}`);
}
// name: Eren
// power: Attack Titan
// age: 19
```