package com.sulake.habbo.avatar.structure.parts
{
   public class PartDefinition
   {
       
      
      private var var_2496:String;
      
      private var var_1810:String;
      
      private var var_2495:String;
      
      private var var_1812:Boolean;
      
      private var var_1811:int = -1;
      
      public function PartDefinition(param1:XML)
      {
         super();
         this.var_2496 = String(param1["set-type"]);
         this.var_1810 = String(param1["flipped-set-type"]);
         this.var_2495 = String(param1["remove-set-type"]);
         this.var_1812 = false;
      }
      
      public function hasStaticId() : Boolean
      {
         return this.var_1811 >= 0;
      }
      
      public function get staticId() : int
      {
         return this.var_1811;
      }
      
      public function set staticId(param1:int) : void
      {
         this.var_1811 = param1;
      }
      
      public function get setType() : String
      {
         return this.var_2496;
      }
      
      public function get flippedSetType() : String
      {
         return this.var_1810;
      }
      
      public function get removeSetType() : String
      {
         return this.var_2495;
      }
      
      public function get appendToFigure() : Boolean
      {
         return this.var_1812;
      }
      
      public function set appendToFigure(param1:Boolean) : void
      {
         this.var_1812 = param1;
      }
      
      public function set flippedSetType(param1:String) : void
      {
         this.var_1810 = param1;
      }
   }
}
