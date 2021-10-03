package com.sulake.habbo.inventory.items
{
   public class FloorItem implements IItem
   {
       
      
      protected var _id:int;
      
      protected var _ref:int;
      
      protected var _category:int;
      
      protected var _type:int;
      
      protected var var_2159:String;
      
      protected var var_1404:Number;
      
      protected var var_2934:Boolean;
      
      protected var var_2933:Boolean;
      
      protected var var_2771:Boolean;
      
      protected var var_2411:Boolean;
      
      protected var var_2936:int;
      
      protected var var_2769:int;
      
      protected var var_2767:int;
      
      protected var var_2768:int;
      
      protected var var_1669:String;
      
      protected var var_1809:int;
      
      protected var var_909:Boolean;
      
      public function FloorItem(param1:int, param2:int, param3:int, param4:int, param5:Boolean, param6:Boolean, param7:Boolean, param8:Boolean, param9:String, param10:Number, param11:int, param12:int, param13:int, param14:int, param15:String, param16:int)
      {
         super();
         this._id = param1;
         this._type = param2;
         this._ref = param3;
         this._category = param4;
         this.var_2771 = param5;
         this.var_2933 = param6;
         this.var_2934 = param7;
         this.var_2411 = param8;
         this.var_2159 = param9;
         this.var_1404 = param10;
         this.var_2936 = param11;
         this.var_2769 = param12;
         this.var_2767 = param13;
         this.var_2768 = param14;
         this.var_1669 = param15;
         this.var_1809 = param16;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get ref() : int
      {
         return this._ref;
      }
      
      public function get category() : int
      {
         return this._category;
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get stuffData() : String
      {
         return this.var_2159;
      }
      
      public function get extra() : Number
      {
         return this.var_1404;
      }
      
      public function get recyclable() : Boolean
      {
         return this.var_2934;
      }
      
      public function get tradeable() : Boolean
      {
         return this.var_2933;
      }
      
      public function get groupable() : Boolean
      {
         return this.var_2771;
      }
      
      public function get sellable() : Boolean
      {
         return this.var_2411;
      }
      
      public function get expires() : int
      {
         return this.var_2936;
      }
      
      public function get creationDay() : int
      {
         return this.var_2769;
      }
      
      public function get creationMonth() : int
      {
         return this.var_2767;
      }
      
      public function get creationYear() : int
      {
         return this.var_2768;
      }
      
      public function get slotId() : String
      {
         return this.var_1669;
      }
      
      public function get songId() : int
      {
         return this.var_1809;
      }
      
      public function set locked(param1:Boolean) : void
      {
         this.var_909 = param1;
      }
      
      public function get locked() : Boolean
      {
         return this.var_909;
      }
   }
}
