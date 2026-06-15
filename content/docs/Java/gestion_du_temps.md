---
date: 2026-06-15T09:59:40+02:00
---
# Gestion_du_temps

## java.time 

Librairie permettant de gérer les dates.

- `java.time`: package principal 
- `java.time.format`: formatage et analyse des dates et des heures 
- `java.time.temporal`: opérations temporelles avancée 
- `java.time.zone`: travail avec des fuseaux horaires

**Immutabilité**
Toutes les classes de `java.time`sont immuables. Cela signifie qu'une fois créer, on ne peut plus venir les modifier. Toute opération retourne un nouvel objet 

```java
LocalDate today = LocalDate.now();
LocalDate tomorrow = today.plusDays(1);

System.out.println(today);    // 2025-06-05
System.out.println(tomorrow); // 2025-06-06
```

**Gestion explicite des fuseaux horaires**
Avec `java.time`, tout est explicite.

```java
import java.time.ZonedDateTime;
import java.time.ZoneId;

// si besoin d'un fuseau horaire
ZonedDateTime MinskTime = ZonedDateTime.now(ZoneId.of("Europe/Minsk"));
System.out.println(MinskTime); // 2025-06-05T14:23:45+03:00[Europe/Minsk]
```

**Calcul et comparaison**

```java
LocalDate today = LocalDate.now();
LocalDate nextMonth = today.plusMonths(1);
boolean isAfter = LocalDate.now().plusDays(1).isAfter(today); // true
```

**Formatage et analyse**

```java
import java.time.format.DateTimeFormatter;

LocalDate today = LocalDate.now();
DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd.MM.yyyy");
String formatted = today.format(formatter); // "05.08.2025"
```

### `LocalDate`: créer une date 

```java
import java.time.LocalDate;

LocalDate today = LocalDate.now();
System.out.println(today); // Par exemple, "2025-06-05"
```

---

## Compatibilité avec l'ancienne API 

On retrouve souvent du code utilisant l'ancienne façon de faire avec `Date` et `Calendar`. Il est possible de convertir les anciens types en nouveaux, et inversement.

| Ancienne classe | Nouvelle classe | Commentaire |
| --------------- | --------------- | ----------- |
| `java.util.Date` | Instant | Temps absolu |
| `java.util.Calendar` | ZonedDateTime | Date et heure avec fuseau horaire |
| `java.text.SimpleDateFormat` | DateTimeFormatter | Formattage et analyse des dates | 


```java
// conversion Date - Instant 
import java.util.Date;
import java.time.Instant;

// Date → Instant
Date legacyDate = new Date();
Instant instant = legacyDate.toInstant();

// Instant → Date
Date dateBack = Date.from(instant);

// ==== CALENDAR - ZonedDateTime
import java.util.Calendar;
import java.time.ZonedDateTime;
import java.time.ZoneId;
import java.util.Date;

// Calendar → ZonedDateTime
Calendar calendar = Calendar.getInstance();
ZonedDateTime zdt = ZonedDateTime.ofInstant(
        calendar.toInstant(),
        calendar.getTimeZone().toZoneId()
);

// ZonedDateTime → Calendar
Calendar calBack = Calendar.getInstance();
calBack.setTime(Date.from(zdt.toInstant()));
```

### Comparaison nouvelle et ancienne API 

**Ajouter une semaine à la date de naissance**

```java 
// Ancienne méthode 
import java.util.Calendar;

Calendar cal = Calendar.getInstance();
cal.set(1998, Calendar.DECEMBER, 25);
cal.add(Calendar.WEEK_OF_YEAR, 1);  
System.out.println(cal.getTime()); // Laborieux et peu évident

// Nouvelle methodes
import java.time.LocalDate;

LocalDate birthDate = LocalDate.of(1998, 12, 25);
LocalDate nextWeek = birthDate.plusWeeks(1);
System.out.println(nextWeek); // 1999-01-01
```

---

## `LocalDate`: date sans heure ou fuseau horaire 

`LocalDate` permet de gérer une date, sans heure ni fuseau horaire. 

**Date now**

```java

import java.time.LocalDate;

LocalDate today = LocalDate.now();
System.out.println(today); // Par exemple, 2025-06-01
```

