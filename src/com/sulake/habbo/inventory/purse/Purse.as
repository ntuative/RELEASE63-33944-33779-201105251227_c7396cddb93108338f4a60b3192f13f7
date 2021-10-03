package com.sulake.habbo.inventory.purse
{
   public class Purse
   {
       
      
      private var var_2065:int = 0;
      
      private var var_2066:int = 0;
      
      private var var_2746:int = 0;
      
      private var var_2747:Boolean = false;
      
      private var var_2314:Boolean = false;
      
      public function Purse()
      {
         super();
      }
      
      public function set clubDays(param1:int) : void
      {
         this.var_2065 = Math.max(0,param1);
      }
      
      public function set clubPeriods(param1:int) : void
      {
         this.var_2066 = Math.max(0,param1);
      }
      
      public function set clubPastPeriods(param1:int) : void
      {
         this.var_2746 = Math.max(0,param1);
      }
      
      public function set clubHasEverBeenMember(param1:Boolean) : void
      {
         this.var_2747 = param1;
      }
      
      public function set isVIP(param1:Boolean) : void
      {
         this.var_2314 = param1;
      }
      
      public function get clubDays() : int
      {
         return this.var_2065;
      }
      
      public function get clubPeriods() : int
      {
         return this.var_2066;
      }
      
      public function get clubPastPeriods() : int
      {
         return this.var_2746;
      }
      
      public function get clubHasEverBeenMember() : Boolean
      {
         return this.var_2747;
      }
      
      public function get isVIP() : Boolean
      {
         return this.var_2314;
      }
   }
}
