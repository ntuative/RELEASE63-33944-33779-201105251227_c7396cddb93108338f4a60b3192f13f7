package com.sulake.habbo.communication.messages.parser.room.furniture
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class OpenPetPackageResultMessageParser implements IMessageParser
   {
       
      
      private var var_220:int = 0;
      
      private var var_1787:int = 0;
      
      private var var_1786:String = null;
      
      public function OpenPetPackageResultMessageParser()
      {
         super();
      }
      
      public function get objectId() : int
      {
         return this.var_220;
      }
      
      public function get nameValidationStatus() : int
      {
         return this.var_1787;
      }
      
      public function get nameValidationInfo() : String
      {
         return this.var_1786;
      }
      
      public function flush() : Boolean
      {
         this.var_220 = 0;
         this.var_1787 = 0;
         this.var_1786 = null;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         this.var_220 = param1.readInteger();
         this.var_1787 = param1.readInteger();
         this.var_1786 = param1.readString();
         return true;
      }
   }
}