**Date précise**

```java
LocalDate birthday = LocalDate.of(1990, 12, 15);
System.out.println(birthday); // 1990-12-15
```

**Analyse depuis une chaine**
La chaîne doit être au format `yyyy-MM-dd`. Si le format ne convient pas, une exception est générée

```java
LocalDate parsedDate = LocalDate.parse("2025-06-01");
System.out.println(parsedDate); // 2025-06-01
```

**Récupérer les composants d'une date**

`LocalDate` propose des méthodes qui retourne les différentes parties de la date.

```java
int year = today.getYear();           // 2025
int month = today.getMonthValue();    // 6 (juin)
int day = today.getDayOfMonth();      // 1
System.out.println(today.getMonth()); // JUNE
System.out.println(today.getDayOfWeek()); // SATURDAY
System.out.println("Année : " + year + ", mois : " + month + ", jour : " + day);
```

---

## `LocalTime`: heure sans date ni fuseau horaire 

`LocalTime` permet de représenter une heure (heure, minute, secondes) sans la date.

**Heure actuelle**
```java
import java.time.LocalTime;

LocalTime now = LocalTime.now();
System.out.println(now); // Par exemple, 14:37:12.123456789
```

**Heure précise**
```java
LocalTime lunchTime = LocalTime.of(13, 30); // 13:30:00
System.out.println(lunchTime);


// On peut ajouter les secondes et les nanosecondes
LocalTime precise = LocalTime.of(8, 15, 30, 123_000_000); // 08:15:30.123
System.out.println(precise);
```

**Analyse depuis une chaîne**

```java
LocalTime parsedTime = LocalTime.parse("14:30:00");
System.out.println(parsedTime); // 14:30
```

**Récupérer les composants de l'heure**

```java
int hour = now.getHour();
int minute = now.getMinute();
int second = now.getSecond();
System.out.println("Heures : " + hour + ", minutes : " + minute + ", secondes : " + second);
```

### Exemple: afficher une horloge 

```java
import java.time.LocalTime;

public class ClockApp {
    public static void main(String[] args) {
        LocalTime current = LocalTime.now();
        System.out.println("Maintenant : " + current);
        System.out.println("Heure : " + current.getHour());
        System.out.println("Minute : " + current.getMinute());
    }
}
```

---

## `LocalDateTime`: date et heure sans fuseau horaire 

`LocalDateTime` est un combo: date + heure mais sans fuseau horaire.

**Date et heure actuelles**
```java
import java.time.LocalDateTime;

LocalDateTime now = LocalDateTime.now();
System.out.println(now); // Par exemple, 2025-06-01T14:30:15.123456789
```

**Date et heure précises**
```java
LocalDateTime meeting = LocalDateTime.of(2025, 6, 1, 14, 30);
System.out.println(meeting); // 2025-06-01T14:30

// ajout secondes et nanoseconde 
LocalDateTime preciseMeeting = LocalDateTime.of(2025, 6, 1, 14, 30, 45, 123_000_000);
System.out.println(preciseMeeting); // 2025-06-01T14:30:45.123
```

**Analyse depuis une chaîne**

`T` sépare la date et l'heure selon la norme ISO

```java
LocalDateTime parsed = LocalDateTime.parse("2025-06-01T14:30:00");
System.out.println(parsed); // 2025-06-01T14:30
```

**Récupérer les composants**
```java
int year = now.getYear();
int month = now.getMonthValue();
int day = now.getDayOfMonth();
int hour = now.getHour();
int minute = now.getMinute();
System.out.println("Date : " + year + "-" + month + "-" + day + " Heure : " + hour + ":" + minute);
```

---

## Opération courante sur les dates et heures 

**Addition et soustration**

Les trois classes `LocalDate`, `LocalTime`, `LocalDateTime` sont immuables. Cela signfie que les méthodes retourne un nouvel objet sans modifier l'original.

