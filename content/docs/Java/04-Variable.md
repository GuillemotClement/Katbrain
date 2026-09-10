# 04 Variable 

## Adressage mémoire 

Chaque programme est chargé en mémoire vive avant son exécution. La RAM contient le code du programme, et les données du programme.

La mémoire d'un ordinateur est organisé comme un tableau excel. Chaque cellule contient un numéro unique. En connaissant ce numéro unique, il est possible d'accéder à la valeur, écrire dans cet emplacement, ...

Le programme et ses données sont stockées en mémoire pendant son exécution. Toutes la mémoire du pc est représentée sous forme de petite case - des octets. Chaque case à son numéro unique.

Lorsqu'une variable est déclaré dans le code du programme, un bloc mémoire libre lui est alloué. Selon le type de la variable, la taille de l'emplacement mémoire varie.

## `String` en mémoire 

Le type `String` est capable de contenir de grands volumes de données. Ce n'est pas un simple type de données, mais un objet.

Les données de type `String` sont placée dans un objet spéciale pour lequel de la mémoire est allouée. L'adresse de cet objet est placé dans la variable, pour laquelle de la mémoire est également allouée.

```java
String s1 = "Hello";
String s2 = s1;
s2 = s2 + " World";
System.out.println(s1); // "Hello"
System.out.println(s2); // "Hello World"
```

Les deux variables `s1` et `s2` référencent la même chaîne jusqu'au moment de la modification. Lorsque l'on vient faire la concaténation, une nouvelle chaîne est créer pour `s2`, tant dis que `s1` pointe toujours vers l'ancienne string.
