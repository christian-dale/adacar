with MicroBit.IOs;
with MicroBit;
with MicroBit.Buttons; use MicroBit.Buttons;
with MotorController;

procedure Main is   
begin
   --  We set the frequency by setting the period (remember f=1/t).
   MicroBit.IOs.Set_Analog_Period_Us(20000); -- 50 Hz = 1/50 = 0.02s = 20 ms = 20000us
   
   MotorController.MoveForward;
   
   loop
      if MicroBit.Buttons.State(Button_A) = Pressed then
         MotorController.Spin;
      elsif MicroBit.Buttons.State(Button_B) = Pressed then
         MotorController.Strafe;
      end if;
   end loop;
end Main;
