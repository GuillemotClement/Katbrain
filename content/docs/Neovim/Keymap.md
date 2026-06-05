# Keymap 

The configuration is inspired by this blog : https://vincent.jousse.org/blog/fr/tech/configurer-neovim-comme-ide-a-partir-de-zero-tutoriel-guide/

## Ajout raccourcis

`lua/core/keymaps.lua` contient la confiration de keymaps. 

La fonction permet de spécifier le raccourcis. En quatrièmme argument, il prends une clé-valeur qui permet d'ajouter une description au raccourcis.

`keympa([mode], [nouvelle touches], [Ancienne Touche], { desc = "description" })`

## Commandes de base 

- `;;`: sortir du mode edition [I]
- `i`: [v] déplace le texte sélectionné vers le haut en mode visuel
- `k`: [v] déplace le texte sélectionné vers le bas en mode visuel 
- `I`: [V] déplace le texte sélectionné vers le haut en mode visuel bloc 
- `K`: [V] déplace le texte sélectionné vers le bas en mode visuel bloc

- `yy` : (N) copie la ligne entière
- `yyp` : (N) copie et colle en dessous
- `p` : (N) coller en dessous 
- `P`: (N) coller au dessus 


---
# Plugins 

## Ajout de plugin

Pour chaque nouveau plugin, on créer un nouveau fichier dans `lua/plugins/[plugin_name].lua`. Lazy se charge de télécharger le plugin, et de le charger dans la configuration Nvim. 

- `:Lazy`: lance la fenetre de gestion des plugins
- `q`: quitter la fenetre de gestion 
- `U`: update des plugins

---

# Plugins installés

## lazy.nvim 
Il permet de gérer l'installation et la configuration des différents plugins. Pour chaque nouveau plugin, on vient créer un nouveau fichier qui permet de set une configuration.

Pour ouvrir la fenêtre de gestion des plugins, on peut utiliser `:Lazy`, et `q` pour quitter.L'utilisation de `U` permet de mettre à jour automatiquement tous les plugins.

La config se trouve dans `lua/config/lazy.lua`.

---

