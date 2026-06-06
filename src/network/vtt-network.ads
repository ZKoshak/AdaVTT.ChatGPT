package VTT.Network is

   type Transport is limited interface;

   procedure Send
     (Self : in out Transport;
      Data : Stream_Element_Array)
   is abstract;

end VTT.Network;
