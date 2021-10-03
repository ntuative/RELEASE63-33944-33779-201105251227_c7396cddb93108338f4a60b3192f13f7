package com.sulake.habbo.communication.messages.parser.room.furniture
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class OpenPetPackageRequestedMessageParser implements IMessageParser
   {
       
      
      private var var_220:int = -1;
      
      private var var_1325:int = -1;
      
      private var var_1930:int = -1;
      
      private var _color:String = "";
      
      public function OpenPetPackageRequestedMessageParser()
      {
         super();
      }
      
      public function get objectId() : int
      {
         return this.var_220;
      }
      
      public function get petType() : int
      {
         return this.var_1325;
      }
      
      public function get breed() : int
      {
         return this.var_1930;
      }
      
      public function get color() : String
      {
         return this._color;
      }
      
      public function flush() : Boolean
      {
         this.var_220 = -1;
         this.var_1325 = -1;
         this.var_1930 = -1;
         this._color = "";
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         this.var_220 = param1.readInteger();
         this.var_1325 = param1.readInteger();
         this.var_1930 = param1.readInteger();
         this._color = param1.readString();
         return true;
      }
   }
}
