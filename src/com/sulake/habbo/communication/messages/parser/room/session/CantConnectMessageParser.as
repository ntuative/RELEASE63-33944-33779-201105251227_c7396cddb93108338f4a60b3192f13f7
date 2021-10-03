package com.sulake.habbo.communication.messages.parser.room.session
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class CantConnectMessageParser implements IMessageParser
   {
      
      public static const const_1925:int = 1;
      
      public static const const_2070:int = 2;
      
      public static const const_1796:int = 3;
      
      public static const const_1747:int = 4;
       
      
      private var var_1400:int = 0;
      
      private var var_1401:String = "";
      
      public function CantConnectMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         this.var_1400 = 0;
         this.var_1401 = "";
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1400 = param1.readInteger();
         if(this.var_1400 == 3)
         {
            this.var_1401 = param1.readString();
         }
         else
         {
            this.var_1401 = "";
         }
         return true;
      }
      
      public function get reason() : int
      {
         return this.var_1400;
      }
      
      public function get parameter() : String
      {
         return this.var_1401;
      }
   }
}
