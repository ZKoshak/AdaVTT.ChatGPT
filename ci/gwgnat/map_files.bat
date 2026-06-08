@ECHO OFF

REM Create DOS-compatible view of sources

IF NOT EXIST dos_src MD dos_src

COPY src\core\avtt_config.ads dos_src\avtcfg.ads
COPY src\core\avtt_types.ads dos_src\avttype.ads
COPY src\core\avtt_object_ids.ads dos_src\avtobjid.ads
COPY src\core\avtt_events.ads dos_src\avtevent.ads