## Theme 
[Liste de theme](https://dotfyle.com/neovim/colorscheme/trending) 

Dans le fichier, utiliser la config fournis dans le Github, en se basant sur cet exemple 

```lua 
return {
  "[repo_name]",
  lazy = false,
  priority = 1000,
  opts = {},
  config = function()
    -- chargement du thème
    require('[theme_name]').load()
  end,
}
```
---

## nvim-tree.lua 
Ajoute l'explorateur de fichier.

- `<leader>e`: ouvre l'explorateur. Définis dans le fichier de config du pugins 
- `a`: Permet de créer un nouveau fichier, ou dossier -> `/file.txt` | `/file/` 
- `d` : Supprimer un fichier 
- `r`: Renommer
- `x`: Couper 
- `c`: Copier
- `p`: Coller
- `R`: Rafraichir
- `H`: Afficher/masquer les fichiers cachés

Les raccourcis suivant sont définis dans le fichier `lua/core/keymaps.lua`:
- `<C-h>`: déplace le curseur dans la fenetre de gauche 
- `<C-j>`: déplace le curseur dans la fenetre du bas 
- `<C-k>`: déplace le curseur dans la fenetre du haut 
- `<C-l>`: déplace le curseur dans la fenetre de droite

---

## telescope.lua

Recherche par mot. Le fichier `lua/plugins/telescope.lua` permet de définir la configuration.
[Keymap default](https://github.com/nvim-telescope/telescope.nvim#default-mappings)

- `<Ctrl-k>` : remonte dans la liste de sélection 
- `<Ctrl-j>` : descend dans la liste de sélection  
- `<leader>ff`: recherche de string dans les noms de fichier  
- `<leader>fg`: recherche de string dans le contenu du fichier  
- `<leader>fb`: recherche de string dans les noms de buffers 
- `<leader>fx`: recherche de string sous le curseur 

---

## bufferline.lua 
Permet d'avoir un aperçu des buffers en cours (`lua/plugins/bufferline.lua`).

Raccourcis définis dans `lua/core/keymaps`: 
- `<S-l>`: [n] passer au buffer suivant 
- `<S-h>` : [n] passer au buffer précédent 

---

## Lualine - `lua/plugins/lualine.lua`

Ajoute la barre de status.
[Documentation](https://github.com/nvim-lualine/lualine.nvim)

---

## Treesitter - `lua/plugins/treesitter.lua`

Permet de parser et comprendre la syntaxe des langages. Apporte la coloration syntaxique, indentation intelligente, tags automatique, et contexte.

[Language supportés](https://github.com/romus204/tree-sitter-manager.nvim/tree/main/runtime/queries) a ajouter dans le `ensure_installed` de la configuration.

---

## Nvim-cmp - `lua/plugins/nvim-cmp.lua`

Ajout de l'autocomplétion. Il fournit l'interface et doit ensuite etre configuré avec les lsp, snippets, etc.
Il est possible d'ajouter des [sources possible](https://github.com/hrsh7th/nvim-cmp/wiki/List-of-sources)

- `<C-k>`: suggestion précédente 
- `<C-j>`: suggestion suivamte
- `<C-b>`: défile la documentation vers le haut  
- `<C-f>`: défile la documentation vers le bas
- `<C-space>`: ouvre manuellement le menu d'autocompletion
- `<C-e>`: ferme le menu d'autocompletion
- `Enter`: valide une suggestion

--- 

## Support des LSP
Les LSP sont des protocoles qui permettent à Neovim de connaître le language de programme sur lequel on travail. C'est via les LSP que l'on peut ajouter de l'auto-complète ou le go to definition.
Ces protocoles ne sont pas spécifique à Neovim, mais sont utiliser par les IDE.

---

## lspconfig - `lua/plugins/lsp/lspconfig.lua`

Permet de configurer de manière unifié les différents LSP.

- `gd`: [n] accéder à la définition -> où c'est défini
- `gD`: [n] accéder à la déclaration 
- `gR`: [n] affiche tous les endroits où l'élément est utilisé -> où c'est utilisé
- `gi`: [n] accéde au éléments qui implément (ex une interface Go) -> qui implémente
- `gt`: [n] accède au type type définition d'un type Go par exemple
- `K`: [n] affiche la documentation
- `gs`: [n] affiche la signature d'une fonction
- `<leader>rn`: [n] renommage
- `<leader>ca`: [n] code action 
- `<leader>d`: [n] affiche les erreurs de la ligne courante
- `<leader-D`: [n] affiches les erreurs du fichier
- `[d`: [n] diagnostics précédent
- `]d`: [n] diagnostics suivant
- `<leader>F`: [n] formate le fichier
- `<leader>rs`: [n] relance le serveur LSP

---

## Mason - `lua/plugins/lsp/mason.lua`

Installe les LSP. `ensure_installed` permet d'ajouter des nouveaux language. Il seront automatiquement téléchargement est les indiquant dans cette liste.
[Liste des language](https://mason-registry.dev/registry/list)

- `:LspInfo`: affiche la liste des LSP 

---

## Trouble - `lua/plugins/trouble.lua`

Remonte les erreurs remonté par le LSP: permet de voir les définitions de fonction du fichier, etc 

- `<leader>xx`: [n] ouvre/ferme la liste des diagnostics du projet 
- `<leader>xX`: [n] ouvre/ferme la liste pour le fichier courant 
- `<leader>cs`: [n] affiche les symboles du fichier, le outline de VSCODE 
- `<leader>cl`: [n] affiche les informations LSP liées à l'élément sous le curseur (endroit de la défintion, où est utilisé, ..)
- `<leader>xL`: [n] affiche la location list 
- `<leader>xQ`: [n] affiche la Quickfix List 

---

## Conform - `lua/plugins/conform.lua`

Ajoute le formatage automatique à la sauvegarde. Les LSP sont à préciser.

- `<leader>mp`: [v] formate le fichier 

---

## Gitsigns - `lua/plugins/gitsigns.lua` 

Affiche les status de suivis Git. Les blocs sont définie dans des **hunk**.

- `]h`: [n] hunk suivant 
- `[h`: [n] hunk précédent 
- `<leader>hs`: ajoute le hunk courant au stage 
- `<leader>hr`: annule le hunk courant 
- `<leader>hR`: annule les modification du fichier 
- `<leader>hu`: annule `<leader>hs` 
- `<leader>hp`: affiche un mini dif 
- `<leader>hb`: git blame pour la ligne courante 
- `<leader>hB`: git blamce afficher en permanent 
- `<leader>hd`: git diff du fichier courant 
- `<leader>hD`: compare avec le commit précédent 
- `ih`: text object 

---

## whichKey - `lua/plugins/whichkey.lua` 

Permet de voir les informations sur les commandes 

- `<leader>?` : affiche la liste des raccourcis possible dans le contexte actuel.

---

## Todo 
Permet de mettre en valeur les TODO. On peut utiliser ces commentaires: 

- `TODO`: a faire 
- `FIX` 
- `FIXME`: a corriger 
- `BUG`: bug connu 
- `HACK`: solution temporaire 
- `WARN`
- `WARNING` 
- `NOTE`: information 
- `PERF`: optimisation 
- `TEST`: test a ajouter 

- `]t`: commentaire TODO suivant 
- `[t`: commentaire TODO précédent 

---

## Indent-blankline - `lua/plugins/indent-blankline.lua`

Ajout des guides d'indentation 

--- 

## Autopairs - `lua/plugins/autopairs.lua`
 
Pairing auto des parenthèses

---

## Rainbow delimiters - `lua/plugins/rainbow-delimiters.lua` 

Ajout de parenthèse de couleurs 

---

## Noice - `lua/plugins/noice.lua` 

Modification de l'interface des erreurs et des notifications par défaut et les passe en haut à droite. Modifier l'interface de recherche ou les `cmdline` en affichant une popup 

---

## Render Markdown - `lua/plugins/render-markdown.lua`

Permet d'avoir un affichage propre du markdown.



















