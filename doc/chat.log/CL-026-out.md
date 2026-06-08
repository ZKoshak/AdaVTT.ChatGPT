Тогда следующим документом оформим языковую политику. На мой взгляд, это один из ключевых ADR для AdaVTT, потому что он будет влиять не только на документацию, но и в будущем на:

- комментарии в коде;

- тексты интерфейсов;

- сообщения об ошибках;

- документацию модулей и API;

- организацию переводов.

# `1_ru/decisions/ADR-0008-project-language-policy.md`

# ADR-0008: Языковая политика проекта

Статус: Accepted

Дата: 2026-06-08

## Контекст

Проект AdaVTT ориентирован на долгосрочную разработку с возможным участием разработчиков и пользователей из различных стран.

Необходимо определить официальный язык разработки, порядок ведения документации и правила добавления переводов.

## Решение

### 1. Основным языком проекта является русский язык

Русский язык является каноническим языком проекта.

Первичная разработка документации ведётся на русском языке.

Архитектурные решения принимаются и фиксируются первоначально на русском языке.

### 2. Английский язык является обязательным дополнительным языком

Для каждого документа, входящего в состав официальной документации проекта, должна существовать англоязычная версия.

Англоязычная версия рассматривается как официальный перевод русскоязычного оригинала.

### 3. Структура документации

Документация организуется следующим образом:

```text
doc/
├── 1_ru/
└── 2_en/
```

Каталог `1_ru` содержит каноническую версию документации.

Каталог `2_en` содержит официальный англоязычный перевод.

### 4. Приоритет версий

В случае обнаружения расхождений между русскоязычной и англоязычной версиями документа приоритет имеет содержимое русскоязычной версии.

Обнаруженные расхождения должны устраняться путём актуализации перевода.

### 5. Дополнительные языки

Проект допускает появление дополнительных языковых версий документации.

Дополнительные языки не являются обязательными.

Для них допускается частичный перевод документации.

Пример:

```text
doc/
├── 1_ru/
├── 2_en/
├── de/
├── fr/
└── ...
```

### 6. Требования к переводу

Перевод должен стремиться к максимально точной передаче смысла исходного документа.

Приоритет отдаётся точности терминологии и архитектурных формулировок над литературным стилем.

## Последствия

Русский язык становится основным языком управления знаниями проекта.

Англоязычная документация обеспечивает доступность проекта для международного сообщества.

Структура документации позволяет в дальнейшем добавлять новые языки без изменения существующей организации проекта.

---

# `2_en/decisions/ADR-0008-project-language-policy.md`

# ADR-0008: Project Language Policy

Status: Accepted

Date: 2026-06-08

## Context

AdaVTT is intended as a long-term project that may involve contributors and users from multiple countries and language backgrounds.

A formal policy is required to define the primary project language, documentation practices, and translation procedures.

## Decision

### 1. Russian Is the Primary Project Language

Russian is the canonical language of the project.

Primary documentation shall be written in Russian.

Architectural decisions shall be initially discussed and recorded in Russian.

### 2. English Is the Mandatory Secondary Language

Every document that is part of the official project documentation shall have an English version.

The English version is considered an official translation of the Russian original.

### 3. Documentation Structure

Documentation shall be organized as follows:

```text
doc/
├── 1_ru/
└── 2_en/
```

The `1_ru` directory contains the canonical documentation.

The `2_en` directory contains the official English translation.

### 4. Version Priority

In the event of discrepancies between Russian and English versions of a document, the Russian version shall take precedence.

Discrepancies should be resolved by updating the translation.

### 5. Additional Languages

The project may support additional documentation languages.

Additional languages are optional.

Partial translations are permitted.

Example:

```text
doc/
├── 1_ru/
├── 2_en/
├── de/
├── fr/
└── ...
```

### 6. Translation Requirements

Translations should aim for maximum fidelity to the source document.

Terminological and architectural accuracy shall take precedence over stylistic considerations.

## Consequences

Russian becomes the primary language for project knowledge management.

English documentation provides accessibility for the international community.

The documentation structure allows additional languages to be introduced without altering the existing organization.

---

Следующим логичным шагом будет **ADR-0009 Documentation Separation**. После него у нас будут закрыты все три уже окончательно принятые организационные решения:

```text
ADR-0007 Documentation Policy
ADR-0008 Project Language Policy
ADR-0009 Documentation Separation
```

После этого можно будет перейти от организационных ADR к архитектурным документам:

```text
vision.md
principles.md
terminology.md
roadmap.md
open_questions.md
```

и начать формировать собственно архитектурную базу проекта.
