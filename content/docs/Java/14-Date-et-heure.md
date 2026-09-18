# `java.time`

## `LocalDate` - date sans heure ni fuseau horaire 

Permet de créer une date.

### Création 

```java 
// =========================
// date actuel 
// =========================
import java.time.LocalDate;

LocalDate today = LocalDate.now();
System.out.println(today); // Par exemple, 2025-06-01

// ============================
// date précise 
// ============================
LocalDate birthday = LocalDate.of(1990, 12, 15);
System.out.println(birthday); // 1990-12-15
```

### Analyse depuis une chaîne 

La chaîne doit être au format `yyyy-MM-dd`. Si le format ne correspond pas, une exception est levée 

```java 
LocalDate parsedDate = LocalDate.parse("2025-06-01");
System.out.println(parsedDate); // 2025-06-01
```

### Récupérer les composants d'une date 

`LocalDate` fournit des méthode qui retournent les différentes parties de la date 

```java 
int year = today.getYear();           // 2025
int month = today.getMonthValue();    // 6 (juin)
int day = today.getDayOfMonth();      // 1
System.out.println("Année : " + year + ", mois : " + month + ", jour : " + day);

// ===============================
// obtenir le mois en toute lettre 
// ===============================
System.out.println(today.getMonth()); // JUNE

// ===================================
// obtenir le jour de la semaine 
// ===================================
System.out.println(today.getDayOfWeek()); // SATURDAY
```

---

## `LocalTime` - heure sans date ni fuseau horaire 

`LocalTime` permet d'obtenir une heure.

### Création 

#### Heure actuelle 

```java 
import java.time.LocalTime;

LocalTime now = LocalTime.now();
System.out.println(now); // Par exemple, 14:37:12.123456789
```

#### Heure precise 

```java 
LocalTime lunchTime = LocalTime.of(13, 30); // 13:30:00
System.out.println(lunchTime);

// =========================
// ajout des secondes et nanosecondes 
// ==========================
LocalTime precise = LocalTime.of(8, 15, 30, 123_000_000); // 08:15:30.123
System.out.println(precise);
```

### Analyse depuis une chaîne 

```java 
LocalTime parsedTime = LocalTime.parse("14:30:00");
System.out.println(parsedTime); // 14:30
```

### Récupérer des composants de l'heure 

```java 
int hour = now.getHour();
int minute = now.getMinute();
int second = now.getSecond();
System.out.println("Heures : " + hour + ", minutes : " + minute + ", secondes : " + second);
```

### Création d'une horloge 

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

## `LocalDateTime` - date et heure sans fuseau horaire

### Création 

#### Date et heure actuelles 

```java 
import java.time.LocalDateTime;

LocalDateTime now = LocalDateTime.now();
System.out.println(now); // Par exemple, 2025-06-01T14:30:15.123456789
```

#### Date et heure précise 

```java 
LocalDateTime meeting = LocalDateTime.of(2025, 6, 1, 14, 30);
System.out.println(meeting); // 2025-06-01T14:30

// ====================================
// ajout des seconde et nanoseconde 
// ====================================
LocalDateTime preciseMeeting = LocalDateTime.of(2025, 6, 1, 14, 30, 45, 123_000_000);
System.out.println(preciseMeeting); // 2025-06-01T14:30:45.123
```

### Analyse depuis une chaîne 

La lettre `T` sépare la date et l'heure selon la norme ISO

```java 
LocalDateTime parsed = LocalDateTime.parse("2025-06-01T14:30:00");
System.out.println(parsed); // 2025-06-01T14:30
```

### Récupération des composants 

```java 
int year = now.getYear();
int month = now.getMonthValue();
int day = now.getDayOfMonth();
int hour = now.getHour();
int minute = now.getMinute();
System.out.println("Date : " + year + "-" + month + "-" + day + " Heure : " + hour + ":" + minute);
```

---

## Opérations courantes sur les dates et heures 

### Addition et soustraction - `plusDay()` - `plusMonth()`

Les trois classes fournissent des méthodes qui retourne un nouvel objet sans modifier l'original.

#### `LocalDate`

```java 
LocalDate today = LocalDate.now();
LocalDate tomorrow = today.plusDays(1);
LocalDate lastMonth = today.minusMonths(1);
System.out.println("Aujourd’hui : " + today);
System.out.println("Demain : " + tomorrow);
System.out.println("Il y a un mois : " + lastMonth);
```

