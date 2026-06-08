Это уже очень хороший практический результат: ты фактически проверил **3 разных реальности Ada-среды** (GNAT, GW-GNAT, и DOS-ограничения), и они уже начали расходиться — это нормальная точка, где такие проекты обычно либо разваливаются, либо получают правильную архитектуру.

Разберём твои наблюдения — они важные.

---

# 1. GW-GNAT и `.\src\` — это не баг, а симптом среды

То, что пришлось писать:

```text
.\src\
```

обычно означает:

- инструмент ожидает **DOS/Windows текущий working directory контекст**

- либо плохо обрабатывает относительные пути без явного "dot prefix"

👉 Это важный сигнал для AdaVTT:

> GW-GNAT нельзя считать "просто GNAT старой версии"

Он ближе к:

- DOS toolchain

- с ограниченной интерпретацией путей

- с частично несовместимым project model

---

# 2. DOS 8.3 имена — это не "адаптация файлов", а отдельный ABI слоя

Ты правильно сделал, что переименовал файлы, но здесь важно архитектурное следствие:

## У тебя теперь есть ДВА разных представления исходников:

### 1. Canonical (GNAT / modern)

```text
avtt_object_ids.ads
```

### 2. Legacy DOS/GW-GNAT

```text
avtt_objids.ads
```

---

# Ключевая проблема

Если продолжить масштабировать проект, возникнет риск:

> "две параллельные кодовые базы"

---

# 3. Как это правильно зафиксировать в архитектуре AdaVTT

Я бы сейчас зафиксировал очень важное решение:

## ❗ исходники НЕ дублируются

Вместо этого:

```
src/
├── core/              (canonical Ada95+)
├── compat/
│   ├── dos83/
│   └── gwgnat83/
```

---

# 4. Но для GW-GNAT тебе пришлось физически переименовывать файлы

Это нормально на текущем этапе, но лучше перейти к модели:

## вариант A (быстрый, но грязный)

- копия src → dos_src

- переименованные файлы

## вариант B (правильный)

- один src

- генерация view слоя

---

# 5. Практически лучший промежуточный подход (рекомендую)

## Добавить "build mapping layer"

```
ci/
├── gwgnat/
│   ├── build_gwgnat.bat
│   ├── map_files.bat
```

### `map_files.bat` (идея)

```bat
@ECHO OFF

REM Create DOS-compatible view of sources

IF NOT EXIST dos_src MD dos_src

COPY src\core\avtt_config.ads dos_src\avtcfg.ads
COPY src\core\avtt_types.ads dos_src\avttype.ads
COPY src\core\avtt_object_ids.ads dos_src\avtobjid.ads
COPY src\core\avtt_events.ads dos_src\avtevent.ads
```

👉 Это уже превращает проблему в **явный слой трансформации**, а не хаотичное переименование.

---

# 6. Очень важный архитектурный вывод

Ты уже столкнулся с классической проблемой VTT/engine-проектов:

## "многоплатформенность начинает ломать структуру исходников"

Поэтому фиксируем принцип:

---

## 🔷 AdaVTT Principle #1 (очень важно)

> Canonical source tree must remain independent of any compiler or filesystem constraints.

---

## 🔷 AdaVTT Principle #2

> All constraints (DOS 8.3, GW-GNAT quirks, etc.) must be expressed as build-time transformations, not source rewrites.

---

# 7. Почему это критично именно для твоего проекта

Потому что у тебя одновременно:

- Ada'95 core

- Ada'83 future target

- GNAT modern CI

- GW-GNAT DOS constraints

- future bare metal

- future MCU

👉 Если сейчас "поплывёт" структура исходников — потом восстановить её будет почти невозможно без переписывания всего проекта.

---

# 8. Что ты уже фактически доказал (и это хорошо)

Ты уже подтвердил:

- GNAT → стабилен

- GitHub Actions → работает

- GW-GNAT 3.10 → требует адаптации путей и имен

- DOS naming → неизбежен для legacy toolchains

👉 Это значит: архитектура VTT уже не теоретическая, а **реально кросс-средовая**

---

# 9. Следующий правильный шаг (я бы рекомендовал)

Сейчас логически следующий этап:

## 🔶 ввести "build abstraction layer"

То есть:

```
ci/
├── build.sh        (GNAT Linux)
├── build_gwgnat.bat
├── build_dos.bat
```

и все они используют:

```
tools/
├── build_core.sh
├── build_map.sh
```

---

# 10. Итог

Ты сейчас находишься в очень важной точке:

👉 проект перестал быть "Ada кодом"  
👉 он стал "portable engine architecture"

И главное решение уже видно:

> разделение canonical source vs compatibility build layers

---

Если хочешь дальше, следующий логичный шаг — я могу помочь тебе:

- спроектировать **mapping system (src → gwgnat/dos view) без копирования файлов**

- или сразу перейти к **AVTT_Memory (самый критичный модуль для bare metal)**

- или заложить **единый ABI событий/объектов (это сердце VTT)**
