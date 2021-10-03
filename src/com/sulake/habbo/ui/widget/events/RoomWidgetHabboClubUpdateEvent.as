package com.sulake.habbo.ui.widget.events
{
   public class RoomWidgetHabboClubUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_256:String = "RWBIUE_HABBO_CLUB";
       
      
      private var var_2526:int = 0;
      
      private var var_2523:int = 0;
      
      private var var_2524:int = 0;
      
      private var var_2525:Boolean = false;
      
      private var var_2522:int;
      
      public function RoomWidgetHabboClubUpdateEvent(param1:int, param2:int, param3:int, param4:Boolean, param5:int, param6:Boolean = false, param7:Boolean = false)
      {
         super(const_256,param6,param7);
         this.var_2526 = param1;
         this.var_2523 = param2;
         this.var_2524 = param3;
         this.var_2525 = param4;
         this.var_2522 = param5;
      }
      
      public function get daysLeft() : int
      {
         return this.var_2526;
      }
      
      public function get periodsLeft() : int
      {
         return this.var_2523;
      }
      
      public function get pastPeriods() : int
      {
         return this.var_2524;
      }
      
      public function get allowClubDances() : Boolean
      {
         return this.var_2525;
      }
      
      public function get clubLevel() : int
      {
         return this.var_2522;
      }
   }
}
