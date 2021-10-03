package com.sulake.habbo.ui.widget.events
{
   public class RoomWidgetRoomQueueUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_441:String = "RWRQUE_VISITOR_QUEUE_STATUS";
      
      public static const const_468:String = "RWRQUE_SPECTATOR_QUEUE_STATUS";
       
      
      private var var_1236:int;
      
      private var var_2423:Boolean;
      
      private var var_516:Boolean;
      
      private var var_1897:Boolean;
      
      public function RoomWidgetRoomQueueUpdateEvent(param1:String, param2:int, param3:Boolean, param4:Boolean, param5:Boolean, param6:Boolean = false, param7:Boolean = false)
      {
         super(param1,param6,param7);
         this.var_1236 = param2;
         this.var_2423 = param3;
         this.var_516 = param4;
         this.var_1897 = param5;
      }
      
      public function get position() : int
      {
         return this.var_1236;
      }
      
      public function get hasHabboClub() : Boolean
      {
         return this.var_2423;
      }
      
      public function get isActive() : Boolean
      {
         return this.var_516;
      }
      
      public function get isClubQueue() : Boolean
      {
         return this.var_1897;
      }
   }
}
