package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class UserUpdateMessageData
   {
       
      
      private var _id:int = 0;
      
      private var _x:Number = 0;
      
      private var var_162:Number = 0;
      
      private var var_163:Number = 0;
      
      private var var_2647:Number = 0;
      
      private var var_2643:Number = 0;
      
      private var var_2645:Number = 0;
      
      private var var_2646:Number = 0;
      
      private var var_467:int = 0;
      
      private var var_2291:int = 0;
      
      private var var_335:Array;
      
      private var var_2644:Boolean = false;
      
      public function UserUpdateMessageData(param1:int, param2:Number, param3:Number, param4:Number, param5:Number, param6:int, param7:int, param8:Number, param9:Number, param10:Number, param11:Boolean, param12:Array)
      {
         this.var_335 = [];
         super();
         this._id = param1;
         this._x = param2;
         this.var_162 = param3;
         this.var_163 = param4;
         this.var_2647 = param5;
         this.var_467 = param6;
         this.var_2291 = param7;
         this.var_2643 = param8;
         this.var_2645 = param9;
         this.var_2646 = param10;
         this.var_2644 = param11;
         this.var_335 = param12;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get x() : Number
      {
         return this._x;
      }
      
      public function get y() : Number
      {
         return this.var_162;
      }
      
      public function get z() : Number
      {
         return this.var_163;
      }
      
      public function get localZ() : Number
      {
         return this.var_2647;
      }
      
      public function get targetX() : Number
      {
         return this.var_2643;
      }
      
      public function get targetY() : Number
      {
         return this.var_2645;
      }
      
      public function get targetZ() : Number
      {
         return this.var_2646;
      }
      
      public function get dir() : int
      {
         return this.var_467;
      }
      
      public function get dirHead() : int
      {
         return this.var_2291;
      }
      
      public function get isMoving() : Boolean
      {
         return this.var_2644;
      }
      
      public function get actions() : Array
      {
         return this.var_335.slice();
      }
   }
}
