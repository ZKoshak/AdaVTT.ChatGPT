Согласен. Для AdaVTT лучше сразу выработать жёсткое правило:

> Ни один документ в `1_ru/` не считается завершённым, пока не создан соответствующий документ в `2_en/`.

При этом русскоязычная версия является канонической, а англоязычная — официальным переводом. Это нужно будет потом зафиксировать в ADR-0008.

Тогда для Этапа 1 предлагаю идти парами документов:

```text
1_ru/decisions/ADR-0001-project-goals.md
2_en/decisions/ADR-0001-project-goals.md
```

---

# Русская версия

# ADR-0001: Цели проекта AdaVTT

Статус: Accepted

Дата: 2026-06-08

## Контекст

AdaVTT создаётся как свободная модульная платформа класса Virtual Tabletop (VTT) для настольных ролевых игр.

Проект ориентирован на длительный жизненный цикл, высокую переносимость и независимость от конкретных операционных систем, аппаратных платформ, графических библиотек и компиляторов.

На раннем этапе разработки необходимо зафиксировать основные цели проекта, которые будут использоваться как критерии принятия архитектурных решений.

## Решение

Проект AdaVTT должен развиваться в соответствии со следующими целями.

### 1. Переносимость

Система должна проектироваться с учётом возможности работы на различных программных и аппаратных платформах.

Предпочтение отдаётся платформенно-независимым решениям.

### 2. Независимость от операционных систем

Ядро системы не должно зависеть от конкретной операционной системы.

Допускается использование адаптационных слоёв для отдельных платформ.

### 3. Независимость от аппаратного обеспечения

Архитектура должна допускать работу как на современных персональных компьютерах и серверах, так и на системах с ограниченными ресурсами, включая встроенные системы и bare-metal окружения.

### 4. Модульность

Все основные подсистемы должны проектироваться как независимые модули с минимальным количеством жёстких связей.

### 5. Поддержка различных режимов эксплуатации

Архитектура должна учитывать возможность работы в следующих режимах:

- выделенный сервер;

- ведущий игры;

- помощник ведущего;

- игрок;

- наблюдатель.

Конкретные механизмы реализации ролей определяются отдельными архитектурными документами.

### 6. Поддержка различных профилей сборки

Архитектура должна позволять создание различных вариантов поставки программного обеспечения, включая:

- полную версию;

- серверную версию;

- клиентскую версию.

### 7. Независимость модели мира от визуализации

Игровой мир должен существовать независимо от способа его отображения.

Поддержка различных способов визуализации не должна влиять на модель данных мира.

### 8. Долговременная сопровождаемость

При выборе между краткосрочным удобством и долгосрочной сопровождаемостью предпочтение отдаётся сопровождаемости.

### 9. Документирование архитектурных решений

Существенные архитектурные решения должны фиксироваться в ADR.

## Последствия

Настоящий документ является основой для принятия дальнейших архитектурных решений.

Все последующие ADR должны рассматриваться в контексте целей, зафиксированных в данном документе.

---

# English version

# ADR-0001: AdaVTT Project Goals

Status: Accepted

Date: 2026-06-08

## Context

AdaVTT is being developed as a free and modular Virtual Tabletop (VTT) platform for tabletop role-playing games.

The project is intended for a long lifecycle and emphasizes portability, maintainability, and independence from specific operating systems, hardware platforms, graphics libraries, and compiler implementations.

At this stage of development, the primary project goals must be formally defined to guide future architectural decisions.

## Decision

AdaVTT shall be developed according to the following goals.

### 1. Portability

The system shall be designed to operate across a wide range of software and hardware platforms.

Platform-independent solutions are preferred whenever practical.

### 2. Operating System Independence

The core of the system shall not depend on any specific operating system.

Platform-specific adaptation layers may be used where necessary.

### 3. Hardware Independence

The architecture shall support execution on modern desktop and server systems as well as on resource-constrained environments, including embedded and bare-metal systems.

### 4. Modularity

Major subsystems shall be designed as independent modules with minimal coupling.

### 5. Support for Multiple Operating Modes

The architecture shall support operation in the following modes:

- dedicated server;

- game master;

- assistant game master;

- player;

- observer.

The exact implementation of these roles shall be defined by separate architectural documents.

### 6. Support for Multiple Build Profiles

The architecture shall support multiple distribution profiles, including:

- full edition;

- server edition;

- client edition.

### 7. Rendering-Independent World Model

The game world shall exist independently of any rendering implementation.

Support for multiple rendering modes shall not affect the underlying world data model.

### 8. Long-Term Maintainability

When choosing between short-term convenience and long-term maintainability, maintainability shall take precedence.

### 9. Documentation of Architectural Decisions

Significant architectural decisions shall be documented through ADRs.

## Consequences

This document serves as a foundation for future architectural decisions.

All subsequent ADRs shall be evaluated in the context of the goals defined herein.

---

Я бы предложил следующим документом оформить **ADR-0007 Documentation Policy**, поскольку он определит правила написания всей остальной документации, которую мы сейчас начинаем создавать. После этого логично перейти к **ADR-0008 Project Language Policy**, где уже формально закрепить:

- русский как канонический язык документации;

- английский как обязательный официальный перевод;

- порядок каталогов `1_ru` и `2_en`;

- правила добавления новых языков в будущем.
