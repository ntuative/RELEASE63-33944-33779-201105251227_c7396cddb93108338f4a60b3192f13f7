package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class FriendRequestData
   {
       
      
      private var var_1122:int;
      
      private var var_2638:String;
      
      private var var_2639:int;
      
      public function FriendRequestData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1122 = param1.readInteger();
         this.var_2638 = param1.readString();
         this.var_2639 = int(param1.readString());
      }
      
      public function get requestId() : int
      {
         return this.var_1122;
      }
      
      public function get requesterName() : String
      {
         return this.var_2638;
      }
      
      public function get requesterUserId() : int
      {
         return this.var_2639;
      }
   }
}
