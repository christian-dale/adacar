with Ada.Real_Time; use Ada.Real_Time;
with MicroBit.Console; use MicroBit.Console;
with MicroBit.IOsForTasking;
with MicroBit.Radio;
with HAL; use HAL;
use MicroBit;

with MotorController;

package body MainController is
   
   task body RadioReceive is
      myClock : Time;
      RXdata : Radio.RadioData;
   begin
      loop
         myClock := Clock;
         
         while Radio.DataReady loop
            RXdata := Radio.Receive;
            
            PayloadDriver.SetPayloadAccelerometer(RXdata.Payload(1));
            PayloadDriver.SetPayloadStop(RXdata.Payload(2));
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

         if PayloadDriver.GetPayloadStop = 0 then
             if PayloadDriver.GetPayloadAccelerometer = 0 then
                 MotorController.MoveForward(Speed); -- If we agree at that 0 = stop we change the statment
             elsif PayloadDriver.GetPayloadAccelerometer = 1 then 
                 MotorController.MoveForward(Speed_2);
             elsif PayloadDriver.GetPayloadAccelerometer = 2 then 
                 MotorController.Spin_Left; 
             elsif PayloadDriver.GetPayloadAccelerometer = 3 then 
                 MotorController.Spin_Right;
             elsif PayloadDriver.GetPayloadAccelerometer = 4 then 
                 MotorController.MoveBackward(Speed);
             elsif PayloadDriver.GetPayloadAccelerometer = 5 then 
                 MotorController.MoveBackward(Speed_2);
             end if;         
         else
             MotorController.Stop;
         end if;         
         
         delay until myClock + Milliseconds(100);
      end loop;
   end SenseDrive;
   
   protected body PayloadDriver is
      function GetPayloadAccelerometer return UInt8 is
      begin
         return Payload_Accelerometer;
      end GetPayloadAccelerometer;

      procedure SetPayloadAccelerometer (A : UInt8) is
      begin
         Payload_Accelerometer := A;
      end SetPayloadAccelerometer;

      function GetPayloadStop return UInt8 is
      begin
         return Payload_Stop;
      end;

      procedure SetPayloadStop (S : UInt8) is
      begin
         Payload_Stop := S;
      end;
   end PayloadDriver;
   
end MainController;
