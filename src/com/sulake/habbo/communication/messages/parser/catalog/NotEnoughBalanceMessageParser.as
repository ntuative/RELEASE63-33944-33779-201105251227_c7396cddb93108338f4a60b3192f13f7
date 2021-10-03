package com.sulake.habbo.communication.messages.parser.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class NotEnoughBalanceMessageParser implements IMessageParser
   {
       
      
      private var var_2098:int = 0;
      
      private var var_2097:int = 0;
      
      private var var_1643:int = 0;
      
      public function NotEnoughBalanceMessageParser()
      {
         super();
      }
      
      public function get notEnoughCredits() : int
      {
         return this.var_2098;
      }
      
      public function get notEnoughActivityPoints() : int
      {
         return this.var_2097;
      }
      
      public function get activityPointType() : int
      {
         return this.var_1643;
      }
      
      public function flush() : Boolean
      {
         this.var_2098 = 0;
         this.var_2097 = 0;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_2098 = param1.readInteger();
         this.var_2097 = param1.readInteger();
         this.var_1643 = param1.readInteger();
         return true;
      }
   }
}
