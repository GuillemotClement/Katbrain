# Angular

## Commande

````shell
# lancement du serveur de dev
ng serve

# génère les fichiers du composant dans un nouveau dossier
ng generate component <name_component>

# génère un nouveau fichier interface
ng generate interface <name_interface>
ng generate interface housinglocation

# génère un nouveau fichier service
ng generate service <name_service>
ng generate service housing
```


## Composant

```ts
@Component({
  selector: "app-root",
  imports: [],
  template: ` <h1>Hello world!</h1> `,
  styleUrls: ["./app.css"],
})
export class App {
  title = "homes";
}
````

- `selector`: sélecteur CSS pour utiliser le composant en HTML
- `imports`: module/composants à importer dans ce composant
- `standalone`: boolean qui indique si c'est un composant autonome (NgModule). Si `true`, pas besoin de déclarer dans un module
- `template`: code HTML du composant inline
- `templateUrl`: tableau des fichier HTML
- `styleUrls`: tableau des fichier css externe
- `styles`: css inline

### Import de composant

Pour utiliser un composant enfant dans le composant, il est nécessaire de l'importer en l'important, puis en l'ajoutant dans les metadonnée du composant sur le champs `imports`

```ts
import { Home } from "./home/home";

@Component({
  selector: "app-root",
  imports: [Home], // import du composant
  template: ` <h1>Hello world!</h1> `,
  styleUrls: ["./app.css"],
})
```

Une fois le composant importer, on peut venir l'utiliser dans le template HTML

Pour faire référence au composant dans le template, on utilise son nom définis dans le champ `selector` du composant importé.

```ts
@Component({
  selector: "app-root",
  imports: [Home],
  template: ` <main>
    <header class="brand-name">
      <img
        class="brand-logo"
        src="/public/logo.svg"
        alt="logo"
        aria-hidden="true"
      />
    </header>
    <section class="content">
      <app-home /> // composant utiliser dans le template
    </section>
  </main>`,
  styleUrls: ["./app.css"],
})
```

### Donnée ts

Dans la classe du fichier de composant, on peut venir ajouter de contenu TS.

```ts
export class Home {
  // définition d'un champ
  readonly baseUrl = "https://angular.dev/assets/images/tutorials/common";

  // définition de fake date typer avec l'interface
  housingLocation: HousingLocationInfo = {
    id: 9999,
    name: "Test Home",
    city: "Test city",
    state: "ST",
    photo: `${this.baseUrl}/example-house.jpg`,
    availableUnits: 99,
    wifi: true,
    laundry: false,
  };
}
```

---

## Interface

Les interfaces Ts sont utiliser pour ajouter du typage pour représenter les données de l'application.

Une fois le fichier générer on vient ajouter le typage

```ts
//housinglocation.ts
export interface HousinglocationInfo {
  id: number;
  name: string;
  city: string;
  state: string;
  photo: string;
  availableUnits: number;
  wifi: boolean;
  laundry: boolean;
}
```

---

## Communication entre composants - `input()`

`Input` permet à un composant de passer des données du parent vers l'enfant.

Dans le composant enfant, on viens utiliser la fonction pour récuperer les données fournis par le composant parent

`required` force le composant parent à fournir les données

```ts
import { input } from "@angular/core";
// ---
export class HousingLocation {
  housingLocation = input.required<HousingLocationInfo>();
}
```

Dans le composant parent, on viens passer les données

```ts
<section class="results">
  <app-housing-location [housingLocation]="housingLocation" />
</section>

// ---
export class Home {
  // données passer au composant enfant
  housingLocation: HousingLocationInfo = {
    id: 9999,
    name: "Test Home",
    city: "Test city",
    state: "ST",
    photo: `${this.baseUrl}/example-house.jpg`,
    availableUnits: 99,
    wifi: true,
    laundry: false,
  };
}
```

---

## Affichage des données dans le template - `{{ expression }}`

