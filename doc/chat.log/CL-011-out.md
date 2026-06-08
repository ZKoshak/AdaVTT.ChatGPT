Для первой ревизии я бы сделал максимально консервативный код, ориентированный на Ada'95 и без зависимостей от `Interfaces`, `System`, `Ada.*` и прочих библиотек, которые иногда по-разному реализованы в старых компиляторах.

### `adavtt.gpr`

```ada
project AdaVTT is

   for Source_Dirs use (
      "src/core"
   );

   for Object_Dir use "obj";

end AdaVTT;
```

---

### `src/core/avtt_config.ads`

```ada
package AVTT_Config is

   Project_Name : constant String := "AdaVTT";

   Version_Major : constant := 0;
   Version_Minor : constant := 1;
   Version_Patch : constant := 0;

end AVTT_Config;
```

---

### `src/core/avtt_types.ads`

```ada
package AVTT_Types is

   ------------------------------------------------------------------
   -- Unsigned Integer Types
   ------------------------------------------------------------------

   type UInt8 is mod 2 ** 8;

   type UInt16 is mod 2 ** 16;

   type UInt32 is mod 2 ** 32;

   ------------------------------------------------------------------
   -- Signed Integer Types
   ------------------------------------------------------------------

   type Int8 is range
      -(2 ** 7) ..
       (2 ** 7) - 1;

   type Int16 is range
      -(2 ** 15) ..
       (2 ** 15) - 1;

   type Int32 is range
      -(2 ** 31) ..
       (2 ** 31) - 1;

end AVTT_Types;
```

---

### `src/core/avtt_object_ids.ads`

```ada
with AVTT_Types;

package AVTT_Object_IDs is

   subtype Object_ID is AVTT_Types.UInt32;

   Null_Object_ID : constant Object_ID := 0;

end AVTT_Object_IDs;
```

---

### `src/core/avtt_events.ads`

```ada
package AVTT_Events is

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

end AVTT_Events;
```

---

## Замечания по совместимости

Я бы уже сейчас сделал несколько поправок к первоначальному плану.

### 1. Не использовать `Object_ID` как subtype

Старые компиляторы иногда хуже диагностируют ошибки при работе с подтипами модульных типов.

Я бы скорее написал:

```ada
type Object_ID is new AVTT_Types.UInt32;

Null_Object_ID : constant Object_ID := 0;
```

Тогда тип будет строго отдельным.

---

### 2. Добавить ревизию API

В `AVTT_Config`:

```ada
API_Version : constant := 1;
```

Это пригодится, когда появятся плагины, правила и внешние инструменты.

---

### 3. Возможно отказаться от Int8 и UInt8

На некоторых старых компиляторах размер машинного слова может быть неожиданным.

Поэтому в дальнейшем стоит проверить, не понадобится ли пакет:

```ada
AVTT_Platform_Types
```

с реализациями для разных компиляторов.

Для первой версии текущий вариант вполне подходит.

---

В результате получится минимальный каркас, который уже можно попытаться собрать на современном GNAT и затем проверить на GW-GNAT 3.x, чтобы сразу выявить реальные ограничения старых компиляторов, а не гадать о них теоретически.
