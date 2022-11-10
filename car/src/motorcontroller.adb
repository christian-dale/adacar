
package body motorcontroller is
   procedure Moveforward (Speed :  MicroBit.IOs.Analog_Value) is
      Forward : constant Boolean := True; -- forward is true, backward is false
   begin
      
      --LEFT
      --front   
      MicroBit.IOs.Set(6, Forward); --IN1
      MicroBit.IOs.Set(7, not Forward); --IN2

      --back
      MicroBit.IOs.Set(2, Forward); --IN3
      MicroBit.IOs.Set(3, not Forward); --IN4
                                        
      --RIGHT
      --front
      MicroBit.IOs.Set(12, Forward); --IN1
      MicroBit.IOs.Set(13, not Forward); --IN2

      --back
      MicroBit.IOs.Set(14, Forward); --IN3
      MicroBit.IOs.Set(15, not Forward); --IN4
   
      MicroBit.IOs.Write (0, Speed); --left speed control ENA ENB ;  right cabels   
      MicroBit.IOs.Write (1, Speed); --right speed control ENA ENB;   left cables 
   end Moveforward;
   
   procedure MoveBackward (Speed :  MicroBit.IOs.Analog_Value) is
      Forward : constant Boolean := False; -- forward is true, backward is false
   begin
      --LEFT
      --front   
      MicroBit.IOs.Set(6, Forward); --IN1
      MicroBit.IOs.Set(7, not Forward); --IN2

      --back
      MicroBit.IOs.Set(2, Forward); --IN3
      MicroBit.IOs.Set(3, not Forward); --IN4
                                        
      --RIGHT
      --front
      MicroBit.IOs.Set(12, Forward); --IN1
      MicroBit.IOs.Set(13, not Forward); --IN2

      --back
      MicroBit.IOs.Set(14, Forward); --IN3
      MicroBit.IOs.Set(15, not Forward); --IN4
   
      MicroBit.IOs.Write (0, Speed); --left speed control ENA ENB
      MicroBit.IOs.Write (1, Speed); --right speed control ENA ENB
   end MoveBackward;

   procedure Spin_Right is
      Forward : constant Boolean := True; -- forward is true, backward is false

   begin
      MicroBit.IOs.Set(12, not Forward); --IN1
      MicroBit.IOs.Set(13, Forward); --IN2         
         
      MicroBit.IOs.Set(14, not Forward);
      MicroBit.IOs.Set(15, Forward);   
   end Spin_Right;
   
   procedure Spin_Left is
      Forward : constant Boolean := True; -- forward is true, backward is false

   begin
      MicroBit.IOs.Set(6, not Forward); --IN1
      MicroBit.IOs.Set(7, Forward); --IN2         
         
      MicroBit.IOs.Set(2, not Forward);
      MicroBit.IOs.Set(3, Forward);   
   end Spin_Left;
   
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
