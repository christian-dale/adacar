with Ada.Real_Time; use Ada.Real_Time;
with MicroBit.Console; use MicroBit.Console;
with MicroBit.IOsForTasking;
with MicroBit.Radio;
with HAL; use HAL;
use MicroBit;

package MainController is
   
   task RadioReceive with Priority => 1;
   
   task SenseDrive with Priority => 1;
   
   protected PayloadDriver is
      function GetPayloadAccelerometer return UInt8;
      procedure SetPayloadAccelerometer (A : UInt8);
      function GetPayloadStop return UInt8;
      procedure SetPayloadStop (S : UInt8);      
   private
      Payload_Accelerometer : UInt8 := 0;
      Payload_Stop : Uint8 := 0;
   end PayloadDriver;
   
end MainController;
