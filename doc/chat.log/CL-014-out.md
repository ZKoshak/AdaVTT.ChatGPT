Для GW-GNAT есть одна проблема: его версии 3.07–3.10 заметно отличаются друг от друга, а ещё отличаются от современного GNAT.

Поэтому я бы не делал скрипт, который пытается быть слишком умным. Лучше простой и понятный BAT-файл, который потом можно адаптировать под конкретную версию.

Первая версия `ci/build_gwgnat.bat`:

```bat
@ECHO OFF

REM ============================================================
REM AdaVTT Build Script for GW-GNAT 3.x
REM ============================================================

ECHO.
ECHO AdaVTT - GW-GNAT Build
ECHO.

IF NOT EXIST obj MD obj

REM ------------------------------------------------------------
REM Compile package specifications
REM ------------------------------------------------------------

gnatmake -c src\core\avtt_config.ads
IF ERRORLEVEL 1 GOTO BUILD_ERROR

gnatmake -c src\core\avtt_types.ads
IF ERRORLEVEL 1 GOTO BUILD_ERROR

gnatmake -c src\core\avtt_object_ids.ads
IF ERRORLEVEL 1 GOTO BUILD_ERROR

gnatmake -c src\core\avtt_events.ads
IF ERRORLEVEL 1 GOTO BUILD_ERROR

ECHO.
ECHO Build successful.
GOTO END

:BUILD_ERROR
ECHO.
ECHO Build failed.
EXIT /B 1

:END
EXIT /B 0
```

Но лично я бы пошёл ещё дальше и сделал заготовку под будущий рост проекта.

Например:

```bat
@ECHO OFF

REM ============================================================
REM AdaVTT Build Script for GW-GNAT
REM ============================================================

SET SRC=src
SET CORE=%SRC%\core

ECHO.
ECHO Building AdaVTT...
ECHO.

IF NOT EXIST obj MD obj

CALL :COMPILE %CORE%\avtt_config.ads
CALL :COMPILE %CORE%\avtt_types.ads
CALL :COMPILE %CORE%\avtt_object_ids.ads
CALL :COMPILE %CORE%\avtt_events.ads

ECHO.
ECHO Build successful.
GOTO END

:COMPILE

ECHO Compiling %1

gnatmake -c %1

IF ERRORLEVEL 1 GOTO BUILD_ERROR

GOTO :EOF

:BUILD_ERROR

ECHO.
ECHO Build failed.
EXIT /B 1

:END
EXIT /B 0
```

Однако для AdaVTT я бы рекомендовал ещё один шаг.

Когда появится первый исполняемый модуль, например:

```ada
procedure AdaVTT is
begin
   null;
end AdaVTT;
```

то скрипт лучше перестроить на сборку главной программы:

```bat
gnatmake adavtt.adb
```

а не отдельных пакетов.

То есть в перспективе структура `ci/` будет такой:

```text
ci/
├── build_gnat.sh
├── build_gwgnat.bat
├── build_janus.bat
├── build_artek.bat
└── build_meridian.bat
```

и каждый скрипт будет собирать один и тот же корневой модуль проекта, а не перечислять пакеты вручную. Сейчас пакеты есть только спецификации (`.ads`), поэтому компилировать приходится их напрямую, но это временное решение до появления первого `adavtt.adb`.
