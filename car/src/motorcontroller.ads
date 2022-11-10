with MicroBit.IOs;
with MicroBit;

-- test with having a constant speed variable only in move forward and see is it enough to change
-- the speed of the other fonctions. if not we can try to intrudse the spead into the other functions.
-- we can try to ask steven about the sulotion.

package MotorController is
   procedure MoveForward(Speed :  MicroBit.IOs.Analog_Value);

   procedure MoveBackward(Speed : MicroBit.Ios.Analog_Value);

   procedure Spin_Right;

   procedure Spin_Left;

   procedure Strafe;

end MotorController;
