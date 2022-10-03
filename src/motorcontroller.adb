with MicroBit.IOs;
with MicroBit;

package body motorcontroller is

procedure Spin is
      Forward : constant Boolean := True; -- forward is true, backward is false
begin
     MicroBit.IOs.Set(12, not Forward); --IN1
     MicroBit.IOs.Set(13, Forward); --IN2         
         
     MicroBit.IOs.Set(14, not Forward);
     MicroBit.IOs.Set(15, Forward);
end Spin;

procedure Strafe is
      Forward : constant Boolean := True; -- forward is true, backward is false
   begin
   --LEFT
   --front   
   MicroBit.IOs.Set(6, not Forward); --IN1
   MicroBit.IOs.Set(7, Forward); --IN2

   MicroBit.IOs.Set(2, not Forward); --IN3
   MicroBit.IOs.Set(3, Forward); --IN4
      
end Strafe;

end motorcontroller;