#### `LocalTime`

```java 
LocalTime now = LocalTime.now();
LocalTime inTenMinutes = now.plusMinutes(10);
System.out.println("Maintenant : " + now);
System.out.println("Dans 10 minutes : " + inTenMinutes);
```

#### `LocalDateTime`

```java 
LocalDateTime start = LocalDateTime.of(2025, 6, 1, 14, 0);
LocalDateTime end = start.plusHours(2).minusMinutes(15);
System.out.println("Début : " + start);
System.out.println("Fin : " + end);
```

### Comparaison des dates et heures - `isBefore()`, `isAfter()`, `isEqual()`

Les trois classess fournissent des méthodes `isBefore()`, `isAfter()` et `isEqual()`

```java 
// =============================
// isAfter()
// =============================
LocalDate birthday = LocalDate.of(2000, 2, 29);
LocalDate today = LocalDate.now();

if (today.isAfter(birthday)) {
    System.out.println("Vous êtes plus âgé que si vous veniez tout juste de naître !");
}

// ===============================
// isBefore()
// ===============================
LocalTime morning = LocalTime.of(8, 0);
LocalTime now = LocalTime.now();

if (now.isBefore(morning)) {
    System.out.println("Il est encore trop tôt pour se lever...");
} else {
    System.out.println("Il est temps de se réveiller !");
}
```

### `now()` - obtenir la date/heure actuel 

```java 
LocalDate date = LocalDate.now();
LocalTime time = LocalTime.now();
LocalDateTime dateTime = LocalDateTime.now();
```

---

## Pattern 

### Jour de la semaine depuis n'importe quel date 

```java 
import java.time.LocalDate;

public class DayOfWeekApp {
    public static void main(String[] args) {
        LocalDate anyDate = LocalDate.of(2025, 12, 31);
        System.out.println("Le 31 décembre 2025 — c’est " + anyDate.getDayOfWeek());
    }
}
```

### Combien de jour avant le nouvel An 

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

### Vérifier si années bissextile 

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

### Différence entre deux heures 

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

## Fuseau horaire 

Le fuseau horaire est la règle qui détermine combien de temps ajouter ou soustraite à l'heure UTC pour obtenir l'heure locale d'une région donnée.

La classe `ZoneId` est utilisé pour gérer les fuseaux horaires.

---

## `ZonedDateTime` - date et heure avec fuseau horaire 

`ZonedDateTime` est une classe qui stocke la date, l'heure et les information de fuseau horaire.

### Création 

#### Date et heure actuelles dans le fuseau horaire du systeme 

```java 
import java.time.ZonedDateTime;

ZonedDateTime now = ZonedDateTime.now();
System.out.println(now); // Par exemple: 2025-06-01T15:30:00+03:00[Europe/Minsk]
```

#### Heure dans un fuseau horaire spécifique 

```java 
import java.time.ZoneId;

ZonedDateTime MinskTime = ZonedDateTime.now(ZoneId.of("Europe/Minsk"));
ZonedDateTime newYorkTime = ZonedDateTime.now(ZoneId.of("America/New_York"));

System.out.println("Minsk : " + MinskTime);
System.out.println("New York : " + newYorkTime);
```

#### Création à partir de `LocalDateTime`

```java
import java.time.LocalDateTime;

LocalDateTime meeting = LocalDateTime.of(2025, 6, 1, 18, 0);
ZonedDateTime meetingInMinsk = meeting.atZone(ZoneId.of("Europe/Minsk"));
System.out.println(meetingInMinsk); // 2025-06-01T18:00+03:00[Europe/Minsk]
```

#### Récupération et définition du fuseau horaire 

```java 
ZoneId tokyoZone = ZoneId.of("Asia/Tokyo");
ZonedDateTime tokyoTime = ZonedDateTime.now(tokyoZone);
System.out.println("Tokyo : " + tokyoTime);
```

### `withZoneSameInstant()` - conversion entre zone 

`withZoneSameInstant()` convertit l'heure de façon à ce qu'elle correspond au même moment dans l'autre zone. Si on utilise la méthode, la date et l'heure locale restent les même mais la zone change.

```java 
ZonedDateTime MinskMeeting = ZonedDateTime.of(2025, 6, 1, 18, 0, 0, 0, ZoneId.of("Europe/Minsk"));
ZonedDateTime newYorkMeeting = MinskMeeting.withZoneSameInstant(ZoneId.of("America/New_York"));

System.out.println("Heure de la réunion à Minsk : " + MinskMeeting);
System.out.println("Le même événement à New York : " + newYorkMeeting);
```