```java
// LocalDate 
LocalDate today = LocalDate.now();
LocalDate tomorrow = today.plusDays(1);
LocalDate lastMonth = today.minusMonths(1);
System.out.println("Aujourd’hui : " + today);
System.out.println("Demain : " + tomorrow);
System.out.println("Il y a un mois : " + lastMonth);

// LocalTime
LocalTime now = LocalTime.now();
LocalTime inTenMinutes = now.plusMinutes(10);
System.out.println("Maintenant : " + now);
System.out.println("Dans 10 minutes : " + inTenMinutes);

// LocalDateTime
LocalDateTime start = LocalDateTime.of(2025, 6, 1, 14, 0);
LocalDateTime end = start.plusHours(2).minusMinutes(15);
System.out.println("Début : " + start);
System.out.println("Fin : " + end);
```

**Comparaison des dates et des heures**

Les trois classes possèdent les méthodes `isBefore()`, `isAfter()`, et `isEqual()`

```java
LocalDate birthday = LocalDate.of(2000, 2, 29);
LocalDate today = LocalDate.now();

if (today.isAfter(birthday)) {
    System.out.println("Vous êtes plus âgé que si vous veniez tout juste de naître !");
}

LocalTime morning = LocalTime.of(8, 0);
LocalTime now = LocalTime.now();

if (now.isBefore(morning)) {
    System.out.println("Il est encore trop tôt pour se lever...");
} else {
    System.out.println("Il est temps de se réveiller !");
}
```

**Obtenir la date/heure actuelles**

```java
LocalDate date = LocalDate.now();
LocalTime time = LocalTime.now();
LocalDateTime dateTime = LocalDateTime.now();
```

**Jour de la semaine pour n'importe quelle date**
```java
import java.time.LocalDate;

public class DayOfWeekApp {
    public static void main(String[] args) {
        LocalDate anyDate = LocalDate.of(2025, 12, 31);
        System.out.println("Le 31 décembre 2025 — c’est " + anyDate.getDayOfWeek());
    }
}
```

**Combien de jours avant une date**
```java
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;

public class DaysToNewYear {
    public static void main(String[] args) {
        LocalDate today = LocalDate.now();
        LocalDate newYear = LocalDate.of(today.getYear() + 1, 1, 1);
        long daysLeft = ChronoUnit.DAYS.between(today, newYear);
        System.out.println("Il reste " + daysLeft + " jours avant le Nouvel An !");
    }
}
```

**Vérifier si année est biissextile**

```java
import java.time.LocalDate;

public class LeapYearCheck {
    public static void main(String[] args) {
        LocalDate date = LocalDate.of(2025, 1, 1);
        if (date.isLeapYear()) {
            System.out.println(date.getYear() + " — année bissextile !");
        } else {
            System.out.println(date.getYear() + " — année ordinaire.");
        }
    }
}
```

**Différence entre deux heures**
```java
import java.time.LocalTime;
import java.time.Duration;

public class TimeDifference {
    public static void main(String[] args) {
        LocalTime start = LocalTime.of(9, 0);
        LocalTime end = LocalTime.of(17, 30);
        Duration duration = Duration.between(start, end);
        System.out.println("La journée de travail dure " + duration.toHours() + " heures " +
                (duration.toMinutes() % 60) + " minutes.");
    }
}
```

---

## `ZonedDateTime`: date et heure avec fuseau horaire 

La classe `ZoneId` est utilisé pour gérer les fuseaux horaires.

`ZonedDateTime` est une classe qui stocke la date, l'heure, et les informations de fuseau horaire. 

### Date et heure actuelles dans le fuseau horaire du système
```java
import java.time.ZonedDateTime;

ZonedDateTime now = ZonedDateTime.now();
System.out.println(now); // Par exemple: 2025-06-01T15:30:00+03:00[Europe/Minsk]
```

### Heure dans un fuseau horaire spécifique
```java
import java.time.ZoneId;

ZonedDateTime MinskTime = ZonedDateTime.now(ZoneId.of("Europe/Minsk"));
ZonedDateTime newYorkTime = ZonedDateTime.now(ZoneId.of("America/New_York"));

System.out.println("Minsk : " + MinskTime);
System.out.println("New York : " + newYorkTime);
```

### Création à partir de `LocalDateTime`
```java
import java.time.LocalDateTime;

LocalDateTime meeting = LocalDateTime.of(2025, 6, 1, 18, 0);
ZonedDateTime meetingInMinsk = meeting.atZone(ZoneId.of("Europe/Minsk"));
System.out.println(meetingInMinsk); // 2025-06-01T18:00+03:00[Europe/Minsk]
```

