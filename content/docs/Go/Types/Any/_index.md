## 25 - 1: type assetion v, ok := x.(T) 

Permet de tester que la valeur réel de l'instace est du type recherche. Permet de cette maniére d'appliquer des comportements spécifique selon le type.


Une **type assertion** permet de récupérer la valeur concrète contenue dans une interface, et de vérifier qu'elle est bien du type attendu.

```go 
v, ok := x.(T)
```

Essaie d'extraire du type d'interface `x` une valeur de type `T`. Si cela réussit, met la dans `v` et fixe `ok` a `true`, sinon `ok` = `false`

Généralement utiliser sur: 
- `any` == `interface{}`
- `error`
- une interface (`io.Reader`, `fmt.Stringer`)

`T` peut être: 
- un type concret (`int`, `string`, `Task`)
- une interface (`fmt.Stringer`, `error`, une interface)

On vient vérifier la presence d'un comportement ou d'un ensemble de méthodes précise dans la valeur contenu dans `x`

### Pattern d'utilisation 

#### Porme sur 

```go 
func printAsInt(x any) {
    // type assrtion -> on vérifie sur l'interface est de type int  
	n, ok := x.(int)
	if !ok {
		fmt.Printf("not an int: type=%T\n", x) // not an int: type=string
		return
	}
	fmt.Println("int:", n) // int: 42
}

func main() {
	printAsInt("42")
	printAsInt(42)
}
```

#### Forme non sur 

On utilise pas le `ok`, ce qui empeche de vérifier si le type correspond. Dans ce cas, si le type ne correspond pas dans l'interface, on obtient une `panic`.

On l'utilise dans le cas où l'on souhaite vraiment que le programme s'arrête si le type ne correspond pas, car c'est une violation du contrat, et continuer n'a pas de sens.

```go 
func main() {
	var x any = "go"
	_ = x.(int) // panic: interface conversion: interface {} is string, not int
	fmt.Println("unreachable")
}
```

### Cas pratique 

#### Rendu du résultat sans type switch 

Parfois, on veux qu'une commande renvoie une seule tâche, parfois une liste de tâches, parfois uniquement la chaîne "done". On veux une seule fonction `renderResult` qui accepte n'importe quoi et l'affiche.

Création du modéle de donnée: 

```go 
type Task struct {
	ID    int
	Title string
	Done  bool
}
```

La fonction `renderResult()`: 

```go 
func renderResult(x any) {

    //controle si la valeur est de type string 
    if s, ok := x.(string); ok {
		fmt.Println(s)
		return
	}

    //controle si de valeur task 
    if t, ok := x.(Task); ok {
		fmt.Printf("#%d %s (done=%v)\n", t.ID, t.Title, t.Done)
		return
	}

	fmt.Printf("unknown result: type=%T value=%v\n", x, x)
}
```
Utilisation: 

```go
func main() {
	renderResult("ok")                     // ok
	renderResult(Task{ID: 1, Title: "Go"}) // #1 Go (done=false)
	renderResult(123)                      // unknown result: type=int value=123
}
```

#### Assertion sur une interface: vérfiier le comportement 

Le type assertion peut se faire sur une interface. Elle permet de vérifier un comportement. 

La lib `fmt` connaît l'interface: 
```go 
type Stringer interface {
	String() string
}
```

Si une valeur implémente `String() string`, alors `fmt` peut l'afficher. Si le résultat d'une commande sait se décrirem, on peut l'afficher avec `String()`.

```go 
// Task implémente la fonction String()
func (t Task) String() string {
	status := " "
	if t.Done {
		status = "x"
	}
	return fmt.Sprintf("[%s] #%d %s", status, t.ID, t.Title)
}
```

Désormais `renderResult()` peut d'abord vérifier si on peut utiliser avec `fmt.Stringer`: 

```go 
func renderResult(x any) {
    // implemente la methode, on check si c'est du type fmt.Stringer pour utiliser permettre l'utilisation de String() sur la valeur 
	if s, ok := x.(fmt.Stringer); ok {
		fmt.Println(s.String())
		return
	}
	fmt.Printf("fallback: %T %v\n", x, x)
}

func main() {
	renderResult(Task{ID: 2, Title: "Write code"}) // [ ] #2 Write code
}
```

#### Assertion sur interface error: reconnaître une erreur spécial 

Les erreurs sont la raison la plus fréquente d'utiliser le type assertion. Dans la lib standard, on rencontre une approche: une erreur peut implémenter des méthodes supplémentaire, et alors on peut la traiter de maniére plus intelligente.

