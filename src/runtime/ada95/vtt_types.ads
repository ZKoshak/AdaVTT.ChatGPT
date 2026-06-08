package VTT_Types is

   type UInt8  is mod 2 ** 8;
   type UInt16 is mod 2 ** 16;
   type UInt32 is mod 2 ** 32;

   type Int8  is range -(2 ** 7)  .. (2 ** 7)  - 1;
   type Int16 is range -(2 ** 15) .. (2 ** 15) - 1;
   type Int32 is range -(2 ** 31) .. (2 ** 31) - 1;

end VTT_Types;
