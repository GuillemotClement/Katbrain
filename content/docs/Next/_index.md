# Next JS

`app`: le dossier dans lequel le code est ecrit

Par defaut, les composants sont des `React Server Components`. C'est le server qui vient rendre ces composant, et pas le naviagateur.

---

## React Router

Next utilise un routeur qui se base sur le system file.

### layout.tsx

Fichier qui permet de definir un layout pour plusieurs pages. Il sera utiliser dans toutes les pages enfants.

```tsx
import Link from "next/link";

export default function RootLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return (
    <html lang="en">
      <body>
        <nav>
          <Link href="/">home</Link>
          {" | "}
          <Link href="/notes">notes</Link>
          {" | "}
          <Link href="/notes/new">create new</Link>
        </nav>
        {children}
      </body>
    </html>
  );
}
```

### page.tsx

C'est le fichier qui permet d'avoir une nouvelle page.

```tsx
const Home = () => {
  // instruction js
  console.log("hello next.js"); // afficher dans les log du terminal
  // composant
  return (
    <div>
      <div>
        <h2>notes app</h2>
        An example app for{" "}
        <a href="https://courses.mooc.fi/org/uh-cs/courses/full-stack-open-nextjs">
          Full Stack Open Next.js
        </a>
      </div>
      <div>
        See{" "}
        <a href="https://github.com/fullstack-hy2020/nextjs-notes">
          https://github.com/fullstack-hy2020/nextjs-notes
        </a>{" "}
        for the source code
      </div>
    </div>
  );
};
export default Home;
```

### Link

Permet de creer un lien vers une page du projet

```tsx
<Link href="/notes/new">create new</Link>
```

---

## `app/servies`

Dossier qui contient la logique de traitement des donnees.

```ts
//app/services/notes.ts
const notes = [
  {
    id: 1,
    content: "next.js utilizes React Server Components",
    important: true,
  },
  { id: 2, content: "next.js is built on top of React", important: true },
  {
    id: 3,
    content: "next.js supports both static and dynamic rendering",
    important: false,
  },
];

let nextId = 4;

export const getNotes = () => {
  return notes;
};

export const addNote = (content: string, important: boolean) => {
  notes.push({ id: nextId++, content, important });
};
```

Dans le composant, on vient alors utiliser la fonction pour recuperer les donnees.

```tsx
import { getNotes } from "../services/notes";

const notes = getNotes();
const Notes = () => {
  return (
    <div>
      <h2>Notes</h2>
      <ul>
        {notes.map((note) => (
          <li key={note.id}>
            {note.content} {note.important && <strong>(important)</strong>}
          </li>
        ))}
      </ul>
    </div>
  );
};
export default Notes;
```

---

## Form

Next fournis des `Server Action` qui sont des fonctions qui tourne sur le serveur, et peuvent etre appeler directement depuis un formulaire dans le navigateur.

### `app/actions`

Dossier contenant les servers action du projet.

```tsx
// indique des methodes serveurs
// app/actions/notes.ts
"use server";

import { redirect } from "next/navigation";
import { revalidatePath } from "next/cache";
import { addNote } from "../services/notes";

export const createNote = async (formData: FormData) => {
  const content = formData.get("content") as string;
  const important = formData.get("important") === "on";
  addNote(content, important);
  revalidatePath("/notes"); // permet de recharger les donnees
  redirect("/notes");
};
```

Pour connecter le formulaire a la methode actions 

```tsx
// app/notes/new/page.tsx
import { createNote } from "./actions"

const NewNote = () => {
  return (
    <div>
      <h2>Create a new note</h2>
      // set la fonction permettant de traiter le formulaire
      <form action={createNote}>
        <div>
          <label>
            Content
            <input type="text" name="content" required />
          </label>
        </div>
        <div>
          <label>
            <input type="checkbox" name="important" />
            Important
          </label>
        </div>
        <button type="submit">Create</button>
      </form>
    </div>
  )
}

export default NewNote
```