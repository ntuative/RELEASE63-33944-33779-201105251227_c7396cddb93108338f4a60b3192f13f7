package com.sulake.habbo.communication.messages.parser.help
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class TutorialStatusMessageParser implements IMessageParser
   {
       
      
      private var var_1252:Boolean;
      
      private var var_1251:Boolean;
      
      private var var_1541:Boolean;
      
      public function TutorialStatusMessageParser()
      {
         super();
      }
      
      public function get hasChangedLooks() : Boolean
      {
         return this.var_1252;
      }
      
      public function get hasChangedName() : Boolean
      {
         return this.var_1251;
      }
      
      public function get hasCalledGuideBot() : Boolean
      {
         return this.var_1541;
      }
      
      public function flush() : Boolean
      {
         this.var_1252 = false;
         this.var_1251 = false;
         this.var_1541 = false;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1252 = param1.readBoolean();
         this.var_1251 = param1.readBoolean();
         this.var_1541 = param1.readBoolean();
         return true;
      }
   }
}
