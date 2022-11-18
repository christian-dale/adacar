with Ada.Real_Time; use Ada.Real_Time;
with MicroBit.Console; use MicroBit.Console;
with MicroBit.IOsForTasking;
with MicroBit.Radio;
with HAL; use HAL;
use MicroBit;

with MotorController;

package body MainController is

   Payload_Accelerometer : UInt8 := 0;
   Payload_Stop : Uint8 := 0;   
   
   task body RadioReceive is
      myClock : Time;
      RXdata : Radio.RadioData;
   begin
      loop
         myClock := Clock;
         
         while Radio.DataReady loop
            RXdata := Radio.Receive;
            
            Payload_Accelerometer := RXdata.Payload(1);
            Payload_Stop := RXdata.Payload(2);
         end loop;         
         
         delay until myClock + Milliseconds(100);
      end loop;
   end RadioReceive;
   
   task body SenseDrive is
      myClock : Time;
      Speed : constant MicroBit.IOsForTasking.Analog_Value := 512;
      Speed_2 : constant MicroBit.IOsForTasking.Analog_Value := 768;
   begin
      loop
         myClock := Clock;

         if Payload_Stop = 0 then
             if Payload_Accelerometer = 0 then
                 MotorController.MoveForward(Speed); -- If we agree at that 0 = stop we change the statment
             elsif Payload_Accelerometer = 1 then 
                 MotorController.MoveForward(Speed_2);
             elsif Payload_Accelerometer = 2 then 
                 MotorController.Spin_Left; 
             elsif Payload_Accelerometer = 3 then 
                 MotorController.Spin_Right;
             elsif Payload_Accelerometer = 4 then 
                 MotorController.MoveBackward(Speed);
             elsif Payload_Accelerometer = 5 then 
                 MotorController.MoveBackward(Speed_2);
             end if;         
         else
             MotorController.Stop;
         end if;         
         
         delay until myClock + Milliseconds(100);
      end loop;
   end SendeDrive;
end MainController;
