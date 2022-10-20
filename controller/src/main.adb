with MicroBit.IOs;
with MicroBit;
with MicroBit.Buttons; use MicroBit.Buttons;

procedure Main is   
begin
   --  We set the frequency by setting the period (remember f=1/t).
   MicroBit.IOs.Set_Analog_Period_Us(20000); -- 50 Hz = 1/50 = 0.02s = 20 ms = 20000us
end Main;
