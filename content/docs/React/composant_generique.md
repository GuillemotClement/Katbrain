# Créer un layout de fonctionnalité réutilisable avec React et Next.js

## Objectif

L'idée est de définir une seule fois la structure et le style communs aux différentes fonctionnalités de l'application, puis de lui transmettre uniquement les éléments qui changent :

- le titre ;
- l'icône ;
- les liens de navigation ;
- les actions éventuelles ;
- le contenu de la page avec `children`.

En React, tout ce qui est écrit entre les balises ouvrante et fermante d'un composant est reçu dans la propriété `children` :

```tsx
<FeatureLayout title="Inventaire">
  <p>Ce contenu devient la valeur de children.</p>
</FeatureLayout>
```

## Le type `ReactNode`

`ReactNode` représente tout ce que React sait afficher :

- un élément JSX ;
- une chaîne de caractères ;
- un nombre ;
- une liste d'éléments ;
- `null` ou `undefined` ;
- un fragment React.

Il convient donc pour typer `children`, une icône déjà instanciée ou une zone d'actions personnalisée.

## Composant générique

```tsx
import type { ReactNode } from "react";
import Link from "next/link";

type NavigationItem = {
  label: string;
  href: string;
};

type FeatureLayoutProps = {
  title: string;
  icon?: ReactNode;
  navigation?: NavigationItem[];
  actions?: ReactNode;
  children: ReactNode;
};

export function FeatureLayout({
  title,
  icon,
  navigation = [],
  actions,
  children,
}: FeatureLayoutProps) {
  return (
    <div>
      <header className="navbar flex items-center border bg-base-200 px-5 py-2">
        <div className="flex flex-1 items-center gap-x-2">
          {icon}
          <h2 className="text-xl font-bold">{title}</h2>
        </div>

        <nav aria-label={`Navigation ${title}`}>
          <ul className="menu menu-horizontal px-1">
            {navigation.map((item) => (
              <li key={item.href}>
                <Link href={item.href}>{item.label}</Link>
              </li>
            ))}
          </ul>
        </nav>

        {actions && <div className="ml-4">{actions}</div>}
      </header>

      <main className="container mx-auto">{children}</main>
    </div>
  );
}
```

Les propriétés `icon`, `navigation` et `actions` sont optionnelles. Le composant peut ainsi être utilisé pour une fonctionnalité simple ou plus complète sans dupliquer son style.

## Layout de la fonctionnalité Inventaire

Avec l'App Router, le fichier `app/inventory/layout.tsx` enveloppe automatiquement toutes les pages placées sous `app/inventory`.

```tsx
import type { ReactNode } from "react";
import { Plus, ShelvingUnit } from "lucide-react";

import { FeatureLayout } from "@/components/feature-layout";

const navigation = [
  { label: "Inventaire", href: "/inventory" },
  { label: "Ventes", href: "/inventory/sales" },
  { label: "Statistiques", href: "/inventory/statistics" },
];

export default function InventoryLayout({
  children,
}: Readonly<{ children: ReactNode }>) {
  return (
    <FeatureLayout
      title="Inventaire"
      icon={<ShelvingUnit aria-hidden="true" />}
      navigation={navigation}
      actions={
        <button className="btn btn-primary">
          <Plus aria-hidden="true" />
          Ajouter
        </button>
      }
    >
      {children}
    </FeatureLayout>
  );
}
```

Une page comme `app/inventory/page.tsx` ne contient alors que son propre contenu :

```tsx
export default function InventoryPage() {
  return <h1>Mes produits</h1>;
}
```

Next.js transmet automatiquement cette page au `children` du layout.

## Réutilisation pour les véhicules

```tsx
import type { ReactNode } from "react";
import { Car } from "lucide-react";

import { FeatureLayout } from "@/components/feature-layout";

const navigation = [
  { label: "Véhicules", href: "/vehicles" },
  { label: "Entretiens", href: "/vehicles/maintenance" },
  { label: "Échéances", href: "/vehicles/deadlines" },
  { label: "Statistiques", href: "/vehicles/statistics" },
];

export default function VehicleLayout({
  children,
}: Readonly<{ children: ReactNode }>) {
  return (
    <FeatureLayout
      title="Véhicules"
      icon={<Car aria-hidden="true" />}
      navigation={navigation}
    >
      {children}
    </FeatureLayout>
  );
}
```

La structure visuelle reste identique. Seules les données transmises au composant changent.

## Passer un composant ou une instance JSX

Deux approches sont possibles.

### Passer une instance avec `ReactNode`

```tsx
icon={<ShelvingUnit />}
```

Cette approche est flexible et permet de transmettre directement des propriétés à l'icône.

### Passer le type du composant

```tsx
import type { ComponentType } from "react";
import type { LucideProps } from "lucide-react";

type Props = {
  icon: ComponentType<LucideProps>;
};

function Example({ icon: Icon }: Props) {
  return <Icon className="size-5" />;
}
```

Utilisation :

```tsx
<Example icon={ShelvingUnit} />
```

Cette variante est utile lorsque le composant parent doit contrôler lui-même les propriétés de toutes les icônes.

## À retenir

- `children: ReactNode` permet d'insérer du contenu entre les balises du composant.
- Les autres zones personnalisables peuvent également être typées avec `ReactNode`.
- Les données simples, comme le titre et les liens, sont transmises avec des propriétés classiques.
- Un fichier `layout.tsx` de l'App Router reçoit automatiquement la page courante dans `children`.
- La structure et le style communs restent dans `FeatureLayout` ; les layouts propres aux fonctionnalités ne contiennent que leur configuration.