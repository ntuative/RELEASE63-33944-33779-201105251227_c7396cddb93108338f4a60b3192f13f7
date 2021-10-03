package com.sulake.habbo.communication.messages.incoming.inventory.trading
{
   public class ItemDataStructure
   {
       
      
      private var var_2602:int;
      
      private var var_1512:String;
      
      private var var_2772:int;
      
      private var var_2770:int;
      
      private var _category:int;
      
      private var var_2159:String;
      
      private var var_1404:int;
      
      private var var_2766:int;
      
      private var var_2769:int;
      
      private var var_2767:int;
      
      private var var_2768:int;
      
      private var var_2771:Boolean;
      
      private var var_3003:int;
      
      public function ItemDataStructure(param1:int, param2:String, param3:int, param4:int, param5:int, param6:String, param7:int, param8:int, param9:int, param10:int, param11:int, param12:Boolean)
      {
         super();
         this.var_2602 = param1;
         this.var_1512 = param2;
         this.var_2772 = param3;
         this.var_2770 = param4;
         this._category = param5;
         this.var_2159 = param6;
         this.var_1404 = param7;
         this.var_2766 = param8;
         this.var_2769 = param9;
         this.var_2767 = param10;
         this.var_2768 = param11;
         this.var_2771 = param12;
      }
      
      public function get itemID() : int
      {
         return this.var_2602;
      }
      
      public function get itemType() : String
      {
         return this.var_1512;
      }
      
      public function get roomItemID() : int
      {
         return this.var_2772;
      }
      
      public function get itemTypeID() : int
      {
         return this.var_2770;
      }
      
      public function get category() : int
      {
         return this._category;
      }
      
      public function get stuffData() : String
      {
         return this.var_2159;
      }
      
      public function get extra() : int
      {
         return this.var_1404;
      }
      
      public function get timeToExpiration() : int
      {
         return this.var_2766;
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
      
      public function get groupable() : Boolean
      {
         return this.var_2771;
      }
      
      public function get songID() : int
      {
         return this.var_1404;
      }
   }
}
