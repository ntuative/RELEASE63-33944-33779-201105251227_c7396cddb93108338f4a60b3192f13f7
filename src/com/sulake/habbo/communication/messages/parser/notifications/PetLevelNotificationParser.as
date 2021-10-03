package com.sulake.habbo.communication.messages.parser.notifications
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetLevelNotificationParser implements IMessageParser
   {
       
      
      private var var_1714:int;
      
      private var var_2668:String;
      
      private var var_1150:int;
      
      private var var_1325:int;
      
      private var var_1930:int;
      
      private var _color:String;
      
      public function PetLevelNotificationParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1714 = param1.readInteger();
         this.var_2668 = param1.readString();
         this.var_1150 = param1.readInteger();
         this.var_1325 = param1.readInteger();
         this.var_1930 = param1.readInteger();
         this._color = param1.readString();
         return true;
      }
      
      public function get petId() : int
      {
         return this.var_1714;
      }
      
      public function get petName() : String
      {
         return this.var_2668;
      }
      
      public function get level() : int
      {
         return this.var_1150;
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
   }
}
