with AVTT_Types;

package AVTT_Object_IDs is

--   subtype Object_ID is AVTT_Types.UInt32;
   type Object_ID is new AVTT_Types.UInt32;

   Null_Object_ID : constant Object_ID := 0;

end AVTT_Object_IDs;
