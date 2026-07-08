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