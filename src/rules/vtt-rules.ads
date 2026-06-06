package VTT.Rules is

   type Ruleset is limited interface;

   procedure Execute_Action
     (Self : in out Ruleset)
   is abstract;

end VTT.Rules;
