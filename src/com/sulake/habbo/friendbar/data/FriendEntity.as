package com.sulake.habbo.friendbar.data
{
   public class FriendEntity implements IFriendEntity
   {
       
      
      private var _id:int;
      
      private var _name:String;
      
      private var var_902:int;
      
      private var var_743:Boolean;
      
      private var var_2083:Boolean;
      
      private var var_583:String;
      
      private var var_1405:int;
      
      private var var_1860:String;
      
      private var var_1768:String;
      
      private var var_1767:String;
      
      public function FriendEntity(param1:int, param2:String, param3:String, param4:String, param5:int, param6:Boolean, param7:Boolean, param8:String, param9:int, param10:String)
      {
         super();
         this._id = param1;
         this._name = param2;
         this.var_1767 = param3;
         this.var_1860 = param4;
         this.var_902 = param5;
         this.var_743 = param6;
         this.var_2083 = param7;
         this.var_583 = param8;
         this.var_1405 = param9;
         this.var_1768 = param10;
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
      
      public function get allowFollow() : Boolean
      {
         return this.var_2083;
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
      
      public function set name(param1:String) : void
      {
         this._name = param1;
      }
      
      public function set gender(param1:int) : void
      {
         this.var_902 = param1;
      }
      
      public function set online(param1:Boolean) : void
      {
         this.var_743 = param1;
      }
      
      public function set allowFollow(param1:Boolean) : void
      {
         this.var_2083 = param1;
      }
      
      public function set figure(param1:String) : void
      {
         this.var_583 = param1;
      }
      
      public function set categoryId(param1:int) : void
      {
         this.var_1405 = param1;
      }
      
      public function set motto(param1:String) : void
      {
         this.var_1860 = param1;
      }
      
      public function set lastAccess(param1:String) : void
      {
         this.var_1768 = param1;
      }
      
      public function set realName(param1:String) : void
      {
         this.var_1767 = param1;
      }
   }
}
