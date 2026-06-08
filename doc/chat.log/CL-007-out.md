Отлично, тогда сразу стоит использовать имя проекта **AdaVTT**, пока архитектура ещё не устоялась.

По поводу `VTT_Config` — я бы не помещал его ни в `runtime/`, ни в `platform/`, поскольку это не реализация конкретного стандарта или компилятора, а часть публичного ядра проекта.

Для вашей структуры я бы предложил:

```text
AdaVTT/
│
├── src/
│   ├── api/
│   ├── core/
│   │   ├── vtt_config.ads
│   │   ├── vtt_types.ads
│   │   ├── vtt_object_ids.ads
│   │   └── vtt_events.ads
│   │
│   ├── runtime/
│   │   ├── ada83/
│   │   ├── ada95/
│   │   ├── ada2005/
│   │   ├── ada2012/
│   │   └── ada2022/
│   │
│   ├── platform/
│   ├── hal/
│   ├── rendering/
│   ├── network/
│   ├── storage/
│   ├── ui/
│   ├── dice/
│   └── rules/
│
├── obj/
├── doc/
├── adavtt.gpr
└── README.md
```

То есть:

```text
src/core/vtt_config.ads
```

---

Я бы даже разделил конфигурацию на два уровня.

### 1. Статическая информация о проекте

`src/core/vtt_config.ads`

```ada
package VTT_Config is

   Version_Major : constant := 0;
   Version_Minor : constant := 1;
   Version_Patch : constant := 0;

   Project_Name : constant String := "AdaVTT";

end VTT_Config;
```

Она одинаковая для всех платформ.

---

### 2. Конфигурация сборки

Например:

```text
src/runtime/ada95/vtt_build_config.ads
src/runtime/ada2022/vtt_build_config.ads

src/platform/gwgnat/vtt_build_config.ads
src/platform/gnat/vtt_build_config.ads
```

где уже задаются особенности реализации:

```ada
package VTT_Build_Config is

   Supports_Streams : constant Boolean := True;
   Supports_Tasking : constant Boolean := False;

end VTT_Build_Config;
```

---

Я бы ещё сейчас определился с префиксом пакетов.

Есть три варианта:

### Вариант 1

```ada
package VTT_Config is
```

Коротко и удобно.

---

### Вариант 2

```ada
package AdaVTT_Config is
```

Уникально.

---

### Вариант 3

```ada
package AVTT_Config is
```

Самый компактный.

---

Для такого проекта я бы выбрал **AdaVTT_***:

```ada
AdaVTT_Config
AdaVTT_Types
AdaVTT_Object_IDs
AdaVTT_Events
AdaVTT_Memory
AdaVTT_Renderer
```

Поскольку через несколько лет в системе могут появиться сторонние библиотеки:

```ada
RPG_*
TT_*
Map_*
Net_*
```

и уникальный префикс поможет избежать конфликтов имён, особенно на старых файловых системах и компиляторах.

Также стоит помнить про ограничение длины имён файлов у некоторых старых Ada-компиляторов и DOS-платформ. Поэтому полезно заранее решить, будем ли мы ориентироваться на длинные имена:

```text
adavtt_object_ids.ads
```

или введём сокращения:

```text
avtt_objids.ads
```

Если среди целей действительно есть GW-GNAT под DOS и исторические компиляторы вроде Meridian Ada, вопрос схемы имён лучше решить до написания большого количества кода. Я бы на следующем этапе как раз сформировал соглашение по именованию пакетов и файлов для всего AdaVTT.
