package AVTT_Types is

   type Int8  is range -128 .. 127;
   type UInt8 is mod 2 ** 8;

   type Int16  is range -32768 .. 32767;
   type UInt16 is mod 2 ** 16;

   type Int32  is range -2 ** 31 .. 2 ** 31 - 1;
   type UInt32 is mod 2 ** 32;

end AVTT_Types;
