package AVTT_Network is

   type Transport is limited interface;

   procedure Send
     (Self : in out Transport;
      Data : Stream_Element_Array)
   is abstract;

end AVTT_Network;
