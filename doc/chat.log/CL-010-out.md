Отлично. Тогда я бы зафиксировал следующие соглашения для AdaVTT.

# 1. Имена пакетов

Все публичные библиотечные единицы получают префикс `AVTT_`.

Примеры:

```ada
AVTT_Config
AVTT_Types
AVTT_Object_IDs
AVTT_Events
AVTT_Memory

AVTT_HAL
AVTT_Renderer
AVTT_UI

AVTT_Dice
AVTT_Rules
AVTT_Network
AVTT_Storage
```

Это достаточно коротко и при этом практически исключает конфликты имён.

---

# 2. Имена файлов

Имя файла соответствует имени библиотечной единицы.

```text
AVTT_Config      -> avtt_config.ads
AVTT_Types       -> avtt_types.ads
AVTT_Object_IDs  -> avtt_object_ids.ads
AVTT_Events      -> avtt_events.ads
```

Для тела пакета:

```text
avtt_config.adb
avtt_types.adb
...
```

Никаких сокращений вроде:

```text
avtt_cfg.ads
avtt_objids.ads
avtt_mem.ads
```

в основном дереве проекта.

---

# 3. Child packages

Для совместимости со старыми компиляторами в ядре проекта не используем.

То есть:

❌

```ada
package AVTT.Core.Memory is
```

✔

```ada
package AVTT_Memory is
```

Если когда-нибудь понадобится версия для современных компиляторов с child packages, её можно реализовать в отдельном слое совместимости.

---

# 4. Имена каталогов

Нижний регистр:

```text
src/
core/
runtime/
platform/
hal/
rendering/
network/
storage/
ui/
dice/
rules/
```

Это хорошо работает и под Unix-подобными системами, и под Windows.

---

# 5. Стандарт ядра

Минимальная цель:

```text
Ada 95
```

То есть всё содержимое:

```text
src/core/
src/api/
```

должно собираться компилятором уровня Ada'95.

Более новые возможности помещаются в:

```text
src/runtime/ada2005/
src/runtime/ada2012/
src/runtime/ada2022/
```

---

# 6. Зависимости

На раннем этапе:

```text
AVTT_Config
    ↓
AVTT_Types
    ↓
AVTT_Object_IDs
    ↓
AVTT_Events
```

Без циклических зависимостей.

---

# 7. Первый набор файлов

Я бы создал:

```text
src/core/
│
├── avtt_config.ads
├── avtt_types.ads
├── avtt_object_ids.ads
└── avtt_events.ads
```

и пока не писал ни строчки платформенного кода.

---

# 8. Project file

Корневой файл:

```text
adavtt.gpr
```

Название проекта:

```ada
project AdaVTT is
```

Даже если некоторые старые компиляторы не используют GPR-файлы, это не мешает современным инструментам.

---

На этом этапе уже можно считать, что у AdaVTT появился первый архитектурный документ: соглашения по именованию, структуре каталогов и минимальному стандарту языка. Это обычно то, что в долгоживущих проектах стоит определить до написания существенного объёма кода. Следующим логичным шагом будет проектирование `AVTT_Types` и `AVTT_Memory`, поскольку именно они зададут фундамент для всех остальных подсистем.