`{{ expression}}` permet d'afficher une expression typescript dans le template.

Dans le template HTML, on peut venir afficher des valeurs et expressions

```ts
template: `
  <section class="listing">
    <img
      class="listing-photo"
      [src]="housingLocation().photo"
      alt="Exterior photo of {{ housingLocation().name }}"
      crossorigin
    />
    <h2 class="listing-heading">{{ housingLocation().name }}</h2>
    <p class="listing-location">
      {{ housingLocation().city }}, {{ housingLocation().state }}
    </p>
  </section>
`,
// ---


export class HousingLocation {
  housingLocation = input.required<HousingLocationInfo>();
}
```

Dans le template, on utiliser les propriétés binder.

---

## Itérer des listes - `@for`

`@for` permet d'itérer une liste pour afficher les éléments.

- `housingLocation` contient la valeur en cours d'itération et qui sera passé au composant enfant.
- `track $index`: permet d'ajouter la clé

```ts
@Component({
  selector: "app-home",
  imports: [HousingLocation],
  template: `
    <section>
      <form>
        <input type="text" placeholder="Filter by city" />
        <button class="primary" type="button">Search</button>
      </form>
    </section>
    <section class="results">
      // UTILISATION POUR ITERER LES ELEMENTS
      @for (housingLocation of housingLocationList; track $index) {
        <app-housing-location [housingLocation]="housingLocation" />
      }
    </section>
  `,
  styleUrls: ["./home.css"],
})
export class Home {
  readonly baseUrl = "https://angular.dev/assets/images/tutorials/common";

  housingLocationList: HousingLocationInfo[] = [
    {
      id: 0,
      name: "Acme Fresh Start Housing",
      city: "Chicago",
      state: "IL",
      photo: `${this.baseUrl}/bernard-hermant-CLKGGwIBTaY-unsplash.jpg`,
      availableUnits: 4,
      wifi: true,
      laundry: true,
    },
    {
      id: 1,
      name: "A113 Transitional Housing",
      city: "Santa Monica",
      state: "CA",
      photo: `${this.baseUrl}/brandon-griggs-wR11KBaB86U-unsplash.jpg`,
      availableUnits: 0,
      wifi: false,
      laundry: true,
    },
    {
      id: 2,
      name: "Warm Beds Housing Support",
      city: "Juneau",
      state: "AK",
      photo: `${this.baseUrl}/i-do-nothing-but-love-lAyXdl1-Wmc-unsplash.jpg`,
      availableUnits: 1,
      wifi: false,
      laundry: false,
    },
    {
      id: 3,
      name: "Homesteady Housing",
      city: "Chicago",
      state: "IL",
      photo: `${this.baseUrl}/ian-macdonald-W8z6aiwfi1E-unsplash.jpg`,
      availableUnits: 1,
      wifi: true,
      laundry: false,
    },
  ];
}
```

## Angular Service

Permet de sépare la logique métier de la logique technique composant. Les fonctions peuvent ainsi être réutiliser dans d'autres composants.

Un service doit être injecté, et une fois injecté, il devient une dépendance du composant.

Dans le fichier service, on viens déclarer les donnees et les methodes metier

