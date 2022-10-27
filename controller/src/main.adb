with MicroBit.Radio;
with HAL; use HAL;
with MicroBit.Console; use MicroBit.Console;
with nRF.Radio;
use MicroBit;
procedure Main is
   RXdata : Radio.RadioData;
   TxData : Radio.RadioData;
begin
   TxData.Length := 5;
   TxData.Version:= 12;
   TxData.Group := 1;
   TxData.Protocol := 14;

   Radio.Setup(RadioFrequency => 2407,
               Length => TxData.Length,
               Version => TxData.Version,
               Group => TxData.Group,
               Protocol => TxData.Protocol);

   Radio.StartReceiving;
   Put_Line(Radio.State); -- this should report Status: 3, meaning in RX mode

   loop
      --  --check if some data received and if so print it. Note that the framebuffer can max contain x messages (currently set to 4).
      --important! Sometimes data received contains junk since we dont do any package verification and radio transmission is noisy!
      while Radio.DataReady loop
         RXdata :=Radio.Receive;
         Put("Raven Received D1: " & UInt8'Image(RXdata.Payload(1)));
         Put_Line(" D2: " & UInt8'Image(RXdata.Payload(2)));
      end loop;
      --
      --  -- setup some data to be transmitted and transmit it
      TxData.Payload(1) := 12;
      TxData.Payload(2) := 34;
      Put("Transmit D1: " & UInt8'Image(TXdata.Payload(1)));
      Put_Line(" D2: " & UInt8'Image(TXdata.Payload(2)));
      Radio.Transmit(TXdata);
      --
      -- repeat every 500ms
        delay(0.5);

   end loop;
end Main;