### Récupération et définition du fuseau horaire**
```java
ZoneId tokyoZone = ZoneId.of("Asia/Tokyo");
ZonedDateTime tokyoTime = ZonedDateTime.now(tokyoZone);
System.out.println("Tokyo : " + tokyoTime);
```

---

### `withZoneSameInstant()`

Il arrive que l'on doive savoir à quoi reseemble le même event dans une autre zone.

```java
ZonedDateTime MinskMeeting = ZonedDateTime.of(2025, 6, 1, 18, 0, 0, 0, ZoneId.of("Europe/Minsk"));
ZonedDateTime newYorkMeeting = MinskMeeting.withZoneSameInstant(ZoneId.of("America/New_York"));

System.out.println("Heure de la réunion à Minsk : " + MinskMeeting);
System.out.println("Le même événement à New York : " + newYorkMeeting);
```

`withZoneSameInstant()` convertit l'heure de façon à ce qu'elle corresponde au même moment dans l'autre zone. Si on utilise `wityZoneSameLocal()`, la date et l'heure locale restent les meme mais la zone change, c'est presque toujours une erreur 

---

## ` Instant`: point absolu dans le temps 

`Instant` est une classe qui représente un moment absolu indépendament du fuseau horaire. Il se base sur le 1 janvier 1970 -> timestamp.

```java
import java.time.Instant;

Instant now = Instant.now();
System.out.println(now); // Par exemple: 2025-06-01T12:30:00.123Z
```

`Z` indique le temps UTC

**Création à partir des seconde depuis l'époque Unix**

```java
Instant fromEpoch = Instant.ofEpochSecond(1685616000L);
System.out.println(fromEpoch); // 2023-06-01T00:00:00Z
```

### `ZonedDateTime` -> `Instant` 

```java
ZonedDateTime zoned = ZonedDateTime.now();
Instant instant = zoned.toInstant();
System.out.println(instant);
```

### `Instant` -> `ZonedDateTime` 

```java
ZoneId zone = ZoneId.of("Europe/Minsk");
ZonedDateTime fromInstant = Instant.now().atZone(zone);
System.out.println(fromInstant);
```

### `Instant` -> LocalDateTime` 

```java
import java.time.LocalDateTime;
import java.time.Instant;
import java.time.ZoneId;

LocalDateTime local = LocalDateTime.ofInstant(Instant.now(), ZoneId.of("Europe/Minsk"));
System.out.println(local);
```
---

## Bonne pratique 

Pour la plupart des logique métier, il faut conserver la date, l'heure, mais également le fuseau horaire pour être sur de gérer correctement les heures.

L'utilisation de `ZonedDateTime` permet également de se proteger contre les bugs lié au passage à l'heure d'hiver et d'été

---

## `DateTimeFormatter`: Formatage et analyse des dates 

`DateTimeFormatter` est un traducteur entre les objets temporels. Il permet de transformer des objets date/heure en string dans le format voulu, et transformer des string en objet date/heure.

Java fournit un ensemble de formatters standard qui couvre les format ISO les plus populaire.

```java
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

public class FormatterDemo {
    public static void main(String[] args) {
        LocalDate date = LocalDate.now();
        // Formater une date en chaîne
        String text = date.format(DateTimeFormatter.ISO_LOCAL_DATE);
        System.out.println(text); // Par exemple, 2025-06-01

        // Analyser la chaîne pour retrouver la date
        LocalDate parsed = LocalDate.parse("2025-06-01", DateTimeFormatter.ISO_LOCAL_DATE);
        System.out.println(parsed); // 2025-06-01
    }
}
```

### `DateTimeFormatter.ofPattern(String pattern)`: modèles personnalisés

Permet de créer des modeles personalisé pour l'affichage de date.

```java
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class CustomFormatDemo {
    public static void main(String[] args) {
        LocalDateTime dt = LocalDateTime.of(2025, 6, 1, 14, 30);
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd.MM.yyyy HH:mm"); // définition du formatage       
        String text = dt.format(formatter);
        System.out.println(text); // 01.06.2025 14:30
    }
}
```