```ts
//housing.service.ts
import { Injectable } from "@angular/core";
import { HousingLocationInfo } from "./housinglocation";

@Injectable({
  providedIn: "root",
})
export class HousingService {
  readonly baseUrl = "https://angular.dev/assets/images/tutorials/common";

  protected housingLocationList: HousingLocationInfo[] = [
    {
      id: 0,
      name: "Acme Fresh Start Housing",
      city: "Chicago",
      state: "IL",
      photo: `${this.baseUrl}/bernard-hermant-CLKGGwIBTaY-unsplash.jpg`,
      availableUnits: 4,
      wifi: true,
      laundry: true,
    },
    {
      id: 1,
      name: "A113 Transitional Housing",
      city: "Santa Monica",
      state: "CA",
      photo: `${this.baseUrl}/brandon-griggs-wR11KBaB86U-unsplash.jpg`,
      availableUnits: 0,
      wifi: false,
      laundry: true,
    },
    {
      id: 2,
      name: "Warm Beds Housing Support",
      city: "Juneau",
      state: "AK",
      photo: `${this.baseUrl}/i-do-nothing-but-love-lAyXdl1-Wmc-unsplash.jpg`,
      availableUnits: 1,
      wifi: false,
      laundry: false,
    },
  ];

  // méthodes pour récuprer la données
  getAllHousingLocations(): HousingLocationInfo[] {
    return this.housingLocationList;
  }

  getHousingLocationById(id: number): HousingLocationInfo | undefined {
    return this.housingLocationList.find(
      (HousingLocation) => HousingLocation.id === id,
    );
  }
}
```

Dans le composant, on viens injecter le service, et appeler la methode pour récuperer la données

```ts
import { Component, inject } from "@angular/core";
import { HousingService } from "../housing.service";
// ....

export class Home {
  // champs qui stocker les donnees issue du constructuer
  housingLocationList: HousingLocationInfo[] = [];
  // injection du service
  housingService: HousingService = inject(HousingService);

  // le constructeur viens charger les données
  constructor() {
    this.housingLocationList = this.housingService.getAllHousingLocations();
  }
}
```

---

## Routage

Dans le fichier `routes`, on vient ajouter les routes de l'application.

```ts
const routeConfig: Routes = [
  {
    path: "",
    component: Home,
    title: "Home page",
  },
  {
    path: "details/:id", // parametre dynamique
    component: Details,
    title: "Home details",
  },
];

export default routeConfig;
```

### Lien de navigation

```ts
<a [routerLink]="['/']">
  <header class="brand-name">
    <img
      class="brand-logo"
      src="/public/logo.svg"
      alt="logo"
      aria-hidden="true"
    />
  </header>
</a>
```

### Lien dynamique

`routerLink` permet d'utiliser des parametres dynamique dans le liens pour accéder à la page.

```ts
 <a [routerLink]="['/details', housingLocation().id]">Learn More</a>
```

- `routerLink` est une directive Angular qui permet de créer des link dynamique. La premiere valeur correspond au path, et le second la valeur a passer.

### Récupération de la valeur dynamique

```ts
import { Component, inject } from "@angular/core";
import { ActivatedRoute } from "@angular/router";
import { HousingService } from "../housing.service";
import { HousingLocationInfo } from "../housinglocation";

@Component({
  selector: "app-details",
  imports: [],
  template: `
    <article>
      <img
        class="listing-photo"
        [src]="housingLocation?.photo"
        alt="Exterior photo of {{ housingLocation?.name }}"
        crossorigin
      />
      <section class="listing-description">
        <h2 class="listing-heading">{{ housingLocation?.name }}</h2>
        <p class="listing-location">
          {{ housingLocation?.city }}, {{ housingLocation?.state }}
        </p>
      </section>
      <section class="listing-features">
        <h2 class="section-heading">About this housing location</h2>
        <ul>
          <li>Units available: {{ housingLocation?.availableUnits }}</li>
          <li>Does this location have wifi: {{ housingLocation?.wifi }}</li>
          <li>
            Does this location have laundry: {{ housingLocation?.laundry }}
          </li>
        </ul>
      </section>
    </article>
  `,
  styles: ``,
})
export class Details {
  // service fournis par Angular pour accéder aux inmformations de la route
  route: ActivatedRoute = inject(ActivatedRoute);
  // injection du service
  housingService = inject(HousingService);
  // champs pour stocker les données
  housingLocation: HousingLocationInfo | undefined;

  constructor() {
    // permet de récupérer l'id depuis l'url
    const housingLocationId = Number(this.route.snapshot.params["id"]);
    // on injecte dans le champs les valeurs
    this.housingLocation =
      this.housingService.getHousingLocationById(housingLocationId);
  }
}
```

