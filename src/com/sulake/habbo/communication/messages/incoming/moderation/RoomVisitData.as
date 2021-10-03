package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class RoomVisitData
   {
       
      
      private var var_2088:Boolean;
      
      private var _roomId:int;
      
      private var var_894:String;
      
      private var var_2917:int;
      
      private var var_2916:int;
      
      public function RoomVisitData(param1:IMessageDataWrapper)
      {
         super();
         this.var_2088 = param1.readBoolean();
         this._roomId = param1.readInteger();
         this.var_894 = param1.readString();
         this.var_2917 = param1.readInteger();
         this.var_2916 = param1.readInteger();
      }
      
      public function get isPublic() : Boolean
      {
         return this.var_2088;
      }
      
      public function get roomId() : int
      {
         return this._roomId;
      }
      
      public function get roomName() : String
      {
         return this.var_894;
      }
      
      public function get enterHour() : int
      {
         return this.var_2917;
      }
      
      public function get enterMinute() : int
      {
         return this.var_2916;
      }
   }
}