---

## `Instant` - un point absolu dans le temps 

`Instant` permet de représenter un moment absolu, indépendamment du fuseau horaire. 

### Création 

`Z` signifie Zulu time, c'est à dire `UTC`.

```java 
import java.time.Instant;

Instant now = Instant.now();
System.out.println(now); // Par exemple: 2025-06-01T12:30:00.123Z
```

#### Création à partir des secondes depuis l'époque Unix 

```java 
Instant fromEpoch = Instant.ofEpochSecond(1685616000L);
System.out.println(fromEpoch); // 2023-06-01T00:00:00Z
```

### Conversion 

#### `ZonedDateTime` -> `Instant`

```java
ZonedDateTime zoned = ZonedDateTime.now();
Instant instant = zoned.toInstant();
System.out.println(instant);
```

#### `Instant` -> `ZonedDateTime`

```java
ZoneId zone = ZoneId.of("Europe/Minsk");
ZonedDateTime fromInstant = Instant.now().atZone(zone);
System.out.println(fromInstant);
```

#### `Instant` -> `LocalDateTime`

```java
import java.time.LocalDateTime;
import java.time.Instant;
import java.time.ZoneId;

LocalDateTime local = LocalDateTime.ofInstant(Instant.now(), ZoneId.of("Europe/Minsk"));
System.out.println(local);
```

---

## Pratique 

### Obtenir l'heure actuelle dans différents fuseaux 

```java 
import java.time.ZonedDateTime;
import java.time.ZoneId;

public class TimeZonesDemo {
    public static void main(String[] args) {
        ZonedDateTime Minsk = ZonedDateTime.now(ZoneId.of("Europe/Minsk"));
        ZonedDateTime newYork = ZonedDateTime.now(ZoneId.of("America/New_York"));
        ZonedDateTime tokyo = ZonedDateTime.now(ZoneId.of("Asia/Tokyo"));

        System.out.println("Minsk :    " + Minsk);
        System.out.println("New York :  " + newYork);
        System.out.println("Tokyo :     " + tokyo);
    }
}
```

### conversion de l'heure entre les zones 

```java 
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.ZonedDateTime;

public class MeetingTime {
    public static void main(String[] args) {
        LocalDateTime eventTime = LocalDateTime.of(2025, 6, 1, 18, 0);
        ZonedDateTime minskEvent = eventTime.atZone(ZoneId.of("Europe/Minsk"));

        ZonedDateTime newYorkEvent = minskEvent.withZoneSameInstant(ZoneId.of("America/New_York"));
        ZonedDateTime tokyoEvent = minskEvent.withZoneSameInstant(ZoneId.of("Asia/Tokyo"));

        System.out.println("Réunion à Minsk :   " + minskEvent);
        System.out.println("À New York :        " + newYorkEvent);
        System.out.println("À Tokyo :            " + tokyoEvent);
    }
}
```

### Conversion `LocalDateTime` en `ZonedDateTime` et inversement 

```java 
// =========================
// Local -> Zoned 
// =========================
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.ZonedDateTime;

LocalDateTime localTime = LocalDateTime.of(2025, 6, 1, 14, 0);
ZonedDateTime zonedTime = localTime.atZone(ZoneId.of("Europe/Minsk"));
System.out.println(zonedTime);

// ==============================
// Zoned -> Local 
// ==============================
LocalDateTime extracted = zonedTime.toLocalDateTime();
System.out.println(extracted);
```

--- 

## Formatage et analyse des dates: `DateTimeFormatter`

La classe permet de convertir des objets date et heure dans un format voulut, ou transformer des chaîne en objet date/heure 

### Formatter standard 

| Formatter | Exemple de chaîne | Description | 
| --------- | ----------------- | ----------- |
| `DateTimeFormatter.ISO_LOCAL_DATE` | 2025-06-01 | Date uniquement | 
| `DateTimeFormatter.ISO_LOCAL_TIME` | 14:30:00 | Heure uniquement |
| `DateTimeFormatter.ISO_LOCAL_DATE_TIME` | 2025-06-01T14:30:00 | Date et heure sans fuseau horaire |
| `DateTimeFormatter.ISO_ZONED_DATE_TIME` | 2025-06-01T14:30:00+03:00[Europe/Minsk] | Date, heure et fuseau |

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

