package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ClubOfferData
   {
       
      
      private var var_1283:int;
      
      private var var_1729:String;
      
      private var var_1819:int;
      
      private var _upgrade:Boolean;
      
      private var var_2350:Boolean;
      
      private var var_2348:int;
      
      private var var_2349:int;
      
      private var var_2345:int;
      
      private var var_2347:int;
      
      private var var_2346:int;
      
      public function ClubOfferData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1283 = param1.readInteger();
         this.var_1729 = param1.readString();
         this.var_1819 = param1.readInteger();
         this._upgrade = param1.readBoolean();
         this.var_2350 = param1.readBoolean();
         this.var_2348 = param1.readInteger();
         this.var_2349 = param1.readInteger();
         this.var_2345 = param1.readInteger();
         this.var_2347 = param1.readInteger();
         this.var_2346 = param1.readInteger();
      }
      
      public function get offerId() : int
      {
         return this.var_1283;
      }
      
      public function get productCode() : String
      {
         return this.var_1729;
      }
      
      public function get price() : int
      {
         return this.var_1819;
      }
      
      public function get upgrade() : Boolean
      {
         return this._upgrade;
      }
      
      public function get vip() : Boolean
      {
         return this.var_2350;
      }
      
      public function get periods() : int
      {
         return this.var_2348;
      }
      
      public function get daysLeftAfterPurchase() : int
      {
         return this.var_2349;
      }
      
      public function get year() : int
      {
         return this.var_2345;
      }
      
      public function get month() : int
      {
         return this.var_2347;
      }
      
      public function get day() : int
      {
         return this.var_2346;
      }
   }
}
