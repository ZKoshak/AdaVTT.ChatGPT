type Map_ID is new Natural;

type Tile is record
   Terrain : Natural;
end record;

type Map is record
   Width  : Natural;
   Height : Natural;

   Tiles  : Tile_Array_Access;
end record;
