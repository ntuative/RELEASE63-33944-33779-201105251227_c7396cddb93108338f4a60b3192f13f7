package com.sulake.habbo.communication.messages.parser.room.furniture
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class WelcomeGiftStatusParser implements IMessageParser
   {
       
      
      private var var_1419:String;
      
      private var var_1134:Boolean;
      
      private var var_2363:Boolean;
      
      private var _furniId:int;
      
      private var var_2362:Boolean;
      
      public function WelcomeGiftStatusParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1419 = param1.readString();
         this.var_1134 = param1.readBoolean();
         this.var_2363 = param1.readBoolean();
         this._furniId = param1.readInteger();
         this.var_2362 = param1.readBoolean();
         return true;
      }
      
      public function get requestedByUser() : Boolean
      {
         return this.var_2362;
      }
      
      public function get email() : String
      {
         return this.var_1419;
      }
      
      public function get isVerified() : Boolean
      {
         return this.var_1134;
      }
      
      public function get allowChange() : Boolean
      {
         return this.var_2363;
      }
      
      public function get furniId() : int
      {
         return this._furniId;
      }
   }
}
