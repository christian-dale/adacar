package MainController is

   type Directions is (Forward, Stop);
   
   task SenseAccelerometer with Priority => 1;
   
   task SenseStop with Priority => 2;
end MainController;
