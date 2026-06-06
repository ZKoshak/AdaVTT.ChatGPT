package VTT.Core.Events is

   type Event_ID is new Natural;

   type Event is tagged record
      ID : Event_ID;
   end record;

end VTT.Core.Events;