### Modèle personnalisée - `DateTimeFormatter.ofPattern`

Le modèle utilise des lettres spéciales : 
- `yyyy` - année 
- `MM` - mois 
- `dd` - jour 
- `HH` - heure 
- `mm` - minute 
- `ss` - seconde 

| Modèle | Résultat |
| ------ | -------- | 
| dd.MM.yyyy | 01.06.2025 |
| yyyy/MM/dd | 2025/06/01 |
| dd.MM.yyyy HH:mm | 01.06.2025 14:30 |
| yyyy-MM-dd HH:mm:ss | 2025-06-01 14:30:00 | 
| d MMMM yyyy | 1 juin 2025 |

#### Formatage date et heure 

```java 
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class CustomFormatDemo {
    public static void main(String[] args) {
        LocalDateTime dt = LocalDateTime.of(2025, 6, 1, 14, 30);
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd.MM.yyyy HH:mm");
        String text = dt.format(formatter);
        System.out.println(text); // 01.06.2025 14:30
    }
}
```

#### Analyser une chaîne en date 

```java 
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class ParseDemo {
    public static void main(String[] args) {
        String input = "01.06.2025 14:30";
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd.MM.yyyy HH:mm");
        LocalDateTime dt = LocalDateTime.parse(input, formatter);
        System.out.println(dt); // 2025-06-01T14:30
    }
}
```

### Formatage - transformer une date/heure en chaine 

1. Création de l'objet `LocalDate`, `LocalDateTime`, `ZonedDateTime`
2. Créer ou choisir le formatter 
3. Appeler sur l'objet la méthode `format(DateTimeFormatter)`

#### Afficher une date dans differents format 

```java 
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

public class MultiFormatDemo {
    public static void main(String[] args) {
        LocalDate date = LocalDate.of(2025, 6, 1);

        // ISO standard
        System.out.println(date.format(DateTimeFormatter.ISO_LOCAL_DATE)); // 2025-06-01

        // Format personnalisé
        DateTimeFormatter rusFormat = DateTimeFormatter.ofPattern("dd.MM.yyyy");
        System.out.println(date.format(rusFormat)); // 01.06.2025

        // Style anglais
        DateTimeFormatter usFormat = DateTimeFormatter.ofPattern("MM/dd/yyyy");
        System.out.println(date.format(usFormat)); // 06/01/2025
    }
}
```

#### Formatage de l'heure 

```java 
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;

public class TimeFormatDemo {
    public static void main(String[] args) {
        LocalTime time = LocalTime.of(14, 30, 5);
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HH:mm:ss");
        System.out.println(time.format(formatter)); // 14:30:05
    }
}
```

### Transformer une chaine en date/heure 

1. Obtenir une chaine 
2. Créer un formatter avec la même modele que la chaine 
3. Appeler la méthode `parse()`

#### Analyser une date 

```java 
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

public class ParseDateDemo {
    public static void main(String[] args) {
        String input = "01.06.2025";
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd.MM.yyyy");
        LocalDate date = LocalDate.parse(input, formatter);
        System.out.println(date); // 2025-06-01
    }
}
```

#### Analyser une date et une heure 

```java 
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class ParseDateTimeDemo {
    public static void main(String[] args) {
        String input = "01.06.2025 14:30";
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd.MM.yyyy HH:mm");
        LocalDateTime dateTime = LocalDateTime.parse(input, formatter);
        System.out.println(dateTime); // 2025-06-01T14:30
    }
}
```

### Gestion d'erreur d'analyse 

```java 
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;

public class ParseErrorDemo {
    public static void main(String[] args) {
        String input = "32.13.2025"; // Date incorrecte
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd.MM.yyyy");
        try {
            LocalDate date = LocalDate.parse(input, formatter);
            System.out.println(date);
        } catch (DateTimeParseException ex) {
            System.out.println("Erreur d’analyse : " + ex.getMessage());
        }
    }
}
```

### Conversion dates pour utilisateur 

