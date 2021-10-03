package com.sulake.habbo.communication.messages.parser.marketplace
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class MarketplaceConfigurationParser implements IMessageParser
   {
       
      
      private var var_1396:Boolean;
      
      private var var_2243:int;
      
      private var var_1681:int;
      
      private var var_1682:int;
      
      private var var_2242:int;
      
      private var var_2248:int;
      
      private var var_2246:int;
      
      private var var_2244:int;
      
      public function MarketplaceConfigurationParser()
      {
         super();
      }
      
      public function get isEnabled() : Boolean
      {
         return this.var_1396;
      }
      
      public function get commission() : int
      {
         return this.var_2243;
      }
      
      public function get tokenBatchPrice() : int
      {
         return this.var_1681;
      }
      
      public function get tokenBatchSize() : int
      {
         return this.var_1682;
      }
      
      public function get offerMinPrice() : int
      {
         return this.var_2248;
      }
      
      public function get offerMaxPrice() : int
      {
         return this.var_2242;
      }
      
      public function get expirationHours() : int
      {
         return this.var_2246;
      }
      
      public function get averagePricePeriod() : int
      {
         return this.var_2244;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1396 = param1.readBoolean();
         this.var_2243 = param1.readInteger();
         this.var_1681 = param1.readInteger();
         this.var_1682 = param1.readInteger();
         this.var_2248 = param1.readInteger();
         this.var_2242 = param1.readInteger();
         this.var_2246 = param1.readInteger();
         this.var_2244 = param1.readInteger();
         return true;
      }
   }
}
