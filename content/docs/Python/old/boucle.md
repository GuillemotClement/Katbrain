---
date: 2026-06-09T20:53:50+02:00
---
# Boucle

## `for` 

```python 
for i in range(0, 10):
    print(i)
```

-`i`: prends la valeur 0 
- par défaut, incrémenté de 1 
- `(0, 10)`: 0 inclut et 10 exclut 

---

## `range()`

La fonction `range(a, b, c)`. Le troisième paramétre optionnel permet de définir le step

```python 
for i in range(0, 10, 2):
    print(i)
# prints:
# 0
# 2
# 4
# 6
# 8
```

--- 

## `while()`

```python
num = 0
while num < 3:
    num += 1
    print(num)

# prints:
# 1
# 2
# 3
# (the loop stops when num >= 3)
```

---

## `continue`

Permet de passer à l'itération suivante de la boucle 

```python
# Remember, `range` is inclusive of the start, but exclusive of the end
counter = 0
for number in range(1, 51):
    counter = counter + 1

    if counter == 7:
        counter = 0 # Reset the counter
        continue # Skip this number

    print(number)
```

---

## `break`

Permet de stopper l'itération 

```python
for n in range(42):
    print(f"{n} * {n} = {n * n}")
    if n * n > 150:
        break

# 0 * 0 = 0
# 1 * 1 = 1
# 2 * 2 = 4
# 3 * 3 = 9
# 4 * 4 = 16
# 5 * 5 = 25
# 6 * 6 = 36
# 7 * 7 = 49
# 8 * 8 = 64
# 9 * 9 = 81
# 10 * 10 = 100
# 11 * 11 = 121
# 12 * 12 = 144
# 13 * 13 = 169
```

---
