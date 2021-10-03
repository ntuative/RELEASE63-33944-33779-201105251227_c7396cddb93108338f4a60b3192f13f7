package com.sulake.habbo.communication.messages.parser.availability
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class AvailabilityTimeMessageParser implements IMessageParser
   {
       
      
      private var var_1597:Boolean;
      
      private var var_1777:int;
      
      public function AvailabilityTimeMessageParser()
      {
         super();
      }
      
      public function get isOpen() : Boolean
      {
         return this.var_1597;
      }
      
      public function get minutesUntilChange() : int
      {
         return this.var_1777;
      }
      
      public function flush() : Boolean
      {
         this.var_1597 = false;
         this.var_1777 = 0;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1597 = param1.readInteger() > 0;
         this.var_1777 = param1.readInteger();
         return true;
      }
   }
}
