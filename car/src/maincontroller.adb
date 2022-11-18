with Ada.Real_Time; use Ada.Real_Time;
with MicroBit.Console; use MicroBit.Console;
with MicroBit.IOsForTasking;
with MicroBit.Radio;
with HAL; use HAL;
use MicroBit;

with MotorController;

package body MainController is

   task body SenseAccelerometer is
      myClock : Time;
      Speed : constant MicroBit.IOsForTasking.Analog_Value := 512;
      Speed_2 : constant MicroBit.IOsForTasking.Analog_Value := 768;
      RXdata : Radio.RadioData;
      TxData : Radio.RadioData;
   begin
      loop
         myClock := Clock;
         
         delay (0.05); --simulate 50 ms execution time, replace with your code
         
         while Radio.DataReady loop
            RXdata := Radio.Receive;
         
            if MotorController.IsStopped = False then
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
         
         delay until myClock + Milliseconds(100);
      end loop;
   end SenseAccelerometer;
   
   task body SenseStop is
      myClock : Time;
      RXdata : Radio.RadioData;
      TxData : Radio.RadioData;
   begin
      loop
         myClock := Clock;
         
         delay (0.05); --simulate 50 ms execution time, replace with your code
         
         while Radio.DataReady loop
            RXdata := Radio.Receive;
         
            if RXdata.Payload(2) = 1 then
               MotorController.IsStopped := True;
            else
               MotorController.IsStopped := False;
            end if;
         end loop;
         
         delay until myClock + Milliseconds(100);
      end loop;
   end SenseStop;   
end MainController;
