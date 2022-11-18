
package body motorcontroller is
   procedure Moveforward (Speed :  MicroBit.IOsForTasking.Analog_Value) is
      Forward : constant Boolean := True; -- forward is true, backward is false
   begin
      
      --LEFT
      --front   
      MicroBit.IOsForTasking.Set(6, Forward); --IN1
      MicroBit.IOsForTasking.Set(7, not Forward); --IN2

      --back
      MicroBit.IOsForTasking.Set(2, Forward); --IN3
      MicroBit.IOsForTasking.Set(3, not Forward); --IN4
                                        
      --RIGHT
      --front
      MicroBit.IOsForTasking.Set(12, Forward); --IN1
      MicroBit.IOsForTasking.Set(13, not Forward); --IN2

      --back
      MicroBit.IOsForTasking.Set(14, Forward); --IN3
      MicroBit.IOsForTasking.Set(15, not Forward); --IN4
   
      MicroBit.IOsForTasking.Write (8, Speed); --left speed control ENA ENB ;  right cabels   
      MicroBit.IOsForTasking.Write (9, Speed); --right speed control ENA ENB;   left cables 
   end Moveforward;
   
   procedure MoveBackward (Speed :  MicroBit.IOsForTasking.Analog_Value) is
      Forward : constant Boolean := False; -- forward is true, backward is false
   begin
      --LEFT
      --front   
      MicroBit.IOsForTasking.Set(6, Forward); --IN1
      MicroBit.IOsForTasking.Set(7, not Forward); --IN2

      --back
      MicroBit.IOsForTasking.Set(2, Forward); --IN3
      MicroBit.IOsForTasking.Set(3, not Forward); --IN4
                                        
      --RIGHT
      --front
      MicroBit.IOsForTasking.Set(12, Forward); --IN1
      MicroBit.IOsForTasking.Set(13, not Forward); --IN2

      --back
      MicroBit.IOsForTasking.Set(14, Forward); --IN3
      MicroBit.IOsForTasking.Set(15, not Forward); --IN4
   
      MicroBit.IOsForTasking.Write (0, Speed); --left speed control ENA ENB
      MicroBit.IOsForTasking.Write (1, Speed); --right speed control ENA ENB
   end MoveBackward;

   procedure Spin_Right is
      Forward : constant Boolean := True; -- forward is true, backward is false

   begin
      MicroBit.IOsForTasking.Set(12, not Forward); --IN1
      MicroBit.IOsForTasking.Set(13, Forward); --IN2         
         
      MicroBit.IOsForTasking.Set(14, not Forward);
      MicroBit.IOsForTasking.Set(15, Forward);   
   end Spin_Right;
   
   procedure Spin_Left is
      Forward : constant Boolean := True; -- forward is true, backward is false

   begin
      MicroBit.IOsForTasking.Set(6, not Forward); --IN1
      MicroBit.IOsForTasking.Set(7, Forward); --IN2         
         
      MicroBit.IOsForTasking.Set(2, not Forward);
      MicroBit.IOsForTasking.Set(3, Forward);   
   end Spin_Left;
   
   procedure Strafe is
     Forward : constant Boolean := True; -- forward is true, backward is false
   begin
      --LEFT
      --front   
      MicroBit.IOsForTasking.Set(6, not Forward); --IN1
      MicroBit.IOsForTasking.Set(7, Forward); --IN2

      MicroBit.IOsForTasking.Set(2, not Forward); --IN3
      MicroBit.IOsForTasking.Set(3, Forward); --IN4
   end Strafe;
   
   procedure Stop is
      Speed : constant MicroBit.IOsForTasking.Analog_Value := 0;
   begin
      MicroBit.IOsForTasking.Write (8, Speed); --left speed control ENA ENB ;  right cabels   
      MicroBit.IOsForTasking.Write (9, Speed); --right speed control ENA ENB;   left cables       
   end Stop;

end motorcontroller;
