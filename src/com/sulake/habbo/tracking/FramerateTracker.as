package com.sulake.habbo.tracking
{
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   
   public class FramerateTracker
   {
       
      
      private var var_1649:int;
      
      private var var_2593:int;
      
      private var var_784:int;
      
      private var var_489:Number;
      
      private var var_2594:Boolean;
      
      private var var_2592:int;
      
      private var var_1855:int;
      
      public function FramerateTracker()
      {
         super();
      }
      
      public function get frameRate() : int
      {
         return Math.round(1000 / this.var_489);
      }
      
      public function configure(param1:IHabboConfigurationManager) : void
      {
         this.var_2593 = int(param1.getKey("tracking.framerate.reportInterval.seconds","300")) * 1000;
         this.var_2592 = int(param1.getKey("tracking.framerate.maximumEvents","5"));
         this.var_2594 = true;
      }
      
      public function trackUpdate(param1:uint, param2:IHabboTracking, param3:int) : void
      {
         var _loc4_:Number = NaN;
         ++this.var_784;
         if(this.var_784 == 1)
         {
            this.var_489 = param1;
            this.var_1649 = param3;
         }
         else
         {
            _loc4_ = Number(this.var_784);
            this.var_489 = this.var_489 * (_loc4_ - 1) / _loc4_ + Number(param1) / _loc4_;
         }
         if(this.var_2594 && param3 - this.var_1649 >= this.var_2593)
         {
            this.var_784 = 0;
            if(this.var_1855 < this.var_2592)
            {
               param2.track("performance","averageFramerate",this.frameRate);
               ++this.var_1855;
               this.var_1649 = param3;
            }
         }
      }
      
      public function dispose() : void
      {
      }
   }
}