On as une fonction qui renvoie une `error` et parfois cette erreur avec un attribut supplementaire. 

On créer l'interface erreur temporaire:
 
```go 
type temporary interface {
	error
	Temporary() bool
}
```

On viens créer le type d'erreur: 

```go 
type TempError struct{ msg string }

func (e TempError) Error() string   { return e.msg }
func (e TempError) Temporary() bool { return true }
```

On implémente le traitement: 

```go 
func handle(err error) {
	if err == nil {
		return
	}
    
    // si contient le type erreur temporaire, on ajoute le message
	if t, ok := err.(temporary); ok && t.Temporary() {
		fmt.Println("temporary problem, try again") // temporary problem, try again
		return
	}

	fmt.Println("fatal:", err.Error())
}
```

Ici, on retrouve une philosophie Go: au lieu d'une grosse hiérachie d'exceptions, on as de petites interfaces que l'on peut vérifier de manière ciblée via le type assertion.

### Nuances: T vs *T, nil et porée 

#### T & *T 

Le type assertion reconnait une différence le type concret qui se trouve dans 'interface'. Il fait une distinction entre `T` et `*T`.

Bonne pratique: si on conçoit une API, il faut rester cohérent: soit on stocke que des valeurs, soit des pointeurs. Si on travail avec une API tierce, il faut reprendre la façon de faire.

```go 
type User struct{ Name string }

func main() {
	u := User{Name: "Ann"} // T 
	p := &User{Name: "Bob"} // *T 

	var x any = u // on passe T
	_, ok1 := x.(User)
	_, ok2 := x.(*User)
	fmt.Println(ok1, ok2) // true false

	x = p // on passe *T
	_, ok3 := x.(User)
	_, ok4 := x.(*User)
	fmt.Println(ok3, ok4) // false true
}
```

#### Nuance nil 

Si le type existe mais que la valeur est `nil`, l'interface elle même n'est pas `nil`.

```go 
func main() {
	var p *int = nil
	var x any = p

	q, ok := x.(*int)
	fmt.Println(ok)       // true, x contient bien un point *int 
	fmt.Println(q == nil) // true, la valeur du pointeur est nil 
}
```
L'assertion vers `*int` fonctionne, parce que le type a l'interieur est `*int`, même si la valeur est `nil`.

`ok == true` garantit que le type correspond.

#### Pattern bloc étroit: assertion dans un if, pour ne pas encombrer la portée

On peut utilser `v, ok := ...` directement dans le `if`, afin que `v` ne vive que la il est nécessaire.

```go 
func printID(x any) {
    // existe que dans la portée de if 
	if t, ok := x.(Task); ok {
		fmt.Println(t.ID) // print the task ID
		return
	}
	fmt.Println("no task here")
}
```

 ## 25-2: Type switch: choix de la branche 

 Le type switch permet de gérer proprement lorsque la valeur arrive sous forme d'interface, et qu'il faut choisir la logique selon le type concret.

 Le type switch est appropier pour ces cas : 
 - `error` et on souhaite savoir s'il s'agit d'un type d'erreur précis 
 - construction d'un dispatcher de commande/event 
 - commande différentes représenter par des structures différentes mais stockée derrière une interface 

 Go considère le type assertion et le type switch comme l'un des moyens de voir le type concret d'une erreur.

 ### Switch ordinaire et type switch 

 Un switch ordinaire choisit une branche selon la valeur d'une expression.

Le type switch choisit une branche selon le type concret de la valeur d'une interface.

Lorsque l'on ecrit un `switch` ordinaire, le compilaire connait le type de l'exporession. Lorsque l'on écrit un type switch, le compilateur sait que c'est une interface, et on lui demande de vérifier le type concret de l'interface et de fournir une varaible de ce type.

L'écriture `x.(type)` ne peut pas être utilisée comme expression seule. Elle n'existe que dans la construction du type switch.  

```go 
switch v := x.(type) {
case int:
    // v has type int
case string:
    // v has type string
default:
    // v is still available as x (the interface), and v does not exist
}
```

- `x`: doit avoir un type d'interface 
- `v`: dans chaque branche obtenit le type concret de cette branche 


On veut une fonction de debogage qui affiche une description de la valeur: 

```go 
func describe(x any) {
    // switch type qui teste le type any de la valeur fournis 
	switch v := x.(type) {
    // le type est int 
	case int:
		fmt.Println("int:", v) // int: 7
    // le type est string 
	case string:
		fmt.Println("string:", v) // string: go
    // autre type 
	default:
		fmt.Printf("unknown: %T\n", x) // unknown: bool
	}
}
```

