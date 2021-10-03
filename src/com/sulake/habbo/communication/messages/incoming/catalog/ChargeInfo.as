package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ChargeInfo
   {
       
      
      private var var_2195:int;
      
      private var var_2753:int;
      
      private var var_1103:int;
      
      private var var_1102:int;
      
      private var var_1643:int;
      
      private var var_2754:int;
      
      public function ChargeInfo(param1:IMessageDataWrapper)
      {
         super();
         this.var_2195 = param1.readInteger();
         this.var_2753 = param1.readInteger();
         this.var_1103 = param1.readInteger();
         this.var_1102 = param1.readInteger();
         this.var_1643 = param1.readInteger();
         this.var_2754 = param1.readInteger();
      }
      
      public function get stuffId() : int
      {
         return this.var_2195;
      }
      
      public function get charges() : int
      {
         return this.var_2753;
      }
      
      public function get priceInCredits() : int
      {
         return this.var_1103;
      }
      
      public function get priceInActivityPoints() : int
      {
         return this.var_1102;
      }
      
      public function get chargePatchSize() : int
      {
         return this.var_2754;
      }
      
      public function get activityPointType() : int
      {
         return this.var_1643;
      }
   }
}
