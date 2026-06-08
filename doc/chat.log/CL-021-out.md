Согласен с обоими уточнениями.

1. **Русский должен быть основным языком проекта**, а английский — обязательным сопровождающим. Это касается:
   
   - документации;
   
   - ADR;
   
   - комментариев в архитектурных документах;
   
   - публичного API (по возможности).

2. Всё, что касается:
   
   - поддержки Ada'83/Ada'95/Ada 2005+/Ada 2022;
   
   - GW-GNAT;
   
   - Janus Ada;
   
   - Artek Ada;
   
   - Meridian Ada;
   
   - схемы отображения имён файлов;

  сейчас должно иметь статус **предварительных решений**, а не принятых архитектурных решений.

Поэтому я бы предложил сначала оформить не ADR, а более высокий уровень документации:

```text
doc/
├── architecture/
│   ├── vision.md
│   ├── principles.md
│   ├── terminology.md
│   ├── roadmap.md
│   └── open_questions.md
│
├── decisions/
│   ├── ADR-0001-documentation-policy.md
│   ├── ADR-0002-project-language-policy.md
│   └── ADR-0003-documentation-separation.md
```

То есть сначала фиксируем только то, что действительно уже решено.

---

Я бы начал с трёх первых ADR.

### ADR-0001 — Documentation Policy

Статус:

```text
Accepted
```

Потому что решение уже принято.

Содержание:

- документация обязательна до реализации;

- архитектурные решения документируются отдельно;

- документация является частью проекта.

---

### ADR-0002 — Project Language Policy

Статус:

```text
Accepted
```

Содержание:

- русский язык основной;

- английский язык обязательный дополнительный;

- структура должна позволять добавление других языков.

Например, в перспективе:

```text
doc/
├── ru/
├── en/
├── de/
├── fr/
└── ...
```

или

```text
doc/
├── architecture/
│   ├── ru/
│   └── en/
```

Какой вариант лучше — ещё можно обсудить.

---

### ADR-0003 — Documentation Separation

Статус:

```text
Accepted
```

Содержание:

```text
/doc
```

для разработки.

```text
/src/doc
```

для пользователей.

---

После этого я бы создал не ADR, а документ:

### `doc/architecture/open_questions.md`

Туда как раз поместить всё, что пока не решено.

Например:

```text
Compiler Support Model
Status: Open

Questions:

- Ada'95 as minimum standard?
- Ada'83 compatibility layer?
- Separate implementations per standard?
- Shared core?
- Compiler-specific adaptations?
```

---

То же самое:

```text
File Naming Strategy
Status: Open

Questions:

- Canonical long names?
- DOS 8.3 mapping?
- Automatic mapping generation?
- Source duplication avoidance?
```

---

И:

```text
Build System Strategy
Status: Open
```

---

Это позволит нам через несколько этапов вернуться к этим вопросам и оформить их уже как:

```text
ADR-00XX
Status: Accepted
```

а не переписывать существующие документы.

---

Что касается структуры двуязычной документации, я бы сразу закладывал именно языковые каталоги верхнего уровня.

Например:

```text
doc/
│
├── ru/
│   ├── architecture/
│   ├── development/
│   └── decisions/
│
└── en/
    ├── architecture/
    ├── development/
    └── decisions/
```

Причины:

- проще подключать новые языки;

- проще искать непереведённые документы;

- проще автоматизировать проверку полноты переводов;

- русский и английский становятся равноправными наборами документов, хотя русский является первичным источником.

---

Я бы предложил следующий порядок формирования первоначального комплекта документации:

### Этап 1 (можно считать обязательным)

```text
ADR-0001 Documentation Policy
ADR-0002 Project Language Policy
ADR-0003 Documentation Separation

Vision
Principles
Terminology
Roadmap
Open Questions
```

---

### Этап 2

```text
Object Model
Event Model
Session Model
Role Model
Deployment Profiles
```

---

### Этап 3

```text
Memory Architecture
Networking Architecture
Rendering Architecture
```

---

И только после завершения Этапа 1 я бы действительно сделал обещанный «шаг назад» и вернулся к обсуждению поддержки стандартов Ada и компиляторов уже на основании зафиксированной документации, а не отдельных сообщений в чате. Это позволит оформить все спорные вопросы как архитектурные решения с понятным контекстом, альтернативами и последствиями.
