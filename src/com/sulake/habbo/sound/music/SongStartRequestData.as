package com.sulake.habbo.sound.music
{
   import flash.utils.getTimer;
   
   public class SongStartRequestData
   {
       
      
      private var var_1809:int;
      
      private var var_2102:Number;
      
      private var var_2906:Number;
      
      private var var_2904:int;
      
      private var var_2905:Number;
      
      private var var_2903:Number;
      
      public function SongStartRequestData(param1:int, param2:Number, param3:Number, param4:Number = 2.0, param5:Number = 1.0)
      {
         super();
         this.var_1809 = param1;
         this.var_2102 = param2;
         this.var_2906 = param3;
         this.var_2905 = param4;
         this.var_2903 = param5;
         this.var_2904 = getTimer();
      }
      
      public function get songId() : int
      {
         return this.var_1809;
      }
      
      public function get startPos() : Number
      {
         if(this.var_2102 < 0)
         {
            return 0;
         }
         return this.var_2102 + (getTimer() - this.var_2904) / 1000;
      }
      
      public function get playLength() : Number
      {
         return this.var_2906;
      }
      
      public function get fadeInSeconds() : Number
      {
         return this.var_2905;
      }
      
      public function get fadeOutSeconds() : Number
      {
         return this.var_2903;
      }
   }
}
