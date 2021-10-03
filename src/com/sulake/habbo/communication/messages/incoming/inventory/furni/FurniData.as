package com.sulake.habbo.communication.messages.incoming.inventory.furni
{
   public class FurniData
   {
       
      
      private var var_2418:int;
      
      private var var_1512:String;
      
      private var _objId:int;
      
      private var var_2037:int;
      
      private var _category:int;
      
      private var var_2159:String;
      
      private var var_2422:Boolean;
      
      private var var_2420:Boolean;
      
      private var var_2417:Boolean;
      
      private var var_2421:Boolean;
      
      private var var_2419:int;
      
      private var var_1404:int;
      
      private var var_1669:String = "";
      
      private var var_1809:int = -1;
      
      public function FurniData(param1:int, param2:String, param3:int, param4:int, param5:int, param6:String, param7:Boolean, param8:Boolean, param9:Boolean, param10:Boolean, param11:int)
      {
         super();
         this.var_2418 = param1;
         this.var_1512 = param2;
         this._objId = param3;
         this.var_2037 = param4;
         this._category = param5;
         this.var_2159 = param6;
         this.var_2422 = param7;
         this.var_2420 = param8;
         this.var_2417 = param9;
         this.var_2421 = param10;
         this.var_2419 = param11;
      }
      
      public function setExtraData(param1:String, param2:int) : void
      {
         this.var_1669 = param1;
         this.var_1404 = param2;
      }
      
      public function get stripId() : int
      {
         return this.var_2418;
      }
      
      public function get itemType() : String
      {
         return this.var_1512;
      }
      
      public function get objId() : int
      {
         return this._objId;
      }
      
      public function get classId() : int
      {
         return this.var_2037;
      }
      
      public function get category() : int
      {
         return this._category;
      }
      
      public function get stuffData() : String
      {
         return this.var_2159;
      }
      
      public function get isGroupable() : Boolean
      {
         return this.var_2422;
      }
      
      public function get isRecyclable() : Boolean
      {
         return this.var_2420;
      }
      
      public function get isTradeable() : Boolean
      {
         return this.var_2417;
      }
      
      public function get isSellable() : Boolean
      {
         return this.var_2421;
      }
      
      public function get expiryTime() : int
      {
         return this.var_2419;
      }
      
      public function get slotId() : String
      {
         return this.var_1669;
      }
      
      public function get songId() : int
      {
         return this.var_1809;
      }
      
      public function get extra() : int
      {
         return this.var_1404;
      }
   }
}
