Отлично. Тогда следующим логичным шагом действительно будет оформление **ADR-0007 Documentation Policy**, поскольку после его принятия все остальные документы уже будут подчиняться единым правилам.

# `1_ru/decisions/ADR-0007-documentation-policy.md`

# ADR-0007: Политика документации

Статус: Accepted

Дата: 2026-06-08

## Контекст

AdaVTT является долгосрочным проектом с высокими требованиями к переносимости, сопровождаемости и архитектурной устойчивости.

Для подобных проектов отсутствие своевременной документации приводит к потере архитектурных решений, дублированию работы и усложнению сопровождения.

Необходимо определить роль документации в жизненном цикле проекта.

## Решение

Документация является неотъемлемой частью проекта AdaVTT.

Разработка документации рассматривается как часть процесса разработки программного обеспечения, а не как отдельная деятельность, выполняемая после написания кода.

### 1. Документация предшествует реализации

Для крупных подсистем перед началом реализации должны быть подготовлены соответствующие архитектурные документы.

Допускается уточнение документации в процессе разработки.

### 2. Архитектурные решения документируются

Существенные архитектурные решения должны оформляться в виде Architecture Decision Records (ADR).

### 3. Документация хранится вместе с исходным кодом

Документация является частью репозитория проекта и подлежит контролю версий наравне с исходным кодом.

### 4. Документация развивается совместно с кодом

Изменения архитектуры и интерфейсов должны сопровождаться обновлением соответствующей документации.

### 5. Документация имеет приоритет над неформальными обсуждениями

При возникновении расхождений между содержимым документации и сообщениями в переписке, обсуждениях или задачах приоритет имеет актуальная версия документации.

### 6. Документация является обязательной для сопровождения

Новые подсистемы, публичные интерфейсы и значимые изменения архитектуры должны сопровождаться документацией.

## Последствия

Документация становится частью процесса разработки и сопровождения проекта.

Архитектурные решения получают долгосрочную фиксацию независимо от смены участников проекта.

---

# `2_en/decisions/ADR-0007-documentation-policy.md`

# ADR-0007: Documentation Policy

Status: Accepted

Date: 2026-06-08

## Context

AdaVTT is intended to be a long-term project with strong requirements for portability, maintainability, and architectural stability.

For projects of this nature, the absence of timely documentation often leads to loss of architectural knowledge, duplicated effort, and increased maintenance costs.

A formal documentation policy is therefore required.

## Decision

Documentation is considered an integral part of the AdaVTT project.

Documentation development is treated as part of the software development process rather than an activity performed after implementation.

### 1. Documentation Precedes Implementation

For major subsystems, appropriate architectural documentation should be prepared before implementation begins.

Documentation may be refined during development.

### 2. Architectural Decisions Shall Be Documented

Significant architectural decisions shall be recorded using Architecture Decision Records (ADR).

### 3. Documentation Shall Be Stored with Source Code

Documentation is part of the project repository and shall be version-controlled alongside source code.

### 4. Documentation Evolves Together with the Codebase

Changes to architecture and interfaces shall be accompanied by corresponding documentation updates.

### 5. Documentation Takes Precedence over Informal Discussions

In case of discrepancies between documentation and discussions, messages, or issue trackers, the current version of the documentation shall be considered authoritative.

### 6. Documentation Is Required for Maintenance

New subsystems, public interfaces, and significant architectural changes shall be accompanied by documentation.

## Consequences

Documentation becomes part of the development and maintenance process.

Architectural knowledge is preserved independently of individual contributors and project participants.

---

Теперь можно переходить к **ADR-0008 Project Language Policy**.

Этот документ для AdaVTT будет необычно важным, потому что он определяет не просто язык документации, а фактически язык управления знаниями проекта.

Я бы в нём зафиксировал:

- русский язык как канонический;

- английский как обязательный официальный перевод;

- структуру `1_ru` и `2_en`;

- правила синхронизации переводов;

- правила появления третьих языков;

- приоритет русской версии при расхождениях переводов.

После принятия ADR-0008 можно будет уже начинать формировать `vision.md`, `principles.md` и остальные архитектурные документы первого этапа.
