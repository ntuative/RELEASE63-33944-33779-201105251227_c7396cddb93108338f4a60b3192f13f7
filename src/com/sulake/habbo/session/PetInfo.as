package com.sulake.habbo.session
{
   public class PetInfo implements IPetInfo
   {
       
      
      private var var_1714:int;
      
      private var var_1150:int;
      
      private var var_2756:int;
      
      private var var_2405:int;
      
      private var var_2755:int;
      
      private var _energy:int;
      
      private var var_2758:int;
      
      private var _nutrition:int;
      
      private var var_2759:int;
      
      private var var_2230:int;
      
      private var _ownerName:String;
      
      private var var_2409:int;
      
      private var var_522:int;
      
      public function PetInfo()
      {
         super();
      }
      
      public function get petId() : int
      {
         return this.var_1714;
      }
      
      public function get level() : int
      {
         return this.var_1150;
      }
      
      public function get levelMax() : int
      {
         return this.var_2756;
      }
      
      public function get experience() : int
      {
         return this.var_2405;
      }
      
      public function get experienceMax() : int
      {
         return this.var_2755;
      }
      
      public function get energy() : int
      {
         return this._energy;
      }
      
      public function get energyMax() : int
      {
         return this.var_2758;
      }
      
      public function get nutrition() : int
      {
         return this._nutrition;
      }
      
      public function get nutritionMax() : int
      {
         return this.var_2759;
      }
      
      public function get ownerId() : int
      {
         return this.var_2230;
      }
      
      public function get ownerName() : String
      {
         return this._ownerName;
      }
      
      public function get respect() : int
      {
         return this.var_2409;
      }
      
      public function get age() : int
      {
         return this.var_522;
      }
      
      public function set petId(param1:int) : void
      {
         this.var_1714 = param1;
      }
      
      public function set level(param1:int) : void
      {
         this.var_1150 = param1;
      }
      
      public function set levelMax(param1:int) : void
      {
         this.var_2756 = param1;
      }
      
      public function set experience(param1:int) : void
      {
         this.var_2405 = param1;
      }
      
      public function set experienceMax(param1:int) : void
      {
         this.var_2755 = param1;
      }
      
      public function set energy(param1:int) : void
      {
         this._energy = param1;
      }
      
      public function set energyMax(param1:int) : void
      {
         this.var_2758 = param1;
      }
      
      public function set nutrition(param1:int) : void
      {
         this._nutrition = param1;
      }
      
      public function set nutritionMax(param1:int) : void
      {
         this.var_2759 = param1;
      }
      
      public function set ownerId(param1:int) : void
      {
         this.var_2230 = param1;
      }
      
      public function set ownerName(param1:String) : void
      {
         this._ownerName = param1;
      }
      
      public function set respect(param1:int) : void
      {
         this.var_2409 = param1;
      }
      
      public function set age(param1:int) : void
      {
         this.var_522 = param1;
      }
   }
}
