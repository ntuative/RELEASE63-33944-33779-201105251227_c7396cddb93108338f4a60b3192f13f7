package com.sulake.habbo.room.messages
{
   public class RoomObjectAvatarFigureUpdateMessage extends RoomObjectUpdateStateMessage
   {
       
      
      private var var_583:String;
      
      private var var_2384:String;
      
      private var var_902:String;
      
      public function RoomObjectAvatarFigureUpdateMessage(param1:String, param2:String = null, param3:String = null)
      {
         super();
         this.var_583 = param1;
         this.var_902 = param2;
         this.var_2384 = param3;
      }
      
      public function get figure() : String
      {
         return this.var_583;
      }
      
      public function get race() : String
      {
         return this.var_2384;
      }
      
      public function get gender() : String
      {
         return this.var_902;
      }
   }
}
