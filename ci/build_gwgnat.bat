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
