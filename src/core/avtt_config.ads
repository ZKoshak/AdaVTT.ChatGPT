package AVTT_Config is

  Project_Name : constant String := "AdaVTT";

  Version_Major : constant := 0;
  Version_Minor : constant := 1;
  Version_Patch : constant := 0;

  API_Version : constant := 1;

  Ada_83_Mode   : constant Boolean := False;
  Ada_95_Mode   : constant Boolean := True;

  Compiler_GNAT     : constant Boolean := True;
  Compiler_GW_GNAT  : constant Boolean := False;
  Compiler_Janus     : constant Boolean := False;

  Platform_DOS      : constant Boolean := False;
  Platform_Linux    : constant Boolean := True;

end AVTT_Config;
