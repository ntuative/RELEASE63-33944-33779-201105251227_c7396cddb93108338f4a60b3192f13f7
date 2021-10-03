package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class FriendData
   {
       
      
      private var _id:int;
      
      private var _name:String;
      
      private var var_902:int;
      
      private var var_743:Boolean;
      
      private var var_1861:Boolean;
      
      private var var_583:String;
      
      private var var_1405:int;
      
      private var var_1860:String;
      
      private var var_1768:String;
      
      private var var_1767:String;
      
      private var var_2461:String;
      
      public function FriendData(param1:IMessageDataWrapper)
      {
         super();
         this._id = param1.readInteger();
         this._name = param1.readString();
         this.var_902 = param1.readInteger();
         this.var_743 = param1.readBoolean();
         this.var_1861 = param1.readBoolean();
         this.var_583 = param1.readString();
         this.var_1405 = param1.readInteger();
         this.var_1860 = param1.readString();
         this.var_1768 = param1.readString();
         this.var_1767 = param1.readString();
         this.var_2461 = param1.readString();
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get gender() : int
      {
         return this.var_902;
      }
      
      public function get online() : Boolean
      {
         return this.var_743;
      }
      
      public function get followingAllowed() : Boolean
      {
         return this.var_1861;
      }
      
      public function get figure() : String
      {
         return this.var_583;
      }
      
      public function get categoryId() : int
      {
         return this.var_1405;
      }
      
      public function get motto() : String
      {
         return this.var_1860;
      }
      
      public function get lastAccess() : String
      {
         return this.var_1768;
      }
      
      public function get realName() : String
      {
         return this.var_1767;
      }
      
      public function get facebookId() : String
      {
         return this.var_2461;
      }
   }
}