- `ActivatedRoute`: permet d'avoir acces aux valeurs de lien dyunamique

---

## Formulaire

Dans le service, on peut venir commencer par ajouter une méthode qui viendras traiter les donnees soumise par le formualaire.

```ts
//housing.service.ts
submitApplication(firstName: string, lastName: string, email: string) {
  console.log(
    `Homes application received: firstName: ${firstName}, lastName: ${lastName}, email: ${email}`,
  );
}
```

### `FormControl`

On viens dans le composant, construire le formulaire et déclencher l'appel a la fonction du service.

Le template utilise `(submit)="submitApplication()` pour déclencher l'appel à la fonction à la soumission du formulaire.

Il utilise également `[formGroup]="applyForm"` pour lier le formulaire au state

```ts
// details.ts
import { FormControl, FormGroup, ReactiveFormsModule } from "@angular/forms";

// ...
// import du module
imports: [ReactiveFormsModule],
template: `
  <article>
    <img
      class="listing-photo"
      [src]="housingLocation?.photo"
      alt="Exterior photo of {{ housingLocation?.name }}"
      crossorigin
    />
    <section class="listing-description">
      <h2 class="listing-heading">{{ housingLocation?.name }}</h2>
      <p class="listing-location">
        {{ housingLocation?.city }}, {{ housingLocation?.state }}
      </p>
    </section>
    <section class="listing-features">
      <h2 class="section-heading">About this housing location</h2>
      <ul>
        <li>Units available: {{ housingLocation?.availableUnits }}</li>
        <li>Does this location have wifi: {{ housingLocation?.wifi }}</li>
        <li>
          Does this location have laundry: {{ housingLocation?.laundry }}
        </li>
      </ul>
    </section>
    <section class="listing-apply">
      <h2 class="section-heading">Apply now to live here</h2>
      <form [formGroup]="applyForm" (submit)="submitApplication()">
        <label for="first-name">First Name</label>
        <input id="first-name" type="text" formControlName="firstName" />

        <label for="last-name">Last Name</label>
        <input id="last-name" type="text" formControlName="lastName" />

        <label for="email">Email</label>
        <input id="email" type="email" formControlName="email" />
        <button type="submit" class="primary">Apply now</button>
      </form>
    </section>
  </article>
`,

// ....
export class Details {
  route: ActivatedRoute = inject(ActivatedRoute);
  housingService = inject(HousingService);
  housingLocation: HousingLocationInfo | undefined;

  // construction du formulaire
  applyForm = new FormGroup({
    firstName: new FormControl(""),
    lastName: new FormControl(""),
    email: new FormControl(""),
  });

  constructor() {
    const housingLocationId = Number(this.route.snapshot.params["id"]);
    this.housingLocation =
      this.housingService.getHousingLocationById(housingLocationId);
  }

  // on passe la fonction pour envoyer les donnees dans la fonction du service
  submitApplication() {
    this.housingService.submitApplication(
      this.applyForm.value.firstName ?? "",
      this.applyForm.value.lastName ?? "",
      this.applyForm.value.email ?? "",
    );
  }
}
```

---

## Barre de recherche

