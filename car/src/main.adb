with MicroBit.IOsForTasking;
with MotorController;
with MainController;
with MicroBit.Radio;
with HAL; use HAL;
with MicroBit.Console; use MicroBit.Console;
use MicroBit;

procedure Main with Priority => 0 is   
   RXdata : Radio.RadioData;
   TxData : Radio.RadioData;

begin
   TxData.Length := 5;
   TxData.Version:= 12;
   TxData.Group := 1;
   TxData.Protocol := 14;
   Radio.Setup(RadioFrequency => 2408,
               Length => TxData.Length,
               Version => TxData.Version,
               Group => TxData.Group,
               Protocol => TxData.Protocol);
   --  We set the frequency by setting the period (remember f=1/t).
   
   MicroBit.IOsForTasking.Set_Analog_Period_Us(20000); -- 50 Hz = 1/50 = 0.02s = 20 ms = 20000us
   Radio.StartReceiving;
   
   loop
      null;
   end loop;
end Main;
