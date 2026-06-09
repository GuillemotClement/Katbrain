```go
// permet de crêer des flags dans LCI	
minute := flag.Int("minute", 45, "Set a minute for the minuterie - defaut 45 minutes")
second := flag.Int("second", 0, "Set '-s' for the duration")

// viens parser les argument avec la commande de lancement de l'outil CLI 
flag.Parse()

// on peut utiliser des valeurs qui sont stocker dans la variable qui contient alors un pointeur
if *minute < 0 || *minute > 59 {
    fmt.Printf("minute invalide: %d\n", *minute)
}
if *second < 0 || *second > 59 {
    fmt.Printf("second invalide: %d\n", *second)
}
```
