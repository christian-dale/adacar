with MicroBit.IOs;
with MicroBit;
with MicroBit.Buttons; use MicroBit.Buttons;
with MotorController; use MotorController;

procedure Main is
   Speed : constant MicroBit.IOs.Analog_Value := 512; --between 0 and 1023
   Forward : constant Boolean := True; -- forward is true, backward is false
   
begin
   --  We set the frequency by setting the period (remember f=1/t).
   MicroBit.IOs.Set_Analog_Period_Us(20000); -- 50 Hz = 1/50 = 0.02s = 20 ms = 20000us 
   
   --LEFT
   --front   
   MicroBit.IOs.Set(6, Forward); --IN1
   MicroBit.IOs.Set(7, not Forward); --IN2

   --back
   MicroBit.IOs.Set(2, Forward); --IN3
   MicroBit.IOs.Set(3, not Forward); --IN4

   --RIGHT
   --front
   MicroBit.IOs.Set(12, Forward); --IN1
   MicroBit.IOs.Set(13, not Forward); --IN2

   --back
   MicroBit.IOs.Set(14, Forward); --IN3
   MicroBit.IOs.Set(15, not Forward); --IN4
   
   MicroBit.IOs.Write (0, Speed); --left speed control ENA ENB
   MicroBit.IOs.Write (1, Speed); --right speed control ENA ENB
   
   loop
      if MicroBit.Buttons.State (Button_A) = Pressed then
         Spin;
      elsif MicroBit.Buttons.State (Button_B) = Pressed then
         Strafe;
      end if;
   end loop;
end Main;
