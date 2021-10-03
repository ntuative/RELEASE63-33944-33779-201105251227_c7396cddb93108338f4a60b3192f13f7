package com.sulake.habbo.catalog.purse
{
   import flash.utils.Dictionary;
   
   public class Purse implements IPurse
   {
       
      
      private var var_1678:int = 0;
      
      private var var_1596:Dictionary;
      
      private var var_2065:int = 0;
      
      private var var_2066:int = 0;
      
      private var var_2314:Boolean = false;
      
      private var var_2308:int = 0;
      
      private var var_2311:int = 0;
      
      public function Purse()
      {
         this.var_1596 = new Dictionary();
         super();
      }
      
      public function get credits() : int
      {
         return this.var_1678;
      }
      
      public function set credits(param1:int) : void
      {
         this.var_1678 = param1;
      }
      
      public function get clubDays() : int
      {
         return this.var_2065;
      }
      
      public function set clubDays(param1:int) : void
      {
         this.var_2065 = param1;
      }
      
      public function get clubPeriods() : int
      {
         return this.var_2066;
      }
      
      public function set clubPeriods(param1:int) : void
      {
         this.var_2066 = param1;
      }
      
      public function get hasClubLeft() : Boolean
      {
         return this.var_2065 > 0 || this.var_2066 > 0;
      }
      
      public function get isVIP() : Boolean
      {
         return this.var_2314;
      }
      
      public function set isVIP(param1:Boolean) : void
      {
         this.var_2314 = param1;
      }
      
      public function get pastClubDays() : int
      {
         return this.var_2308;
      }
      
      public function set pastClubDays(param1:int) : void
      {
         this.var_2308 = param1;
      }
      
      public function get pastVipDays() : int
      {
         return this.var_2311;
      }
      
      public function set pastVipDays(param1:int) : void
      {
         this.var_2311 = param1;
      }
      
      public function get activityPoints() : Dictionary
      {
         return this.var_1596;
      }
      
      public function set activityPoints(param1:Dictionary) : void
      {
         this.var_1596 = param1;
      }
      
      public function getActivityPointsForType(param1:int) : int
      {
         return this.var_1596[param1];
      }
   }
}
