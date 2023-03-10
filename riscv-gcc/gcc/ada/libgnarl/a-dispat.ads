------------------------------------------------------------------------------
--                                                                          --
--                         GNAT RUN-TIME COMPONENTS                         --
--                                                                          --
--                       A D A . D I S P A T C H I N G                      --
--                                                                          --
--                                 S p e c                                  --
--                                                                          --
-- This specification is derived from the Ada Reference Manual for use with --
-- GNAT.  In accordance with the copyright of that document, you can freely --
-- copy and modify this specification,  provided that if you redistribute a --
-- modified version,  any changes that you have made are clearly indicated. --
--                                                                          --
------------------------------------------------------------------------------

with Ada.Task_Identification;

package Ada.Dispatching is
   pragma Preelaborate (Dispatching);

   procedure Yield with
     Global => (In_Out => Ada.Task_Identification.Tasking_State);

   Dispatching_Policy_Error : exception;
end Ada.Dispatching;
