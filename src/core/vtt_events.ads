package VTT_Events is

   type Event_ID is new Natural;

   type Event is tagged record
      ID : Event_ID;
   end record;

   type Event_Kind is
   (
      Event_None,
      Event_Token_Move,
      Event_Map_Load,
      Event_Dice_Roll
   );

end VTT_Events;