#### Dispatcher de commandes 

Le parseur de commande renvoie `any` car la commande peut avoir une forme différente. Par exemple `AddCmd()`, `DoneCmd()`, ou `ListCmd()`. Le dispatcher fait une branche selon le type.

On viens définir les types de commande: 

```go 
type AddCmd struct{ Title string }
type DoneCmd struct{ ID int }
type ListCmd struct{}
```

On créer ensuite un exécutant de commande. Dans un vrai projet, on réalise une interface avec une méthode `Run()`. Ici, l'objectif est de monter le mécanisme de dispatch 

```go 
func runCommand(cmd any) error {
    // on viens vérifier le type de la commande fournis et exécuter une logique celon celui-ci 
	switch c := cmd.(type) {
	case AddCmd:
		fmt.Println("ADD:", c.Title) // ADD: Buy milk
	case DoneCmd:
		fmt.Println("DONE:", c.ID) // DONE: 3
	case ListCmd:
		fmt.Println("LIST") // LIST
	default:
		return fmt.Errorf("unknown command type %T", cmd)
	}
	return nil
}
```

On peut ensuite l'utiliser de cette maniere dans `main()`: 
```go 
func main() {
	_ = runCommand(AddCmd{Title: "Buy milk"}) // ADD: Buy milk
	_ = runCommand(DoneCmd{ID: 3})            // DONE: 3
	_ = runCommand(ListCmd{})                 // LIST
	fmt.Println("ok")                         // ok
}
```

### Plusieurs types dans un case 

Si plusieurs types sont énumérés dans un `case`, la variable `v` ne reçoit par un type unique précis. Le compilateur choisit une variante commune pour cette branche. En pratique, `v` aura le type de l'expression source du type switch.

```go 
func printNumber(x any) {
	switch v := x.(type) {
	case int, int64:
		fmt.Printf("number: %v\n", v) // number: 10
	default:
		fmt.Printf("not a number: %T\n", x)
	}
}
```

### Branche d'interface 

On peut venir faire une branche sur une interface. Cela permet de tester que l'interface possede les methodes attendu.

```go 
type Task struct{ Title string }

func (t Task) String() string { return "Task: " + t.Title }

func show(x any) {
	switch v := x.(type) {
    // verifie si le type de la valeur implemente les methode de l'interface => String() pour ce test 
	case fmt.Stringer:
		fmt.Println(v.String()) // Task: Read Go book
	default:
		fmt.Printf("%v\n", x)
	}
}
```

### `case nil` & `nil` type 

`case nil` ne catch que les interface `nil`. Si dans l'interface, on retrouve un `nil type`, cela ne match pas. 

```go 
type Task struct{ Title string }

func main() {
	var t *Task = nil
	var x any = t

	switch v := x.(type) {
	case nil:
		fmt.Println("nil interface")
	case *Task:
		fmt.Println("typed nil pointer:", v == nil) // typed nil pointer: true
	}
}
```

### Ordre des case: precis vers generique 

Lorsque l'on utilise un type switch avec des type concrets et des interfaces, l'ordre des branches deviens important. On commence par tester l'interface, qui est plus precise, puis en remonte en testant les type concrets.

```go 
type Task struct{ Title string }

func (t Task) String() string { return "Task(" + t.Title + ")" }

func main() {
	var x any = Task{Title: "Learn type switch"}

	switch v := x.(type) {
	case fmt.Stringer:
		fmt.Println("stringer:", v.String()) // stringer: Task(Learn type switch)
	case Task:
		fmt.Println("task:", v.Title)
	}
}
```

---

## 25-3: Typed errors: structure d'erreur, `Error()` et `Unwrap()`

Le typed error permet de garder l'erreur comme valeur mais devient une valeur structuree. Elle permet de stocker le contexte dans des champs

Un typed error est une structure ordinaire qui possède une methode `Error() string`.

Par exemple, un user saisit un ID de tache sous forme de string et on souhaite valider cette entree.

```go 
type InvalidIDError struct {
	Input string // ce que l’utilisateur a saisi
}

// impléementation de la methode pour convenir a l'interface Error
func (e InvalidIDError) Error() string {
	return fmt.Sprintf("invalid id %q", e.Input)
}
```

On obtient un champ `Input` accessible au code permettant ensuite de dèfinir des message d'erreur plus précis. On peut ensuite l'utiliser comme une erreur normal.

