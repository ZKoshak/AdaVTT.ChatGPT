package VTT.HAL.Graphics is

   type Graphics_Device is limited interface;

   procedure Draw_Pixel
     (Self : in out Graphics_Device;
      X    : Integer;
      Y    : Integer) is abstract;

end VTT.HAL.Graphics;
