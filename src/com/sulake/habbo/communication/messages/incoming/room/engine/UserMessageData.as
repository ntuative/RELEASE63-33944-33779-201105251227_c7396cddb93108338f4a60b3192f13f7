package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class UserMessageData
   {
      
      public static const const_1298:String = "M";
      
      public static const const_1707:String = "F";
       
      
      private var _id:int = 0;
      
      private var _x:Number = 0;
      
      private var var_162:Number = 0;
      
      private var var_163:Number = 0;
      
      private var var_467:int = 0;
      
      private var _name:String = "";
      
      private var var_1629:int = 0;
      
      private var var_932:String = "";
      
      private var var_583:String = "";
      
      private var var_2200:String = "";
      
      private var var_2199:int;
      
      private var var_2198:int = 0;
      
      private var var_2202:String = "";
      
      private var var_2201:int = 0;
      
      private var var_2196:int = 0;
      
      private var var_2197:String = "";
      
      private var var_178:Boolean = false;
      
      public function UserMessageData(param1:int)
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
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function set name(param1:String) : void
      {
         if(!this.var_178)
         {
            this._name = param1;
         }
      }
      
      public function get userType() : int
      {
         return this.var_1629;
      }
      
      public function set userType(param1:int) : void
      {
         if(!this.var_178)
         {
            this.var_1629 = param1;
         }
      }
      
      public function get sex() : String
      {
         return this.var_932;
      }
      
      public function set sex(param1:String) : void
      {
         if(!this.var_178)
         {
            this.var_932 = param1;
         }
      }
      
      public function get figure() : String
      {
         return this.var_583;
      }
      
      public function set figure(param1:String) : void
      {
         if(!this.var_178)
         {
            this.var_583 = param1;
         }
      }
      
      public function get custom() : String
      {
         return this.var_2200;
      }
      
      public function set custom(param1:String) : void
      {
         if(!this.var_178)
         {
            this.var_2200 = param1;
         }
      }
      
      public function get achievementScore() : int
      {
         return this.var_2199;
      }
      
      public function set achievementScore(param1:int) : void
      {
         if(!this.var_178)
         {
            this.var_2199 = param1;
         }
      }
      
      public function get webID() : int
      {
         return this.var_2198;
      }
      
      public function set webID(param1:int) : void
      {
         if(!this.var_178)
         {
            this.var_2198 = param1;
         }
      }
      
      public function get groupID() : String
      {
         return this.var_2202;
      }
      
      public function set groupID(param1:String) : void
      {
         if(!this.var_178)
         {
            this.var_2202 = param1;
         }
      }
      
      public function get groupStatus() : int
      {
         return this.var_2201;
      }
      
      public function set groupStatus(param1:int) : void
      {
         if(!this.var_178)
         {
            this.var_2201 = param1;
         }
      }
      
      public function get xp() : int
      {
         return this.var_2196;
      }
      
      public function set xp(param1:int) : void
      {
         if(!this.var_178)
         {
            this.var_2196 = param1;
         }
      }
      
      public function get subType() : String
      {
         return this.var_2197;
      }
      
      public function set subType(param1:String) : void
      {
         if(!this.var_178)
         {
            this.var_2197 = param1;
         }
      }
   }
}
