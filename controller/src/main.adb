with LSM303AGR; use LSM303AGR;
with MicroBit.DisplayRT;
with MicroBit.DisplayRT.Symbols;
with MicroBit.Accelerometer;
with MicroBit.Radio;
with MicroBit.Buttons; use MicroBit.Buttons;
with HAL; use HAL;
with MicroBit.Console; use MicroBit.Console;
with nRF.Radio;
use MicroBit;

procedure Main is
   Data: All_Axes_Data;
   Threshold : constant := 125;
   Threshold_2 : constant := 200;
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

   loop

      -- setup some data to be transmitted and transmit it
      Data := Accelerometer.AccelData;
      --if MicroBit.Buttons.State(Button_A) = Pressed then TxData.Payload(1) := 2;
      --Elsif MicroBit.Buttons.State(Button_B) = Pressed then TxData.Payload(1) := 1;

      if MicroBit.Buttons.State(Button_A) = Pressed then
         TxData.Payload(2) := 1;
      else
         TxData.Payload(2) := 0;
      end if;

      if Data.Y > Threshold_2 then
         TxData.Payload(1) := 1;
      elsif Data.X > Threshold then
         TxData.Payload(1) := 2;
      elsif Data.X < -Threshold then
         TxData.Payload(1) := 3;
      elsif Data.Y < -Threshold and Data.Y > -Threshold_2 then
         TxData.Payload(1) := 4;
      elsif Data.Y < -Threshold_2 then
         TxData.Payload(1) := 5;

      else
         TxData.Payload(1) := 0;

      end if;

      Put_Line("Transmit D1: " & UInt8'Image(TXdata.Payload(1)));
      Radio.Transmit(TXdata);

      delay(0.1);
   end loop;
end Main;
