package AVTT_Events is

--   type Event_ID is new Natural;

--   type Event is tagged record
--      ID : Event_ID;
--   end record;

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
