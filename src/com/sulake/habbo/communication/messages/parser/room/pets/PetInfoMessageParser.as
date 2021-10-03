package com.sulake.habbo.communication.messages.parser.room.pets
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetInfoMessageParser implements IMessageParser
   {
       
      
      private var var_1714:int;
      
      private var _name:String;
      
      private var var_1150:int;
      
      private var var_2648:int;
      
      private var var_2405:int;
      
      private var _energy:int;
      
      private var _nutrition:int;
      
      private var var_583:String;
      
      private var var_2649:int;
      
      private var var_2650:int;
      
      private var var_2651:int;
      
      private var var_2409:int;
      
      private var var_2230:int;
      
      private var _ownerName:String;
      
      private var var_522:int;
      
      public function PetInfoMessageParser()
      {
         super();
      }
      
      public function get petId() : int
      {
         return this.var_1714;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get level() : int
      {
         return this.var_1150;
      }
      
      public function get maxLevel() : int
      {
         return this.var_2648;
      }
      
      public function get experience() : int
      {
         return this.var_2405;
      }
      
      public function get energy() : int
      {
         return this._energy;
      }
      
      public function get nutrition() : int
      {
         return this._nutrition;
      }
      
      public function get figure() : String
      {
         return this.var_583;
      }
      
      public function get experienceRequiredToLevel() : int
      {
         return this.var_2649;
      }
      
      public function get maxEnergy() : int
      {
         return this.var_2650;
      }
      
      public function get maxNutrition() : int
      {
         return this.var_2651;
      }
      
      public function get respect() : int
      {
         return this.var_2409;
      }
      
      public function get ownerId() : int
      {
         return this.var_2230;
      }
      
      public function get ownerName() : String
      {
         return this._ownerName;
      }
      
      public function get age() : int
      {
         return this.var_522;
      }
      
      public function flush() : Boolean
      {
         this.var_1714 = -1;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         this.var_1714 = param1.readInteger();
         this._name = param1.readString();
         this.var_1150 = param1.readInteger();
         this.var_2648 = param1.readInteger();
         this.var_2405 = param1.readInteger();
         this.var_2649 = param1.readInteger();
         this._energy = param1.readInteger();
         this.var_2650 = param1.readInteger();
         this._nutrition = param1.readInteger();
         this.var_2651 = param1.readInteger();
         this.var_583 = param1.readString();
         this.var_2409 = param1.readInteger();
         this.var_2230 = param1.readInteger();
         this.var_522 = param1.readInteger();
         this._ownerName = param1.readString();
         return true;
      }
   }
}
