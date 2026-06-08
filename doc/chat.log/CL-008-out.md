Это действительно стоит решить сейчас, потому что потом переименование сотен пакетов будет болезненным.

Если одним из требований остаются:

- Ada'95;

- GW-GNAT 3.07–3.10;

- Janus Ada;

- Artek Ada;

- Meridian Ada;

- DOS и старые файловые системы;

то я бы ориентировался не на современные GNAT-практики, а на наиболее консервативный вариант.

## Проблема длинных имён

Например:

```ada
package AdaVTT_Object_IDs is
```

соответствующий файл:

```text
adavtt_object_ids.ads
```

На современном GNAT проблем нет.

Но исторически встречались ограничения:

- длины имени файла;

- длины имени библиотечной единицы;

- чувствительности к регистру;

- поддержки символа `_`.

Особенно у старых DOS-компиляторов.

---

## Вариант 1. Полные имена

```ada
AdaVTT_Config
AdaVTT_Types
AdaVTT_Object_IDs
AdaVTT_Events
AdaVTT_Memory
```

Плюсы:

- максимально читаемо;

- сразу понятно назначение.

Минусы:

- длинные файлы;

- длинные имена библиотечных единиц.

---

## Вариант 2. Префикс AVTT

```ada
AVTT_Config
AVTT_Types
AVTT_Object_IDs
AVTT_Events
AVTT_Memory
```

Файлы:

```text
avtt_config.ads
avtt_types.ads
avtt_object_ids.ads
```

Это уже заметно лучше.

---

## Вариант 3. Старошкольный стиль

Например:

```ada
AVTT_CFG
AVTT_TYPES
AVTT_OBJIDS
AVTT_EVENTS
AVTT_MEMORY
```

Файлы:

```text
avtt_cfg.ads
avtt_types.ads
avtt_objids.ads
```

Максимальная совместимость.

Но через несколько лет код становится менее понятным.

---

## Что делают крупные долгоживущие проекты

Например:

- GCC

- LLVM

- FreeBSD

- RTEMS

- Emacs

обычно выбирают компромисс:

- короткий уникальный префикс;

- полные названия подсистем.

То есть что-то вроде:

```ada
AVTT_Config
AVTT_Types
AVTT_Object_IDs
AVTT_Events
AVTT_Memory
AVTT_Renderer
AVTT_Network
AVTT_Storage
```

Мне этот вариант кажется оптимальным.

---

## Каталоги

Я бы также избегал чрезмерной вложенности.

Вместо:

```text
src/core/types/
src/core/memory/
src/core/events/
```

лучше:

```text
src/core/
```

и внутри:

```text
avtt_config.ads
avtt_types.ads
avtt_object_ids.ads
avtt_events.ads
avtt_memory.ads
```

Потому что Ada сама по себе уже хорошо структурирует код через пакеты.

---

## Предлагаемое соглашение

### Пакеты

```ada
AVTT_Config
AVTT_Types
AVTT_Object_IDs
AVTT_Events
AVTT_Memory
AVTT_Containers
AVTT_Streams

AVTT_HAL
AVTT_Renderer
AVTT_UI

AVTT_Dice
AVTT_Rules
AVTT_Network
AVTT_Storage
```

---

### Файлы

```text
avtt_config.ads
avtt_types.ads
avtt_object_ids.ads
avtt_events.ads
avtt_memory.ads
```

---

### Каталоги

```text
src/
│
├── api/
├── core/
├── runtime/
├── platform/
├── hal/
├── rendering/
├── network/
├── storage/
├── ui/
├── dice/
└── rules/
```

---

### Проектный файл

```text
adavtt.gpr
```

---

### Исполняемый файл

В будущем:

```text
adavtt
```

или

```text
adavtt.exe
```

---

Лично я бы выбрал именно префикс **AVTT_**, а не **VTT_** и не **AdaVTT_**. Он достаточно короткий для старых инструментов, но остаётся уникальным и легко узнаваемым во всём коде проекта. Это хороший компромисс между совместимостью и читаемостью.
