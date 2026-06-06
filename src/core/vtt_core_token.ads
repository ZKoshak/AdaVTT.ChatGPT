type Token_ID is new Natural;

type Token is record
   ID : Token_ID;

   X : Integer;
   Y : Integer;

   Rotation : Float;
end record;
