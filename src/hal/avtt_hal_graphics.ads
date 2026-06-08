package AVTT_HAL_Graphics is

   type Graphics_Device is limited interface;

   procedure Draw_Pixel
     (Self : in out Graphics_Device;
      X    : Integer;
      Y    : Integer) is abstract;

end AVTT_HAL_Graphics;
