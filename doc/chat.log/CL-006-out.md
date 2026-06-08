Тогда предлагаю начать именно с **нулевой версии каркаса**, не привязанной пока ни к графике, ни к сети, ни даже к конкретному стандарту выше Ada'95.

# Структура проекта

```text
VTT/
│
├── src/
│   ├── api/
│   ├── core/
│   ├── runtime/
│   │   ├── ada83/
│   │   ├── ada95/
│   │   ├── ada2005/
│   │   ├── ada2012/
│   │   └── ada2022/
│   │
│   ├── platform/
│   │   ├── gnat/
│   │   ├── gwgnat/
│   │   ├── janus/
│   │   ├── artek/
│   │   └── meridian/
│   │
│   ├── hal/
│   ├── rendering/
│   ├── storage/
│   ├── network/
│   ├── ui/
│   ├── dice/
│   └── rules/
│
├── obj/
├── doc/
│
├── vtt.gpr
├── README.md
└── LICENSE.PD
```

---

# Правило именования пакетов

Предлагаю принять стиль:

```ada
VTT_Config
VTT_Types
VTT_Object_IDs
VTT_Events
VTT_Memory
VTT_Dice
VTT_Renderer
```

а не child packages.

Причины:

- ближе к Ada'83;

- меньше проблем со старыми компиляторами;

- проще переносить на экзотические системы.

---

# Первый набор пакетов

## VTT_Config

`vtt_config.ads`

```ada
package VTT_Config is

   Version_Major : constant := 0;
   Version_Minor : constant := 1;
   Version_Patch : constant := 0;

end VTT_Config;
```

---

## VTT_Types

`vtt_types.ads`

Поскольку Ada'83 не имеет модульных типов, а некоторые старые компиляторы по-разному трактуют размеры, я бы сделал две реализации:

```text
runtime/
├── ada83/
│   └── vtt_types.ads
└── ada95/
    └── vtt_types.ads
```

Для Ada'95:

```ada
package VTT_Types is

   type UInt8  is mod 2 ** 8;
   type UInt16 is mod 2 ** 16;
   type UInt32 is mod 2 ** 32;

   type Int8  is range -(2 ** 7)  .. (2 ** 7)  - 1;
   type Int16 is range -(2 ** 15) .. (2 ** 15) - 1;
   type Int32 is range -(2 ** 31) .. (2 ** 31) - 1;

end VTT_Types;
```

---

## VTT_Object_IDs

```ada
with VTT_Types;

package VTT_Object_IDs is

   subtype Object_ID is VTT_Types.UInt32;

   Null_Object_ID : constant Object_ID := 0;

end VTT_Object_IDs;
```

---

## VTT_Events

Минимальная версия.

```ada
package VTT_Events is

   type Event_Kind is
   (
      Event_None,

      Event_Map_Loaded,
      Event_Map_Unloaded,

      Event_Token_Created,
      Event_Token_Removed,
      Event_Token_Moved,

      Event_Dice_Rolled
   );

end VTT_Events;
```

---

# Что не делать пока

Не создавать:

```text
VTT_Rendering
VTT_UI
VTT_Network
VTT_Storage
```

Пока нет даже базовых типов и соглашений по памяти.

---

# Следующий архитектурный шаг

После этого я бы занялся не графикой, а системой памяти:

```ada
VTT_Memory
```

Потому что именно она определит:

- возможность работы на микроконтроллерах;

- работу без ОС;

- размер потребляемой памяти;

- поведение контейнеров.

Если мы сразу привяжемся к `new`, то потом будет сложнее адаптировать проект под bare metal.

Поэтому логичным следующим этапом будет проектирование **унифицированного менеджера памяти и аллокаторов**, который сможет работать как с динамической кучей GNAT, так и с фиксированным пулом памяти на микроконтроллере. Это решение повлияет почти на все остальные подсистемы VTT.
