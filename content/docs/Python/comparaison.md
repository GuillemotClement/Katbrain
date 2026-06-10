---
date: 2026-06-09T20:52:12+02:00
---
# Comparaison

```python 
5 < 6 # evaluates to True
5 > 6 # evaluates to False
5 >= 6 # evaluates to False
5 <= 6 # evaluates to True
5 == 6 # evaluates to False
5 != 6 # evaluates to True
```

---

## Opérateur logique 

- `and` : ET
- `or` : OU 
- `not`: inversion 


```python
True and True == True
True and False == False
False and False == False

True or True == True
True or False == True
False or False == False

# ======================
print(True and True) # True 

print(True or False) # True

print((True or False) and False) # False

print(True and False) # False 

# ===== NOT ==============
print(not True)
# Prints: False

print(not False)
# Prints: True
```

---

## Bitwise 

### `&` - and 

Permet d'utiliser des condition avec des nombres binaires. On compare deux deux binaire, et compare chaque bits.

Si les deux bits sont `1`, alors le résultat sera `1`.

Cette fonctionnalités est généralement utilisé pour gérer des permissions par exemple.

```python 
0101
&
0111
=
0101

# =================
0b0101 & 0b0111
# equals 5

binary_five = 0b0101
binary_seven = 0b0111
binary_five & binary_seven
# equals 5
```

### `|` - or

Permet de faire un `OR` avec deux nombres binaires. Si l'un des bits est a 1, alors le resultat sera 1.

```python
0101
|
0111
=
0111
```



## If/else

```python
if score > high_score:
    print("High score beat!")
elif score > second_highest_score:
    print("You got second place!")
elif score > third_highest_score:
    print("You got third place!")
else:
    print("Better luck next time")
```

---

