package com.sulake.habbo.communication.messages.parser.room.furniture
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class RequestSpamWallPostItMessageParser implements IMessageParser
   {
       
      
      private var var_1804:int;
      
      private var var_469:String;
      
      public function RequestSpamWallPostItMessageParser()
      {
         super();
      }
      
      public function get itemId() : int
      {
         return this.var_1804;
      }
      
      public function get location() : String
      {
         return this.var_469;
      }
      
      public function flush() : Boolean
      {
         this.var_1804 = -1;
         this.var_469 = "";
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         this.var_1804 = param1.readInteger();
         this.var_469 = param1.readString();
         return true;
      }
   }
}
