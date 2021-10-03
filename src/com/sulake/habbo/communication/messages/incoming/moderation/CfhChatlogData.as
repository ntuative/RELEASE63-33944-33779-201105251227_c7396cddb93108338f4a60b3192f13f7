package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CfhChatlogData
   {
       
      
      private var var_1684:int;
      
      private var var_2259:int;
      
      private var var_1435:int;
      
      private var var_2258:int;
      
      private var var_128:RoomChatlogData;
      
      public function CfhChatlogData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1684 = param1.readInteger();
         this.var_2259 = param1.readInteger();
         this.var_1435 = param1.readInteger();
         this.var_2258 = param1.readInteger();
         this.var_128 = new RoomChatlogData(param1);
         Logger.log("READ CFHCHATLOGDATA: callId: " + this.var_1684);
      }
      
      public function get callId() : int
      {
         return this.var_1684;
      }
      
      public function get callerUserId() : int
      {
         return this.var_2259;
      }
      
      public function get reportedUserId() : int
      {
         return this.var_1435;
      }
      
      public function get chatRecordId() : int
      {
         return this.var_2258;
      }
      
      public function get room() : RoomChatlogData
      {
         return this.var_128;
      }
   }
}
