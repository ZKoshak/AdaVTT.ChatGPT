@ECHO OFF

REM ============================================================
REM AdaVTT Build Script for Janus Ada
REM ============================================================

SET SRC=src
SET CORE=%SRC%\core

IF NOT EXIST obj MD obj

CALL :BUILD_FILE avtt_config.ads
CALL :BUILD_FILE avtt_types.ads
CALL :BUILD_FILE avtt_object_ids.ads
CALL :BUILD_FILE avtt_events.ads

ECHO.
ECHO Build successful.
EXIT /B 0

:BUILD_FILE

ECHO Compiling %1

REM Janus command goes here.
REM Example:
REM ja %CORE%\%1

IF ERRORLEVEL 1 GOTO BUILD_ERROR

GOTO :EOF

:BUILD_ERROR

ECHO.
ECHO Build failed.
EXIT /B 1
