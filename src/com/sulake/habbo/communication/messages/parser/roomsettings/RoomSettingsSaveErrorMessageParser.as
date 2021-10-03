package com.sulake.habbo.communication.messages.parser.roomsettings
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class RoomSettingsSaveErrorMessageParser implements IMessageParser
   {
      
      public static const const_2115:int = 1;
      
      public static const const_2014:int = 2;
      
      public static const const_2036:int = 3;
      
      public static const const_1992:int = 4;
      
      public static const const_1887:int = 5;
      
      public static const const_2060:int = 6;
      
      public static const const_1628:int = 7;
      
      public static const const_1895:int = 8;
      
      public static const const_2027:int = 9;
      
      public static const const_1647:int = 10;
      
      public static const const_1852:int = 11;
      
      public static const const_1702:int = 12;
       
      
      private var _roomId:int;
      
      private var var_1706:int;
      
      private var var_600:String;
      
      public function RoomSettingsSaveErrorMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this._roomId = param1.readInteger();
         this.var_1706 = param1.readInteger();
         this.var_600 = param1.readString();
         return true;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get roomId() : int
      {
         return this._roomId;
      }
      
      public function get errorCode() : int
      {
         return this.var_1706;
      }
      
      public function get info() : String
      {
         return this.var_600;
      }
   }
}
