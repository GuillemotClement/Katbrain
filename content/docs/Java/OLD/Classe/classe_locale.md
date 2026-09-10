---
date: 2026-06-16T16:24:11+02:00
---
# Classe_locale

Classe déclarée à l'intérieur d'une méthode, ou d'un bloc de code. Elle est visible uniquement dans cette méthode.

```java
public class Outer {
    void someMethod() {
        class Local {
            void print() {
                System.out.println("Hello from Local!");
            }
        }
        Local local = new Local();
        local.print();
    }
}
```
