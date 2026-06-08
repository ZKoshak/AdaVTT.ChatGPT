Это очень важное уточнение, и я бы зафиксировал его прямо сейчас, пока структура документации ещё не начала разрастаться.

На самом деле у AdaVTT получается **две совершенно разные категории документации**, которые обычно живут разными жизненными циклами:

### Документация проекта (для разработчиков)

Используется:

- разработчиками ядра;

- сопровождающими;

- портировщиками на новые платформы;

- авторами сборок;

- авторами модулей и расширений.

Например:

```text
AdaVTT/
│
├── doc/
│   ├── architecture/
│   ├── development/
│   ├── decisions/
│   ├── compiler_support/
│   └── ...
```

Здесь находятся:

- архитектура;

- ADR;

- описание ABI;

- описание внутренних подсистем;

- соглашения по кодированию;

- поддержка компиляторов;

- описание процесса сборки.

---

### Документация продукта (для пользователей)

Используется:

- ведущими;

- игроками;

- администраторами серверов;

- авторами модулей;

- авторами игровых систем.

Например:

```text
src/
│
├── doc/
│   ├── user/
│   ├── gm/
│   ├── player/
│   ├── server/
│   ├── scripting/
│   ├── modding/
│   └── api/
```

Здесь находятся:

- руководство пользователя;

- руководство ведущего;

- руководство администратора;

- документация по настройке сервера;

- документация по плагинам;

- документация по API.

---

Я бы даже уточнил принцип.

### Development Documentation

```text
/doc
```

описывает:

> Как устроен AdaVTT.

---

### Product Documentation

```text
/src/doc
```

описывает:

> Как использовать AdaVTT.

---

Это разделение особенно полезно для долгоживущих проектов, потому что:

```text
архитектура памяти
```

и

```text
как создать персонажа
```

имеют совершенно разных читателей.

---

Более того, с учётом будущих вариантов сборки я бы уже сейчас предположил такую структуру:

```text
src/
│
├── doc/
│   ├── user/
│   ├── gm/
│   ├── player/
│   ├── assistant_gm/
│   ├── server/
│   ├── api/
│   ├── scripting/
│   └── modding/
```

Потому что ранее мы уже зафиксировали роли:

```text
Dedicated Server
Game Master
Assistant Game Master
Player
Observer
```

и часть документации будет зависеть именно от роли пользователя.

---

Я бы добавил ещё одну архитектурную заметку в будущий ADR:

# ADR-0007 Documentation Separation

Status: Accepted

## Context

AdaVTT contains both development-facing and user-facing documentation.

These documentation sets have different audiences, maintenance requirements, and release cycles.

## Decision

The project shall maintain two independent documentation trees.

### Project Documentation

Location:

```
/doc
```

Purpose:

- Architecture

- Design decisions

- Development guidelines

- Compiler support

- Build procedures

- Internal interfaces

Audience:

- Core developers

- Maintainers

- Port authors

- Contributors

### Product Documentation

Location:

```
/src/doc
```

Purpose:

- User manuals

- Game Master manuals

- Player manuals

- Server administration

- Scripting

- Modding

- Public APIs

Audience:

- End users

- Server operators

- Content creators

- Module authors

## Consequences

Project architecture documentation and end-user documentation evolve independently and may be released on different schedules.

С учётом уже принятых решений я бы теперь скорректировал ранее предложенную структуру и считал канонической именно такую:

```text
AdaVTT/
│
├── src/
│   ├── core/
│   ├── runtime/
│   ├── platform/
│   ├── ...
│   └── doc/
│
├── doc/
│   ├── architecture/
│   ├── development/
│   ├── decisions/
│   └── compiler_support/
│
├── ci/
├── obj/
├── adavtt.gpr
└── README.md
```

Тогда перед проектированием `AVTT_Memory` следующим разумным шагом будет сформировать содержимое `doc/architecture/` (Vision, Principles, Terminology, Object Model, Event Model), а уже потом переходить к памяти. Это позволит использовать документацию как источник архитектурных решений, а не пытаться извлекать архитектуру из кода постфактум.