```go 
func ParseID(s string) (int, error) {
	id, err := strconv.Atoi(s)
	if err != nil {
    // on utilise la typedError 
		return 0, InvalidIDError{Input: s}
	}
	return id, nil
}
```

 ### Bonne pratique 

 Une `Error()` doit rester compacte, agreable a lire dans la console. Le reste est plus interessant a conserver dans des champs. Elle ne promet pas de format stable pour une analyse machine. 

 En Go, la responsabilité d'une erreur est de sommer le contexte afin que le message soit utile. Les types errors pernet de definir le contexte avec `Error()`, mais on conserve les details dans les champs 

 Exemple d'une table introuvable: 

 ```go 
 type TaskNotFoundError struct {
	ID int
}

func (e TaskNotFoundError) Error() string {
	return fmt.Sprintf("task %d not found", e.ID)
}
 ```

La valeur `ID` est disponible dans séparément dans le champ de la struct. 

### Typed errors pour la validation et les regles metiers 

Dans le gestionnaire de taches, les erreurs appartiennent a trois classes diferentes au niveau du sens: 
- entree invalide => validation 
- tache introuvable => not found 
- imprevue => internal I/O, etc 

On vient définir trois types 

```go 
type ValidationError struct {
	Field string
	Msg   string
}

func (e ValidationError) Error() string {
	return "invalid " + e.Field + ": " + e.Msg
}

type TaskNotFoundError struct {
	ID int
}

func (e TaskNotFoundError) Error() string {
	return fmt.Sprintf("task %d not found", e.ID)
}

type OpError struct {
	Op  string
	Err error
}

func (e *OpError) Error() string {
	return e.Op + ": " + e.Err.Error()
}
```

### Value receiver et pointer receiver dans `Error()`

On peut définir `Error()` comme méthode de valeur (`fun(e T) Error() string`) ou comme méthode de pointeur (`fun(e *T) Error() string`). Les deux variants sont possible et le comportement est différents. 

Si `Error()` est définit sur `*T`, alors seul `*T` implémente l'interface `error`.

```go 
type MyError struct{}

func (e *MyError) Error() string { return "boom" }

func main() {
	// var err error = MyError{} // ne compilera pas
	var err error = &MyError{} // ok
	fmt.Println(err)           // boom
}
```

La règle pratique: si l'erreur est petite, immuable et ne contient pas de cause interne, il est commode de définir `Error()` avec une value receiver et de retourner la valeur. Si l'erreur contient un `Err error` imbriqué, ou si on souhaite éviter une copie, on utilise un pointer receiver et on retourne un pointeur 

### Wrappers d'erreur 

Lorsque les erreurs remontent dans la pile, on souhaite conserver le contexte. On utilise alors `%w` qui fournit le wrapping. Il est parfois plus pratique d'avoir son propre wrapper ave des champs (`Op`, `ID`, `Filename`).

En Go, la convention est établie: si une erreur contient une autre erreur et que l'on souhaite que le code externe puisse atteindre la cause, on implémente la mùthode `Unwrap() error` qui retourne l'erreur imbriquée, 

```go 
type OpError struct {
	Op  string
	Err error
}

func (e *OpError) Error() string { return e.Op + ": " + e.Err.Error() }
func (e *OpError) Unwrap() error { return e.Err }
```

On obtient alors une chaine d'erreurs, la couche externe indique quelle operation, la couche interne la raison de l'erreur. 

On implémente une interface de stockage: 
```go 
type Storage interface {
	MarkDone(id int) error
}
```

On ajoute la fonction permettant de passer une task comnme Done: 

```go 
func MarkDone(s Storage, rawID string) error {
	id, err := ParseID(rawID)
	if err != nil {
		return &OpError{Op: "parse id", Err: err}
	}

	if err := s.MarkDone(id); err != nil {
		return &OpError{Op: "mark done", Err: err}
	}
	return nil
}
```

Chaque Wrapper ajoute un sens et la cause est préservé

Le stokcage peut renvoyer une erreur metier si la tache existe pas 

```go 
type InMemoryStorage struct {
	done map[int]bool
}

func (s *InMemoryStorage) MarkDone(id int) error {
	if _, ok := s.done[id]; !ok {
		return TaskNotFoundError{ID: id}
	}
	s.done[id] = true
	return nil
}
```

## 25-4: Extraction du contexte via `errors.As` 

`errors.As()` permet de trouver dans la chaîne d'erreurs, celle que l'on peut affecter à une variable d'un type donné. Si trouvée, alors elle est placer dans la variable pour que l'on puisse lire ses champs.

