Если речь именно о **Janus/Ada 1.5.2**, то я бы пока вообще не пытался писать "настоящий" `build_janus.bat` под современные представления о сборке.

Причина в том, что Janus/Ada 1.5.2 — это ещё эпоха Ada'83, и организация проекта там принципиально отличается от GNAT. Кроме того, встречаются сведения, что для Janus 1.5.x использовались команды вида:

```text
janus ahello
jlink ahello
```

для компиляции и линковки соответственно. ([Reddit](https://www.reddit.com/r/ada/comments/1iz1t3e?utm_source=chatgpt.com "Janus Ada on CP/M"))

Также есть свидетельства, что Janus/Ada 1.5.2 — весьма старая реализация с ограничениями и особенностями среды DOS/CP/M. ([upload.wikimedia.org](https://upload.wikimedia.org/wikipedia/commons/8/8b/Turbo_Pascal_implementation_of_a_distributed_processing_network_of_MS-DOS_microcomputers_connected_in_a_master-slave_configuration._%28IA_turbopascalimple00ardn%29.pdf?utm_source=chatgpt.com "NAVAL POSTGRADUATE SCHOOL"))

Поэтому я бы сделал для AdaVTT следующий файл-заготовку.

### `ci/build_janus.bat`

```bat
@ECHO OFF

REM ============================================================
REM AdaVTT Build Script
REM Janus/Ada 1.5.2
REM ============================================================

ECHO.
ECHO AdaVTT - Janus/Ada 1.5.2 Build
ECHO.

IF NOT EXIST obj MD obj

REM ------------------------------------------------------------
REM Compile units
REM ------------------------------------------------------------

janus avtt_config
IF ERRORLEVEL 1 GOTO BUILD_ERROR

janus avtt_types
IF ERRORLEVEL 1 GOTO BUILD_ERROR

janus avtt_object_ids
IF ERRORLEVEL 1 GOTO BUILD_ERROR

janus avtt_events
IF ERRORLEVEL 1 GOTO BUILD_ERROR

ECHO.
ECHO Compilation completed.
GOTO END

:BUILD_ERROR

ECHO.
ECHO Build failed.
EXIT /B 1

:END
EXIT /B 0
```

Но есть гораздо более важный вопрос.

Для Janus/Ada 1.5.2 наши текущие исходники вообще не подойдут без адаптации, потому что сейчас мы ориентируемся на Ada'95:

```ada
type UInt32 is mod 2 ** 32;
```

а Janus/Ada 1.5.2 относится к эпохе Ada'83 и, вероятнее всего, не поддерживает:

- модульные типы (`mod`);

- child packages;

- многие конструкции Ada'95. ([Reddit](https://www.reddit.com/r/ada/comments/1iz1t3e?utm_source=chatgpt.com "Janus Ada on CP/M"))

Поэтому я бы пока рассматривал `build_janus.bat` как резерв на будущее, а реальную поддержку Janus/Ada 1.5.2 начинал только после появления каталога:

```text
src/runtime/ada83/
```

и первой реализации:

```text
src/runtime/ada83/avtt_types.ads
```

где вместо модульных типов будут использоваться обычные диапазонные типы, совместимые с Ada'83.

Сейчас для AdaVTT наиболее реалистичная цель:

```text
GNAT Ada95+
        ↓
GW-GNAT 3.x
        ↓
Janus/Ada 1.5.2
```

то есть сначала добиться чистой сборки на Ada'95, а затем постепенно вводить слой `runtime/ada83`, который позволит оценить реальные ограничения Janus/Ada 1.5.2 на практике. Это существенно снизит объём работы по сопровождению.
