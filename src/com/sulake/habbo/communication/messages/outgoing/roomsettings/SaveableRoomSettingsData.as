package com.sulake.habbo.communication.messages.outgoing.roomsettings
{
   public class SaveableRoomSettingsData
   {
       
      
      private var _roomId:int;
      
      private var _name:String;
      
      private var var_1712:String;
      
      private var var_2442:int;
      
      private var _password:String;
      
      private var var_1405:int;
      
      private var var_2438:int;
      
      private var var_880:Array;
      
      private var var_2437:Array;
      
      private var var_2435:Boolean;
      
      private var var_2440:Boolean;
      
      private var var_2436:Boolean;
      
      private var var_2441:Boolean;
      
      private var var_2434:int;
      
      private var var_2439:int;
      
      public function SaveableRoomSettingsData()
      {
         super();
      }
      
      public function get allowPets() : Boolean
      {
         return this.var_2435;
      }
      
      public function set allowPets(param1:Boolean) : void
      {
         this.var_2435 = param1;
      }
      
      public function get allowFoodConsume() : Boolean
      {
         return this.var_2440;
      }
      
      public function set allowFoodConsume(param1:Boolean) : void
      {
         this.var_2440 = param1;
      }
      
      public function get allowWalkThrough() : Boolean
      {
         return this.var_2436;
      }
      
      public function set allowWalkThrough(param1:Boolean) : void
      {
         this.var_2436 = param1;
      }
      
      public function get hideWalls() : Boolean
      {
         return this.var_2441;
      }
      
      public function set hideWalls(param1:Boolean) : void
      {
         this.var_2441 = param1;
      }
      
      public function get wallThickness() : int
      {
         return this.var_2434;
      }
      
      public function set wallThickness(param1:int) : void
      {
         this.var_2434 = param1;
      }
      
      public function get floorThickness() : int
      {
         return this.var_2439;
      }
      
      public function set floorThickness(param1:int) : void
      {
         this.var_2439 = param1;
      }
      
      public function get roomId() : int
      {
         return this._roomId;
      }
      
      public function set roomId(param1:int) : void
      {
         this._roomId = param1;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function set name(param1:String) : void
      {
         this._name = param1;
      }
      
      public function get description() : String
      {
         return this.var_1712;
      }
      
      public function set description(param1:String) : void
      {
         this.var_1712 = param1;
      }
      
      public function get doorMode() : int
      {
         return this.var_2442;
      }
      
      public function set doorMode(param1:int) : void
      {
         this.var_2442 = param1;
      }
      
      public function get password() : String
      {
         return this._password;
      }
      
      public function set password(param1:String) : void
      {
         this._password = param1;
      }
      
      public function get categoryId() : int
      {
         return this.var_1405;
      }
      
      public function set categoryId(param1:int) : void
      {
         this.var_1405 = param1;
      }
      
      public function get maximumVisitors() : int
      {
         return this.var_2438;
      }
      
      public function set maximumVisitors(param1:int) : void
      {
         this.var_2438 = param1;
      }
      
      public function get tags() : Array
      {
         return this.var_880;
      }
      
      public function set tags(param1:Array) : void
      {
         this.var_880 = param1;
      }
      
      public function get controllers() : Array
      {
         return this.var_2437;
      }
      
      public function set controllers(param1:Array) : void
      {
         this.var_2437 = param1;
      }
   }
}
