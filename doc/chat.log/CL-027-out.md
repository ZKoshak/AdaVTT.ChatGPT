Отлично. Тогда завершим организационный блок Этапа 1 документом **ADR-0009 Documentation Separation**.

После него можно будет перейти к собственно архитектурным документам.

# `1_ru/decisions/ADR-0009-documentation-separation.md`

# ADR-0009: Разделение документации проекта

Статус: Accepted

Дата: 2026-06-08

## Контекст

В рамках проекта AdaVTT предполагается существование нескольких категорий документации, ориентированных на различные аудитории.

Документация, описывающая архитектуру и разработку проекта, имеет иные цели, требования и жизненный цикл по сравнению с документацией, предназначенной для пользователей программного обеспечения.

Необходимо определить структуру хранения документации и разделение её по назначению.

## Решение

Документация проекта разделяется на две основные категории:

### 1. Документация разработки и сопровождения

Располагается в каталоге:

```text
/doc
```

Назначение:

- архитектурная документация;

- ADR;

- документация по разработке;

- документация по сопровождению;

- описание внутренних интерфейсов;

- описание процессов сборки;

- документация по поддерживаемым платформам и компиляторам;

- планы развития проекта;

- бэклог архитектурных и организационных задач.

Целевая аудитория:

- разработчики;

- сопровождающие;

- портировщики;

- авторы модулей;

- участники проекта.

### 2. Пользовательская документация

Располагается в каталоге:

```text
/src/doc
```

Назначение:

- руководство пользователя;

- руководство ведущего;

- руководство помощника ведущего;

- руководство игрока;

- руководство администратора сервера;

- документация по настройке;

- документация по расширениям;

- документация по модификациям;

- документация публичного API.

Целевая аудитория:

- пользователи;

- ведущие;

- игроки;

- администраторы серверов;

- авторы контента;

- авторы расширений.

### 3. Независимость жизненных циклов

Документация разработки и пользовательская документация могут развиваться независимо друг от друга.

Изменения архитектуры не требуют обязательного обновления пользовательской документации до тех пор, пока соответствующие возможности не становятся доступными пользователям.

### 4. Независимость структуры

Внутренняя организация каталогов `/doc` и `/src/doc` определяется отдельно и может различаться в зависимости от задач каждой категории документации.

## Последствия

Документация проекта получает чёткое разделение по назначению.

Упрощается сопровождение как архитектурной документации, так и пользовательских руководств.

Снижается риск смешивания внутренней документации разработки с документацией конечного пользователя.

---

# `2_en/decisions/ADR-0009-documentation-separation.md`

# ADR-0009: Documentation Separation

Status: Accepted

Date: 2026-06-08

## Context

The AdaVTT project is expected to contain multiple categories of documentation intended for different audiences.

Documentation describing the architecture and development of the project has different goals, requirements, and lifecycle characteristics from documentation intended for end users.

A formal separation of documentation categories is required.

## Decision

Project documentation shall be divided into two primary categories.

### 1. Development and Maintenance Documentation

Located in:

```text
/doc
```

Purpose:

- architecture documentation;

- ADRs;

- development documentation;

- maintenance documentation;

- internal interface descriptions;

- build process documentation;

- platform and compiler support documentation;

- project roadmaps;

- architectural and organizational backlogs.

Target audience:

- developers;

- maintainers;

- port authors;

- module authors;

- project contributors.

### 2. User Documentation

Located in:

```text
/src/doc
```

Purpose:

- user manuals;

- game master manuals;

- assistant game master manuals;

- player manuals;

- server administration manuals;

- configuration documentation;

- extension documentation;

- modding documentation;

- public API documentation.

Target audience:

- users;

- game masters;

- players;

- server administrators;

- content creators;

- extension authors.

### 3. Independent Lifecycles

Development documentation and user documentation may evolve independently.

Architectural changes do not require immediate updates to user documentation until the corresponding functionality becomes available to users.

### 4. Independent Structures

The internal organization of `/doc` and `/src/doc` is defined separately and may differ according to the needs of each documentation category.

## Consequences

Project documentation gains a clear separation of responsibilities and audiences.

Maintenance of architectural documentation and user-facing documentation becomes simpler and more sustainable.

The risk of mixing internal development documentation with end-user documentation is reduced.

---

## Итог текущего состояния

После принятия ADR-0009 у нас уже формируется первый завершённый блок решений:

```text
Accepted
========

ADR-0001 Project Goals

ADR-0007 Documentation Policy
ADR-0008 Project Language Policy
ADR-0009 Documentation Separation
```

и блок предварительных решений:

```text
Pending
=======

ADR-0002 Package Naming
ADR-0003 Source Layout
ADR-0004 Ada95 Core
ADR-0005 Canonical Source Tree
ADR-0006 Unified ABI
```

---

Я бы теперь перешёл к первому архитектурному документу:

```text
1_ru/architecture/vision.md
2_en/architecture/vision.md
```

Причём сделал бы его не техническим документом, а описанием философии и долгосрочного видения проекта.

После него уже логично строить:

```text
principles.md
terminology.md
roadmap.md
open_questions.md
```

которые будут постепенно подводить нас к Этапу 2:

```text
object_model.md
events.md
user_roles.md
build_profiles.md
world_model.md
```
