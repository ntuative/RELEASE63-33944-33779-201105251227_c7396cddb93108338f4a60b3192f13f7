package com.sulake.habbo.communication.messages.parser.handshake
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class UserObjectMessageParser implements IMessageParser
   {
       
      
      private var _id:int;
      
      private var _name:String;
      
      private var var_583:String;
      
      private var var_932:String;
      
      private var var_2918:String;
      
      private var var_1767:String;
      
      private var var_2922:int;
      
      private var var_2921:String;
      
      private var var_2919:int;
      
      private var var_2920:int;
      
      private var var_2675:int;
      
      private var var_1320:int;
      
      private var _petRespectLeft:int;
      
      private var var_2847:int;
      
      public function UserObjectMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this._id = int(param1.readString());
         this._name = param1.readString();
         this.var_583 = param1.readString();
         this.var_932 = param1.readString();
         this.var_2918 = param1.readString();
         this.var_1767 = param1.readString();
         this.var_2922 = param1.readInteger();
         this.var_2921 = param1.readString();
         this.var_2919 = param1.readInteger();
         this.var_2920 = param1.readInteger();
         this.var_2675 = param1.readInteger();
         this.var_1320 = param1.readInteger();
         this._petRespectLeft = param1.readInteger();
         this.var_2847 = param1.readInteger();
         return true;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get figure() : String
      {
         return this.var_583;
      }
      
      public function get sex() : String
      {
         return this.var_932;
      }
      
      public function get customData() : String
      {
         return this.var_2918;
      }
      
      public function get realName() : String
      {
         return this.var_1767;
      }
      
      public function get tickets() : int
      {
         return this.var_2922;
      }
      
      public function get poolFigure() : String
      {
         return this.var_2921;
      }
      
      public function get photoFilm() : int
      {
         return this.var_2919;
      }
      
      public function get directMail() : int
      {
         return this.var_2920;
      }
      
      public function get respectTotal() : int
      {
         return this.var_2675;
      }
      
      public function get respectLeft() : int
      {
         return this.var_1320;
      }
      
      public function get petRespectLeft() : int
      {
         return this._petRespectLeft;
      }
      
      public function get identityId() : int
      {
         return this.var_2847;
      }
   }
}
