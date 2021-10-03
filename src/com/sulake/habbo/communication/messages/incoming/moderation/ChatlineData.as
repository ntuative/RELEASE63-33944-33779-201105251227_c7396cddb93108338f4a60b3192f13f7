package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ChatlineData
   {
       
      
      private var var_2206:int;
      
      private var var_2204:int;
      
      private var var_2207:int;
      
      private var var_2205:String;
      
      private var var_1936:String;
      
      public function ChatlineData(param1:IMessageDataWrapper)
      {
         super();
         this.var_2206 = param1.readInteger();
         this.var_2204 = param1.readInteger();
         this.var_2207 = param1.readInteger();
         this.var_2205 = param1.readString();
         this.var_1936 = param1.readString();
      }
      
      public function get hour() : int
      {
         return this.var_2206;
      }
      
      public function get minute() : int
      {
         return this.var_2204;
      }
      
      public function get chatterId() : int
      {
         return this.var_2207;
      }
      
      public function get chatterName() : String
      {
         return this.var_2205;
      }
      
      public function get msg() : String
      {
         return this.var_1936;
      }
   }
}