On vient passer `err` et `&.target` pour passer l'adresse de la variable qui vient récupérer la valeur.

```go 
type ValidationError struct {
	Field string
	Msg   string
}

func (e ValidationError) Error() string {
	return "invalid " + e.Field + ": " + e.Msg
}

func main() {
	err := fmt.Errorf("create task: %w", ValidationError{Field: "title", Msg: "empty"})
    
    // prépare la varaible de stockage 
	var ve ValidationError
    // vérification du type de l'erreur 
	if errors.As(err, &ve) {
		fmt.Println(ve.Field) // title
	}
}
```

Ici `&ve` signifie: prends l'adresse de la variable `ve` pour que `errors.As` puisse y écrire l'erreur trouvée. 

### Exemple 

```go 
// déclaration du modèle de données
type Task struct {
	ID    int
	Title string
	Done  bool
}

// déclaration du stockage 
var tasks []Task
var nextID = 1

// déclaration du typed error
type ValidationError struct {
	Field string
	Msg   string
}

func (e ValidationError) Error() string {
	return fmt.Sprintf("invalid %s: %s", e.Field, e.Msg)
}

// wrapper d'erreur qui permet d'ajouter le nom de l'operation
type OpError struct {
	Op  string
	Err error
}

func (e *OpError) Error() string { return e.Op + ": " + e.Err.Error() }
func (e *OpError) Unwrap() error { return e.Err }

// couche présentation => la struct permet de représenter ce qui compte pour l'UX 
// elle se convertit en JSON ou texte
type UserError struct {
	Code    string            // "validation", "not_found", "internal"
	Message string            // court pour l'utilisateur
	Fields  map[string]string // details de validation (s'il y en a)
}

// AddTask: valide les données et retourne l'erreur 
func AddTask(title string) (Task, error) {
    // validation 
	if title == "" {
        // on utilise l'erreur typer 
        base := ValidationError{Field: "title", Msg: "must not be empty"}
        // on ajoute le contexte via le wrapper 
		return Task{}, &OpError{Op: "AddTask", Err: base}
	}

    // création de la nouvelle task et ajoute dans le slice 
	t := Task{ID: nextID, Title: title}
	nextID++
	tasks = append(tasks, t)

	fmt.Println("created task:", t.ID) // created task: 1
    // si echec d'ajoute, on obtient cette erreur: AddTask: invalid title: must not be empty 
	return t, nil
}

// permet de gérer un affichage propre des erreurs pour l'utilisateur 
// selon le type de l'erreur, on affiche un message différents
func ToUserError(err error) UserError {
	var ve ValidationError
	if errors.As(err, &ve) {
		return UserError{
			Code:    "validation",
			Message: "Veuillez verifier les donnees saisies",
			Fields:  map[string]string{ve.Field: ve.Msg},
		}
	}

    	var nf *NotFoundError
	if errors.As(err, &nf) {
		return UserError{
			Code:    "not_found",
			Message: "La tache est introuvable",
		}
	}

    // pour une erreur inconnu, on affiche pas la raison technique => cache les détails interne
	return UserError{
		Code:    "internal",
		Message: "Impossible d'executer l'operation",
	}
}

// la fonction permet d'obtenir un affichage adapté selon la cible: dev ou utilisateur 
func handleErrorAtBoundary(err error) {
    // appelle de la fonction de formatage d'erreur 
	ux := ToUserError(err)
    
    // ajoute le prefix adapté
    // on envoi un message pour user et un message pour le diag 
	fmt.Println("USER:", ux.Message)   // USER: Veuillez verifier les donnees saisies => envoyer dans la stderr
	fmt.Println("DEBUG:", err.Error()) // DEBUG: AddTask: invalid title: must not be empty => envoyer dans les logs 
}

// RECUPERATION DE TACHE 
// création de la typed error 
type NotFoundError struct {
	ID int
}

// formatage du message d'erreur 
func (e *NotFoundError) Error() string {
	return fmt.Sprintf("task %d not found", e.ID)
}

// fonction recherche
func FindTask(id int) (Task, error) {
	for _, t := range tasks {
		if t.ID == id {
			return t, nil
		}
	}
	return Task{}, &NotFoundError{ID: id}
}

// assemblage 
func main() {
	var title string
	fmt.Scan(&title)

	_, err := AddTask(title)
	if err != nil {
		handleErrorAtBoundary(err)
		return
	}

	fmt.Println("OK") // OK
}
```