```java
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.util.Scanner;

public class BirthdayFormatDemo {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.print("Saisissez votre date de naissance (jj.MM.aaaa) : ");
        String input = scanner.nextLine();

        DateTimeFormatter inputFormat = DateTimeFormatter.ofPattern("dd.MM.yyyy");
        DateTimeFormatter outputFormat = DateTimeFormatter.ofPattern("yyyy/MM/dd");

        try {
            LocalDate birthday = LocalDate.parse(input, inputFormat);
            String formatted = birthday.format(outputFormat);
            System.out.println("Votre date dans le nouveau format : " + formatted);
            System.out.println("Jour de la semaine : " + birthday.getDayOfWeek()); // Par exemple, SATURDAY
        } catch (DateTimeParseException ex) {
            System.out.println("Erreur : format de date incorrect !");
        }
    }
}
```

### Localisation 

Avec `DateTimeFormatter` il est possible d'afficher le mois en toute lettre, le jour de la semaine, etc La locale est pris en compte 

#### Afficher le mois en Russe 

```java 
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Locale;

public class LocaleDemo {
    public static void main(String[] args) {
        LocalDate date = LocalDate.of(2025, 6, 1);
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("d MMMM yyyy", new Locale("ru"));
        System.out.println(date.format(formatter)); // 1 iyunya 2025
    }
}
```

#### Local Anglaise 

```java 
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Locale;

public class LocaleEnDemo {
    public static void main(String[] args) {
        LocalDate date = LocalDate.of(2025, 6, 1);
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("d MMMM yyyy", Locale.ENGLISH);
        System.out.println(date.format(formatter)); // 1 June 2025
    }
}
```

---

## Calcul et comparaison de date 

### Addition et soustraction de dates et heures 

```java 
import java.time.LocalDate;

LocalDate today = LocalDate.now(); // Date d’aujourd’hui
LocalDate tomorrow = today.plusDays(1); // Demain
LocalDate nextMonth = today.plusMonths(1); // Dans un mois
LocalDate lastWeek = today.minusWeeks(1); // Il y a une semaine

System.out.println("Aujourd’hui: " + today);
System.out.println("Demain: " + tomorrow);
System.out.println("Dans un mois: " + nextMonth);
System.out.println("Il y a une semaine: " + lastWeek);

// ========================
// methodes chaines
// ========================
LocalDate vacation = today.plusMonths(2).plusDays(10);
System.out.println("Vacances: " + vacation);
```

### Différence entre dates 

- `Period`: travail avec des dates (combien de jours, annee, mois entre deux dates)
- `Duration`: travailler avec le temps (combien minute, heure, seconde entre deux event)

#### Age user 

```java 
import java.time.LocalDate;
import java.time.Period;

LocalDate birthday = LocalDate.of(2000, 1, 15); // Date de naissance
LocalDate today = LocalDate.now();

Period age = Period.between(birthday, today);

System.out.println("Âge: " + age.getYears() + " ans, " +
                   age.getMonths() + " mois, " +
                   age.getDays() + " jours");
```

#### Combien de temps avant date limite 

```java 
import java.time.LocalDate;

LocalDate deadline = LocalDate.of(2025, 7, 1);
LocalDate today = LocalDate.now();

if (today.isBefore(deadline)) {
    Period left = Period.between(today, deadline);
    System.out.println("Il reste avant la date limite: " +
        left.getMonths() + " mois et " +
        left.getDays() + " jours");
} else {
    System.out.println("La date limite est déjà passée !");
}
```

#### Différence dans le temps 

```java 
import java.time.LocalDateTime;
import java.time.Duration;

LocalDateTime start = LocalDateTime.of(2025, 6, 1, 10, 0, 0);
LocalDateTime end = LocalDateTime.of(2025, 6, 1, 15, 30, 0);

Duration duration = Duration.between(start, end);

System.out.println("Durée: " + duration.toHours() + " heures " +
                   (duration.toMinutes() % 60) + " minutes");
```

### Comparer des dates et heures 

```java 
// ======================
// isBefore 
// ========================
import java.time.LocalDate;

LocalDate today = LocalDate.now();
LocalDate deadline = LocalDate.of(2025, 7, 1);

if (today.isBefore(deadline)) {
    System.out.println("Il reste encore du temps !");
} else if (today.isEqual(deadline)) {
    System.out.println("C’est la date limite aujourd’hui !");
} else {
    System.out.println("La date limite est déjà passée :(");
}

// ===========================
// isAfter
// ===========================
import java.time.LocalTime;

LocalTime now = LocalTime.now();
LocalTime lunch = LocalTime.of(13, 0);

if (now.isAfter(lunch)) {
    System.out.println("Le déjeuner est déjà passé !");
} else {
    System.out.println("Il reste encore du temps avant le déjeuner.");
}
```
