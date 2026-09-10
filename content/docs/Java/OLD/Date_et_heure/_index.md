# Heure et Date 

## `ZonedDateTime` - date et heure avec fuseau horaire 

`ZonedDateTime` est une classe qui stocke la date, l'heure et les information de fuseau horaire.

Pour les besoins métiers de stokage de Date, on utilise cette classe soit un `Instant`, soit un `ZonedDateTime` lorsqu'un évènement est lié à une zone précise.

Cela permet également de gérer les changement d'heure.

### Syntaxe 

```java
// date et heure actuelle dans le fuseau horaire du système 
import java.time.ZonedDateTime;

ZonedDateTime now = ZonedDateTime.now();
System.out.println(now); // Par exemple: 2025-06-01T15:30:00+03:00[Europe/Minsk]

// heure dans un fuseau horaire spécifique 
import java.time.ZoneId;

ZonedDateTime MinskTime = ZonedDateTime.now(ZoneId.of("Europe/Minsk"));
ZonedDateTime newYorkTime = ZonedDateTime.now(ZoneId.of("America/New_York"));

// création de LocalDateTime 
import java.time.LocalDateTime;

LocalDateTime meeting = LocalDateTime.of(2025, 6, 1, 18, 0);
ZonedDateTime meetingInMinsk = meeting.atZone(ZoneId.of("Europe/Minsk"));
System.out.println(meetingInMinsk); // 2025-06-01T18:00+03:00[Europe/Minsk]

// Récupération et définition du fuseau horaire 
ZoneId tokyoZone = ZoneId.of("Asia/Tokyo");
ZonedDateTime tokyoTime = ZonedDateTime.now(tokyoZone);
System.out.println("Tokyo : " + tokyoTime);
```

---

## `withZoneSameInstant()` - conversion entre zone 

Cette méthode permet de convertir un instant donné d'un fuseau horaire dans une fuseau horaire différent tout en conserveant l'heure réel.

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

---

## `Instant`

`Instant` est une classe qui repésente un moment absolu, indépendamment du fuseau horaire. Il correspond au nombre de secondes et de nanosecondes depuis le 1er Janvier 1970.

`Z` indique Zulu time, c'est à dire `UTC`

```java
// Création 
import java.time.Instant;

Instant now = Instant.now();
System.out.println(now); // Par exemple: 2025-06-01T12:30:00.123Z

// Création à partir des secondes depuis l'époque Unix 
Instant fromEpoch = Instant.ofEpochSecond(1685616000L);
System.out.println(fromEpoch); // 2023-06-01T00:00:00Z
```

---

## Conversion 

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

### `Instant` -> `LocalDateTime` 

```java
import java.time.LocalDateTime;
import java.time.Instant;
import java.time.ZoneId;

LocalDateTime local = LocalDateTime.ofInstant(Instant.now(), ZoneId.of("Europe/Minsk"));
System.out.println(local);
```