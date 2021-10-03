package com.sulake.habbo.communication.messages.parser.room.furniture
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class ViralFurniStatusMessageParser implements IMessageParser
   {
       
      
      private var var_184:String;
      
      private var var_220:int;
      
      private var _roomId:int = 0;
      
      private var _roomCategory:int = 0;
      
      private var var_1497:int = 0;
      
      private var var_407:int;
      
      private var _shareId:String;
      
      private var var_2465:String;
      
      public function ViralFurniStatusMessageParser()
      {
         super();
      }
      
      public function get campaignID() : String
      {
         return this.var_184;
      }
      
      public function get objectId() : int
      {
         return this.var_220;
      }
      
      public function get roomId() : int
      {
         return this._roomId;
      }
      
      public function get roomCategory() : int
      {
         return this._roomCategory;
      }
      
      public function get itemCategory() : int
      {
         return this.var_1497;
      }
      
      public function get shareId() : String
      {
         return this._shareId;
      }
      
      public function get status() : int
      {
         return this.var_407;
      }
      
      public function get firstClickUserName() : String
      {
         return this.var_2465;
      }
      
      public function flush() : Boolean
      {
         this._roomId = 0;
         this._roomCategory = 0;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_184 = param1.readString();
         this.var_220 = param1.readInteger();
         this.var_407 = param1.readInteger();
         this._shareId = param1.readString();
         this.var_2465 = param1.readString();
         this.var_1497 = param1.readInteger();
         return true;
      }
   }
}