```ts
  template: `
    <section>
      <form>
        <input type="text" placeholder="Filter by city" #filter />
        <button
          class="primary"
          type="button"
          (click)="filterResults(filter.value)"
        >
          Search
        </button>
      </form>
    </section>
    <section class="results">
      @for (housingLocation of filteredLocationList; track $index) {
        <app-housing-location [housingLocation]="housingLocation" />
      }
    </section>
  `,

// ...

export class Home {
  // met automatiquement a jour l'interface lorsqu'une donnée est chargée
  private readonly changeDetectorRef = inject(ChangeDetectorRef);
  housingLocationList: HousingLocationInfo[] = [];
  housingService: HousingService = inject(HousingService);
  // permet de contenir la valeur qui viendras matcher avec le critere de recherche
  filteredLocationList: HousingLocationInfo[] = [];

  constructor() {
    this.housingLocationList = this.housingService.getAllHousingLocations();
    // par defaiut, on charge la liste complete
    this.filteredLocationList = this.housingLocationList;
  }

  // ajout du filtre
  filterResults(text: string) {
    // si pas de texte, on recup l'ensemble de la liste
    if (!text) {
      this.filteredLocationList = this.housingLocationList;
      return;
    }

    // sinon on viens filtrer les elements
    this.filteredLocationList = this.housingLocationList.filter(
      (housingLocation) =>
        housingLocation?.city.toLowerCase().includes(text.toLowerCase()),
    );
  }
}
```

- `#filter`: permet d'ajouter une reference sur l'element HTML
- `(click)="filterResults(filter.value)"`: permet de passer dans la fonction de filtrage, la valeur de l'input avec la reference `#filter`

---

## Requete HTTP

### json-server

Lib qui permet d'utilser un server de dev pour retourner du json.

```shell
# installation de la dependance
npm install -g json-server

# lancement du serveur
json-server --watch db.json
```

A la racine du projet, créer un fichier `db.json` qui sera utiliser par le serveur de dev.

```json
{
  "locations": [
    {
      "id": 0,
      "name": "Acme Fresh Start Housing",
      "city": "Chicago",
      "state": "IL",
      "photo": "https://angular.dev/assets/images/tutorials/common/bernard-hermant-CLKGGwIBTaY-unsplash.jpg",
      "availableUnits": 4,
      "wifi": true,
      "laundry": true
    },
    {
      "id": 1,
      "name": "A113 Transitional Housing",
      "city": "Santa Monica",
      "state": "CA",
      "photo": "https://angular.dev/assets/images/tutorials/common/brandon-griggs-wR11KBaB86U-unsplash.jpg",
      "availableUnits": 0,
      "wifi": false,
      "laundry": true
    },
    {
      "id": 2,
      "name": "Warm Beds Housing Support",
      "city": "Juneau",
      "state": "AK",
      "photo": "https://angular.dev/assets/images/tutorials/common/i-do-nothing-but-love-lAyXdl1-Wmc-unsplash.jpg",
      "availableUnits": 1,
      "wifi": false,
      "laundry": false
    },
    {
      "id": 3,
      "name": "Homesteady Housing",
      "city": "Chicago",
      "state": "IL",
      "photo": "https://angular.dev/assets/images/tutorials/common/ian-macdonald-W8z6aiwfi1E-unsplash.jpg",
      "availableUnits": 1,
      "wifi": true,
      "laundry": false
    },
    {
      "id": 4,
      "name": "Happy Homes Group",
      "city": "Gary",
      "state": "IN",
      "photo": "https://angular.dev/assets/images/tutorials/common/krzysztof-hepner-978RAXoXnH4-unsplash.jpg",
      "availableUnits": 1,
      "wifi": true,
      "laundry": false
    },
    {
      "id": 5,
      "name": "Hopeful Apartment Group",
      "city": "Oakland",
      "state": "CA",
      "photo": "https://angular.dev/assets/images/tutorials/common/r-architecture-JvQ0Q5IkeMM-unsplash.jpg",
      "availableUnits": 2,
      "wifi": true,
      "laundry": true
    },
    {
      "id": 6,
      "name": "Seriously Safe Towns",
      "city": "Oakland",
      "state": "CA",
      "photo": "https://angular.dev/assets/images/tutorials/common/phil-hearing-IYfp2Ixe9nM-unsplash.jpg",
      "availableUnits": 5,
      "wifi": true,
      "laundry": true
    },
    {
      "id": 7,
      "name": "Hopeful Housing Solutions",
      "city": "Oakland",
      "state": "CA",
      "photo": "https://angular.dev/assets/images/tutorials/common/r-architecture-GGupkreKwxA-unsplash.jpg",
      "availableUnits": 2,
      "wifi": true,
      "laundry": true
    },
    {
      "id": 8,
      "name": "Seriously Safe Towns",
      "city": "Oakland",
      "state": "CA",
      "photo": "https://angular.dev/assets/images/tutorials/common/saru-robert-9rP3mxf8qWI-unsplash.jpg",
      "availableUnits": 10,
      "wifi": false,
      "laundry": false
    },
    {
      "id": 9,
      "name": "Capital Safe Towns",
      "city": "Portland",
      "state": "OR",
      "photo": "https://angular.dev/assets/images/tutorials/common/webaliser-_TPTXZd9mOo-unsplash.jpg",
      "availableUnits": 6,
      "wifi": true,
      "laundry": true
    }
  ]
}
```

