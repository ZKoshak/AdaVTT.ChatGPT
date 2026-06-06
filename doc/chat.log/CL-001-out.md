Интересный проект. Если ставить цель **максимальной переносимости**, включая запуск на микроконтроллерах и даже без ОС, то архитектуру стоит проектировать не как обычное настольное приложение, а как набор независимых уровней абстракции с очень строгим разделением ответственности.

## Основные требования

1. Язык: Ada 2022.

2. Отсутствие зависимости от ОС.

3. Отсутствие зависимости от графических библиотек.

4. Возможность работы:
   
   - на Linux;
   
   - на Windows;
   
   - на BSD;
   
   - на RTOS;
   
   - на bare metal;
   
   - на микроконтроллерах.

5. Модульность.

6. Возможность отключать ненужные подсистемы на этапе компиляции.

7. Минимальное использование динамической памяти.

8. Детерминированное поведение.

---

# Предлагаемая архитектура

```
+------------------------------------------------+
|                VTT Application                 |
+------------------------------------------------+
|               Game Logic Layer                 |
+------------------------------------------------+
|             Tabletop Domain Layer              |
|                                                |
| Tokens | Maps | Fog | Dice | Rules | Assets    |
+------------------------------------------------+
|              Service Interfaces                |
|                                                |
| Graphics | Audio | Storage | Network | Input   |
+------------------------------------------------+
|              Platform Adapters                 |
|                                                |
| SDL      Framebuffer      WebAssembly          |
| Linux    Windows          Bare Metal           |
+------------------------------------------------+
|                   Hardware                     |
+------------------------------------------------+
```

---

# Слои проекта

## 1. Core

Полностью платформонезависимая библиотека.

Содержит:

- контейнеры;

- математику;

- сериализацию;

- систему событий;

- менеджер памяти;

- планировщик задач.

Например:

```ada
package VTT.Core.Events is

   type Event_ID is new Natural;

   type Event is tagged record
      ID : Event_ID;
   end record;

end VTT.Core.Events;
```

---

## 2. HAL (Hardware Abstraction Layer)

Единственное место, где может быть платформозависимый код.

Интерфейсы:

```ada
package VTT.HAL.Graphics is

   type Graphics_Device is limited interface;

   procedure Draw_Pixel
     (Self : in out Graphics_Device;
      X    : Integer;
      Y    : Integer) is abstract;

end VTT.HAL.Graphics;
```

---

Для Linux можно сделать реализацию через SDL.

Для микроконтроллера — через драйвер дисплея.

Для bare metal x86 — через framebuffer.

---

## 3. Rendering

Не знает ничего о железе.

Работает только через HAL.

```ada
package VTT.Rendering is

   procedure Draw_Map
     (Target : in out Graphics_Device'Class);

end VTT.Rendering;
```

---

# Подсистема памяти

Для микроконтроллеров обычный `new` может быть нежелателен.

Поэтому лучше сразу ввести интерфейс аллокатора.

```ada
package VTT.Memory is

   type Allocator is limited interface;

   function Allocate
     (Self : in out Allocator;
      Size : Natural)
      return System.Address is abstract;

end VTT.Memory;
```

Реализации:

- Fixed Pool

- Stack Allocator

- Arena Allocator

- Dynamic Heap

---

# Система модулей

Каждый компонент собирается отдельно.

Например:

```
vtt-core
vtt-renderer
vtt-network
vtt-storage
vtt-rules
vtt-audio
vtt-ui
```

---

# Сетевой слой

Не должен зависеть от TCP/IP напрямую.

Интерфейс транспорта:

```ada
package VTT.Network is

   type Transport is limited interface;

   procedure Send
     (Self : in out Transport;
      Data : Stream_Element_Array)
   is abstract;

end VTT.Network;
```

Реализации:

- TCP

- UDP

- Serial

- CAN

- Shared Memory

- Custom RF

---

# Представление карты

Карты лучше сделать иерархическими.

```ada
type Map_ID is new Natural;

type Tile is record
   Terrain : Natural;
end record;

type Map is record
   Width  : Natural;
   Height : Natural;

   Tiles  : Tile_Array_Access;
end record;
```

На слабых устройствах можно использовать тайловый рендеринг.

---

# Токены

```ada
type Token_ID is new Natural;

type Token is record
   ID : Token_ID;

   X : Integer;
   Y : Integer;

   Rotation : Float;
end record;
```

---

# Dice Engine

Полностью отдельный модуль.

```ada
package VTT.Dice is

   function Roll
     (Count : Positive;
      Sides : Positive)
      return Integer;

end VTT.Dice;
```

В дальнейшем:

```
3d6
2d20kh1
4d6dl1
```

---

# Система правил

Самая важная часть.

Я бы не зашивал конкретные правила в ядро.

Лучше:

```ada
package VTT.Rules is

   type Ruleset is limited interface;

   procedure Execute_Action
     (Self : in out Ruleset)
   is abstract;

end VTT.Rules;
```

Тогда можно подключать:

- D&D

- Pathfinder

- GURPS

- Fate

- собственные системы

как отдельные пакеты Ada.

---

# Графический интерфейс

Рекомендую сделать собственный.

Не использовать:

- Qt

- GTK

- wxWidgets

UI должен рисоваться через тот же HAL.

```
Button
Label
Window
Panel
List
Tree
```

---

# Формат хранения данных

Лучше сразу использовать бинарный формат.

Например:

```
.vttmap
.vtttoken
.vttcampaign
```

Через Ada Streams.

---

# Предлагаемая структура репозитория

```
vtt/
│
├── core/
├── hal/
│   ├── linux/
│   ├── windows/
│   ├── stm32/
│   ├── riscv/
│   └── baremetal/
│
├── rendering/
├── ui/
├── network/
├── storage/
├── dice/
├── rules/
├── tools/
│
└── examples/
```

## Что я бы сделал первым

Сначала определить **архитектурный стандарт проекта** и создать минимальное ядро:

1. `VTT.Core`

2. `VTT.Memory`

3. `VTT.Events`

4. `VTT.HAL`

5. `VTT.Rendering`

После этого собрать самый простой прототип:

- framebuffer 320×240;

- карта 32×32 тайла;

- один токен;

- перемещение токена;

- отсутствие ОС.

Это позволит проверить, что архитектура действительно работает на bare metal, а не только на настольных системах.
