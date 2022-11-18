with MicroBit.IOsForTasking;
with MicroBit;

-- test with having a constant speed variable only in move forward and see is it enough to change
-- the speed of the other fonctions. if not we can try to intrudse the spead into the other functions.
-- we can try to ask steven about the sulotion.

package MotorController is
   IsStopped: Boolean := False;

   procedure MoveForward(Speed :  MicroBit.IOsForTasking.Analog_Value);

   procedure MoveBackward(Speed : MicroBit.IOsForTasking.Analog_Value);

   procedure Spin_Right;

   procedure Spin_Left;

   procedure Strafe;

   procedure Stop;

end MotorController;
