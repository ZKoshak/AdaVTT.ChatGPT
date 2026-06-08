Полностью согласен.

На текущем этапе у AdaVTT ещё слишком мало кода, чтобы заниматься низкоуровневой разработкой, но уже достаточно архитектурных решений, чтобы начать формировать документацию проекта.

Более того, для проекта с такими требованиями:

- поддержка нескольких стандартов Ada;

- поддержка исторических компиляторов;

- возможность работы без ОС;

- несколько режимов исполнения;

- 2D и 3D представления;

- клиент-серверная архитектура;

- единый ABI;

отсутствие архитектурной документации через год станет гораздо большей проблемой, чем отсутствие нескольких тысяч строк кода.

Я бы предложил создать не один документ, а набор документов.

---

## Предлагаемая структура документации

```text
doc/
│
├── README.md
│
├── architecture/
│   ├── vision.md
│   ├── principles.md
│   ├── terminology.md
│   ├── build_profiles.md
│   ├── user_roles.md
│   ├── world_model.md
│   ├── networking.md
│   ├── rendering.md
│   ├── memory.md
│   ├── events.md
│   └── object_model.md
│
├── development/
│   ├── coding_style.md
│   ├── package_naming.md
│   ├── compatibility.md
│   ├── compiler_support.md
│   ├── source_tree.md
│   └── workflows.md
│
└── decisions/
    ├── ADR-0001-project-goals.md
    ├── ADR-0002-package-naming.md
    ├── ADR-0003-compiler-compatibility.md
    └── ...
```

---

Самым важным я считаю введение **ADR** (Architecture Decision Records).

Это очень хорошо подходит для AdaVTT.

Каждое значимое решение фиксируется отдельным файлом.

Например:

```text
ADR-0001-project-goals.md
ADR-0002-package-naming.md
ADR-0003-source-layout.md
ADR-0004-ada95-core.md
ADR-0005-canonical-source-tree.md
ADR-0006-unified-abi.md
```

---

Первым документом я бы сделал "Vision".

# AdaVTT Vision

## Purpose

AdaVTT is a portable Virtual Tabletop (VTT) platform for tabletop role-playing games.

The project aims to provide a highly modular implementation written in Ada that can operate on a wide range of environments, from modern desktop operating systems to bare-metal systems and embedded hardware.

## Design Goals

- Portability.

- Long-term maintainability.

- Modularity.

- Compiler independence.

- Operating system independence.

- Hardware independence.

- Support for multiple deployment profiles.

- Support for multiple rendering modes.

- Stable internal interfaces and data formats.

## Non-Goals

The project is not tied to any specific RPG ruleset.

The project is not tied to any specific graphics API, operating system, network protocol, or hardware platform.

The project is not designed around any single compiler implementation.

## Target Platforms

- Linux

- Windows

- BSD systems

- DOS

- Bare-metal systems

- Embedded microcontrollers

## Target Language Standards

- Ada 95 (minimum core target)

- Ada 2005

- Ada 2012

- Ada 2022

Future support for Ada 83 compatibility layers may be provided where practical.

## Core Principle

The canonical source tree shall remain independent of compiler, operating system, filesystem, and hardware constraints.

---

Вторым документом я бы оформил уже принятые принципы.

# AdaVTT Architectural Principles

## AP-001 Canonical Source Tree

The canonical source tree is the single source of truth.

Compatibility requirements shall be implemented through build-time transformations and compatibility layers.

## AP-002 Unified ABI

Objects, events, commands, and network messages shall be designed around a unified binary representation.

## AP-003 Rendering Independence

The game world shall not depend on any rendering implementation.

2D and 3D renderers operate on the same world model.

## AP-004 Network Transparency

Networked execution shall use the same command and event model as local execution.

## AP-005 Role-Based Sessions

Roles are properties of sessions, not executables.

## AP-006 Modular Deployment

Full, Server, and Client builds shall share a common core implementation.

## AP-007 Memory Independence

The memory subsystem shall not depend on object types stored within it.

## AP-008 Server Rendering Separation

Server-side code shall not require rendering subsystems.

---

Третьим документом я бы сделал словарь терминов.

Это особенно важно для VTT.

Например:

- Session

- Campaign

- Scene

- Map

- Layer

- Token

- Asset

- Command

- Event

- Object

- Role

- Player

- Game Master

- Assistant Game Master

Пока эти термины не определены, легко начать использовать их в разных смыслах.

---

После этого я бы не переходил сразу к `AVTT_Memory`, а подготовил ещё два архитектурных документа:

1. `events.md`

2. `object_model.md`

Потому что память будет хранить именно объекты и события. Если сначала определить модель памяти, а потом модель объектов, велик риск, что память придётся перепроектировать.

Поэтому мой рекомендуемый порядок сейчас такой:

```text
Vision
↓
Architectural Principles
↓
Terminology
↓
Object Model
↓
Event Model
↓
Memory Architecture
↓
AVTT_Memory implementation
```

Это позволит строить AdaVTT на уже зафиксированном архитектурном фундаменте, а не принимать ключевые решения по мере появления кода.
