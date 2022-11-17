with MicroBit.IOs;
-- with MicroBit.Buttons; use MicroBit.Buttons;
with MotorController;
with MicroBit.Radio;
with HAL; use HAL;
with MicroBit.Console; use MicroBit.Console;
--with nRF.Radio;
use MicroBit;

procedure Main is   
   RXdata : Radio.RadioData;
   TxData : Radio.RadioData;
   Speed : constant MicroBit.IOs.Analog_Value := 512;
   Speed_2 : constant MicroBit.IOs.Analog_Value := 768;

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
   
   MicroBit.IOs.Set_Analog_Period_Us(20000); -- 50 Hz = 1/50 = 0.02s = 20 ms = 20000us
   MotorController.MoveForward(Speed) ;
   Radio.StartReceiving;
   Put_Line(Radio.State);
   loop
      --check if some data received and if so print it. Note that the framebuffer can max contain x messages (currently set to 4).
      --important! Sometimes data received contains junk since we dont do any package verification and radio transmission is noisy!
      while Radio.DataReady loop
         RXdata := Radio.Receive;
         Put_Line(UInt8'Image(RXdata.Payload(1)));
         
         if RXdata.Payload(2) = 0 then
            if RXdata.Payload(1) = 0 then
               MotorController.MoveForward(Speed); -- If we agree at that 0 = stop we change the statment
            elsif RXdata.Payload(1) = 1 then 
               MotorController.MoveForward(Speed_2);
            elsif RXdata.Payload(1) = 2 then 
               MotorController.Spin_Left; 
            elsif RXdata.Payload(1) = 3 then 
               MotorController.Spin_Right;
            elsif RXdata.Payload(1) = 4 then 
               MotorController.MoveBackward(Speed);
            elsif RXdata.Payload(1) = 5 then 
               MotorController.MoveBackward(Speed_2);
            end if;         
         else
            MotorController.Stop;
         end if;
      end loop;
      null;
   end loop;
end Main;
