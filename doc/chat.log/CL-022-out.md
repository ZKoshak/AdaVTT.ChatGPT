Да, такой подход мне нравится больше. Особенно потому, что он отделяет:

- **принятые решения** (`Accepted`);

- **предварительные решения** (`Pending`);

- **открытые вопросы** (`Open`).

Для AdaVTT это сейчас гораздо полезнее, чем искусственно откладывать ADR до полной уверенности. На практике ADR как раз и нужен для фиксации текущего состояния обсуждения.

Несколько уточнений по твоим замечаниям.

### 1. Нумерация ADR

Я бы принял именно предложенную тобой последовательность:

```text
ADR-0001-project-goals.md
ADR-0002-package-naming.md
ADR-0003-source-layout.md
ADR-0004-ada95-core.md
ADR-0005-canonical-source-tree.md
ADR-0006-unified-abi.md
ADR-0007-documentation-policy.md
ADR-0008-project-language-policy.md
ADR-0009-documentation-separation.md
```

Статусы:

```text
ADR-0001  Accepted

ADR-0002  Pending
ADR-0003  Pending
ADR-0004  Pending
ADR-0005  Pending
ADR-0006  Pending

ADR-0007  Accepted
ADR-0008  Accepted
ADR-0009  Accepted
```

То есть даже спорные вопросы уже получают идентификаторы и историю обсуждения.

---

### 2. Структура языков

Я согласен с твоей логикой о первичности русского языка.

Тогда я бы делал так:

```text
doc/
│
├── 1_ru/
│   ├── architecture/
│   ├── development/
│   ├── decisions/
│   └── backlog/
│
├── 2_en/
│   ├── architecture/
│   ├── development/
│   ├── decisions/
│   └── backlog/
│
├── de/
├── fr/
└── ...
```

Преимущества:

- русский всегда первый;

- английский всегда второй;

- остальные языки могут появляться независимо;

- порядок не зависит от локали файловой системы.

Мне этот вариант кажется разумным именно для проекта, где русский является каноническим языком документации.

---

### 3. User Roles и Role Model

Да, я фактически имел в виду одно и то же.

Я бы назвал документ:

```text
user_roles.md
```

а внутри уже описывал:

```text
Role Model
```

Потому что:

```text
role_model.md
```

для нового участника проекта менее очевиден.

---

### 4. Build Profiles

Полностью согласен.

Я бы даже перенёс его во второй документный эшелон, а не откладывал.

```text
architecture/
├── build_profiles.md
```

поскольку он напрямую связан с:

```text
Full
Server
Client
```

которые уже обсуждены.

---

### 5. World Model

Согласен ещё сильнее.

На самом деле для VTT это один из фундаментальных документов.

Если не определить мир заранее, потом начнут появляться:

```text
2D Token
3D Token
Server Token
Client Token
```

и архитектура быстро расползётся.

Поэтому:

```text
world_model.md
```

я бы включил уже в первоначальный набор.

---

### 6. Development Documentation

Даже если пока будут заготовки.

Например:

```text
development/
├── coding_style.md
├── compiler_support.md
├── package_naming.md
├── source_tree.md
├── workflows.md
├── compatibility.md
└── build_system.md
```

Сейчас они могут содержать буквально:

```markdown
Status: Draft
```

и перечень вопросов.

Но структура уже появится.

---

### 7. Backlog

Считаю очень хорошей идеей.

Причём я бы сделал его отдельной частью документации, а не GitHub Issues.

Например:

```text
backlog/
├── architecture.md
├── compiler_support.md
├── networking.md
├── rendering.md
├── tooling.md
└── documentation.md
```

Почему?

Потому что многие задачи AdaVTT будут жить годами.

Например:

```text
Support Meridian Ada for Windows
```

Это скорее архитектурная цель проекта, чем issue.

---

### 8. Этапы проектирования

После уточнений я бы видел дорожную карту так.

#### Этап 1

```text
ADR-0001 ... ADR-0009

vision.md
principles.md
terminology.md
roadmap.md
open_questions.md
backlog/*
```

---

#### Этап 2

```text
object_model.md
events.md
user_roles.md
build_profiles.md
world_model.md
```

---

#### Этап 3

```text
memory.md
networking.md
rendering.md
```

---

#### Контрольная точка

После Этапа 1 или Этапа 2:

```text
Review:
- Ada standards strategy
- Compiler support strategy
- Mapping system strategy
```

Именно здесь будет логично вернуться к вопросам:

- Ada'83;

- Ada'95;

- Ada 2005+;

- GNAT;

- GW-GNAT;

- Janus Ada;

- Artek Ada;

- Meridian Ada.

Причём уже не в виде отдельных обсуждений, а через ревизию:

```text
ADR-0002
ADR-0003
ADR-0004
ADR-0005
```

что позволит перевести часть из них из `Pending` в `Accepted` или, наоборот, пересмотреть. Это выглядит достаточно устойчивым процессом для проекта масштаба AdaVTT.
