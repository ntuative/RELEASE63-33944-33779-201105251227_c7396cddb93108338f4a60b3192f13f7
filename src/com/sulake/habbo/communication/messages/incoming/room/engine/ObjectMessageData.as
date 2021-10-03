package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class ObjectMessageData
   {
       
      
      private var _id:int = 0;
      
      private var _x:Number = 0;
      
      private var var_162:Number = 0;
      
      private var var_163:Number = 0;
      
      private var var_467:int = 0;
      
      private var var_537:int = 0;
      
      private var var_650:int = 0;
      
      private var _type:int = 0;
      
      private var var_2990:String = "";
      
      private var var_1404:int = -1;
      
      private var _state:int = 0;
      
      private var _data:String = "";
      
      private var var_2419:int = 0;
      
      private var var_2217:Boolean;
      
      private var var_2599:String = null;
      
      private var var_178:Boolean = false;
      
      public function ObjectMessageData(param1:int)
      {
         super();
         this._id = param1;
      }
      
      public function setReadOnly() : void
      {
         this.var_178 = true;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get x() : Number
      {
         return this._x;
      }
      
      public function set x(param1:Number) : void
      {
         if(!this.var_178)
         {
            this._x = param1;
         }
      }
      
      public function get y() : Number
      {
         return this.var_162;
      }
      
      public function set y(param1:Number) : void
      {
         if(!this.var_178)
         {
            this.var_162 = param1;
         }
      }
      
      public function get z() : Number
      {
         return this.var_163;
      }
      
      public function set z(param1:Number) : void
      {
         if(!this.var_178)
         {
            this.var_163 = param1;
         }
      }
      
      public function get dir() : int
      {
         return this.var_467;
      }
      
      public function set dir(param1:int) : void
      {
         if(!this.var_178)
         {
            this.var_467 = param1;
         }
      }
      
      public function get sizeX() : int
      {
         return this.var_537;
      }
      
      public function set sizeX(param1:int) : void
      {
         if(!this.var_178)
         {
            this.var_537 = param1;
         }
      }
      
      public function get sizeY() : int
      {
         return this.var_650;
      }
      
      public function set sizeY(param1:int) : void
      {
         if(!this.var_178)
         {
            this.var_650 = param1;
         }
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function set type(param1:int) : void
      {
         if(!this.var_178)
         {
            this._type = param1;
         }
      }
      
      public function get state() : int
      {
         return this._state;
      }
      
      public function set state(param1:int) : void
      {
         if(!this.var_178)
         {
            this._state = param1;
         }
      }
      
      public function get data() : String
      {
         return this._data;
      }
      
      public function set data(param1:String) : void
      {
         if(!this.var_178)
         {
            this._data = param1;
         }
      }
      
      public function get staticClass() : String
      {
         return this.var_2599;
      }
      
      public function set staticClass(param1:String) : void
      {
         if(!this.var_178)
         {
            this.var_2599 = param1;
         }
      }
      
      public function get extra() : int
      {
         return this.var_1404;
      }
      
      public function set extra(param1:int) : void
      {
         if(!this.var_178)
         {
            this.var_1404 = param1;
         }
      }
      
      public function get expiryTime() : int
      {
         return this.var_2419;
      }
      
      public function set expiryTime(param1:int) : void
      {
         if(!this.var_178)
         {
            this.var_2419 = param1;
         }
      }
      
      public function get knownAsUsable() : Boolean
      {
         return this.var_2217;
      }
      
      public function set knownAsUsable(param1:Boolean) : void
      {
         this.var_2217 = param1;
      }
   }
}
