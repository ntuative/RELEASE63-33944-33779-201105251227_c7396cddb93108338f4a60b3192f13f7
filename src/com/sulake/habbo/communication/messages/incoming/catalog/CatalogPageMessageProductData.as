package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CatalogPageMessageProductData
   {
      
      public static const const_65:String = "i";
      
      public static const const_78:String = "s";
      
      public static const const_193:String = "e";
       
      
      private var var_1571:String;
      
      private var var_2299:int;
      
      private var var_1289:String;
      
      private var var_1572:int;
      
      private var var_2015:int;
      
      public function CatalogPageMessageProductData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1571 = param1.readString();
         this.var_2299 = param1.readInteger();
         this.var_1289 = param1.readString();
         this.var_1572 = param1.readInteger();
         this.var_2015 = param1.readInteger();
      }
      
      public function get productType() : String
      {
         return this.var_1571;
      }
      
      public function get furniClassId() : int
      {
         return this.var_2299;
      }
      
      public function get extraParam() : String
      {
         return this.var_1289;
      }
      
      public function get productCount() : int
      {
         return this.var_1572;
      }
      
      public function get expiration() : int
      {
         return this.var_2015;
      }
   }
}
