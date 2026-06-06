package VTT.Memory is

   type Allocator is limited interface;

   function Allocate
     (Self : in out Allocator;
      Size : Natural)
      return System.Address is abstract;

end VTT.Memory;