Dans le service, on peut venir mettre a jours les fonction pour requeter le serveur et obtenir les donnees

```ts
export class HousingService {
  url = "http://localhost:3000/locations";

  async getAllHousingLocations(): Promise<HousingLocationInfo[]> {
    const data = await fetch(this.url);
    return (await data.json()) ?? [];
  }

  async getHouseLocationById(
    id: number,
  ): Promise<HousingLocationInfo | undefined> {
    const data = await fetch(`${this.url}/${id}`);
    const locationJson = await data.json();
    return locationJson ?? {};
  }

  submitApplication(firstName: string, lastName: string, email: string) {
    console.log(
      `Homes application received: firstName: ${firstName}, lastName: ${lastName}, email: ${email}`,
    );
  }
}
```

Il faut egalement venir passer en async les requetes dans les composants

```ts
// home.ts
export class Home {
  private readonly changeDetectorRef = inject(ChangeDetectorRef);
  housingLocationList: HousingLocationInfo[] = [];
  housingService: HousingService = inject(HousingService);
  // permet de contenir la valeur qui viendras matcher avec le critere de recherche
  filteredLocationList: HousingLocationInfo[] = [];

  // dans le constructeur on vient charger de maniere asynchrone les fonctions
  constructor() {
    this.housingService
      .getAllHousingLocations()
      .then((housingLocationList: HousingLocationInfo[]) => {
        this.housingLocationList = housingLocationList;
        this.filteredLocationList = housingLocationList;
        this.changeDetectorRef.markForCheck();
      });
  }

  // ajout du filtre
  filterResults(text: string) {
    if (!text) {
      this.filteredLocationList = this.housingLocationList;
      return;
    }

    this.filteredLocationList = this.housingLocationList.filter(
      (housingLocation) =>
        housingLocation?.city.toLowerCase().includes(text.toLowerCase()),
    );
  }
}
```

Meme chose dans la page de details 

```ts
export class Details {
  private readonly changeDetectorRef = inject(ChangeDetectorRef);
  route: ActivatedRoute = inject(ActivatedRoute);
  housingService = inject(HousingService);
  housingLocation: HousingLocationInfo | undefined;

  // construction du formulaire
  applyForm = new FormGroup({
    firstName: new FormControl(""),
    lastName: new FormControl(""),
    email: new FormControl(""),
  });

  constructor() {
    const housingLocationId = parseInt(this.route.snapshot.params["id"], 10);
    this.housingService
      .getHouseLocationById(housingLocationId)
      .then((housinLocation) => {
        this.housingLocation = housinLocation;
        this.changeDetectorRef.markForCheck();
      });
  }

  // on passe la fonction pour envoyer les donnees dans la fonction du service
  submitApplication() {
    this.housingService.submitApplication(
      this.applyForm.value.firstName ?? "",
      this.applyForm.value.lastName ?? "",
      this.applyForm.value.email ?? "",
    );
  }
}
```