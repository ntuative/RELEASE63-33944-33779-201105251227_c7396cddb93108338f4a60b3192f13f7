package com.sulake.habbo.ui.widget.events
{
   public class RoomWidgetUpdateEffectsUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_861:String = "RWUEUE_UPDATE_EFFECTS";
       
      
      private var var_271:Array;
      
      public function RoomWidgetUpdateEffectsUpdateEvent(param1:Array = null, param2:Boolean = false, param3:Boolean = false)
      {
         super(const_861,param2,param3);
         this.var_271 = param1;
      }
      
      public function get effects() : Array
      {
         return this.var_271;
      }
   }
}
