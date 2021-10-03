package com.sulake.habbo.room.utils
{
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   
   public class RoomCamera
   {
      
      private static const const_1549:Number = 12;
       
      
      private var var_2807:int = -1;
      
      private var var_2808:int = -2;
      
      private var var_214:Vector3d = null;
      
      private var var_1295:Number = 0;
      
      private var var_1576:Number = 0;
      
      private var var_2028:Boolean = false;
      
      private var var_191:Vector3d = null;
      
      private var var_2029:Vector3d;
      
      private var var_2806:Boolean = false;
      
      private var var_2811:Boolean = false;
      
      private var var_2803:Boolean = false;
      
      private var var_2810:Boolean = false;
      
      private var var_2805:int = 0;
      
      private var var_2804:int = 0;
      
      private var _scale:int = 0;
      
      private var var_2809:int = 0;
      
      private var var_2812:int = 0;
      
      private var var_1740:int = -1;
      
      private var var_2030:int = 0;
      
      private var var_2027:Boolean = false;
      
      public function RoomCamera()
      {
         this.var_2029 = new Vector3d();
         super();
      }
      
      public function get location() : IVector3d
      {
         return this.var_191;
      }
      
      public function get targetId() : int
      {
         return this.var_2807;
      }
      
      public function get targetCategory() : int
      {
         return this.var_2808;
      }
      
      public function get targetObjectLoc() : IVector3d
      {
         return this.var_2029;
      }
      
      public function get limitedLocationX() : Boolean
      {
         return this.var_2806;
      }
      
      public function get limitedLocationY() : Boolean
      {
         return this.var_2811;
      }
      
      public function get centeredLocX() : Boolean
      {
         return this.var_2803;
      }
      
      public function get centeredLocY() : Boolean
      {
         return this.var_2810;
      }
      
      public function get screenWd() : int
      {
         return this.var_2805;
      }
      
      public function get screenHt() : int
      {
         return this.var_2804;
      }
      
      public function get scale() : int
      {
         return this._scale;
      }
      
      public function get roomWd() : int
      {
         return this.var_2809;
      }
      
      public function get roomHt() : int
      {
         return this.var_2812;
      }
      
      public function get geometryUpdateId() : int
      {
         return this.var_1740;
      }
      
      public function get isMoving() : Boolean
      {
         if(this.var_214 != null && this.var_191 != null)
         {
            return true;
         }
         return false;
      }
      
      public function set targetId(param1:int) : void
      {
         this.var_2807 = param1;
      }
      
      public function set targetObjectLoc(param1:IVector3d) : void
      {
         this.var_2029.assign(param1);
      }
      
      public function set targetCategory(param1:int) : void
      {
         this.var_2808 = param1;
      }
      
      public function set limitedLocationX(param1:Boolean) : void
      {
         this.var_2806 = param1;
      }
      
      public function set limitedLocationY(param1:Boolean) : void
      {
         this.var_2811 = param1;
      }
      
      public function set centeredLocX(param1:Boolean) : void
      {
         this.var_2803 = param1;
      }
      
      public function set centeredLocY(param1:Boolean) : void
      {
         this.var_2810 = param1;
      }
      
      public function set screenWd(param1:int) : void
      {
         this.var_2805 = param1;
      }
      
      public function set screenHt(param1:int) : void
      {
         this.var_2804 = param1;
      }
      
      public function set scale(param1:int) : void
      {
         if(this._scale != param1)
         {
            this._scale = param1;
            this.var_2027 = true;
         }
      }
      
      public function set roomWd(param1:int) : void
      {
         this.var_2809 = param1;
      }
      
      public function set roomHt(param1:int) : void
      {
         this.var_2812 = param1;
      }
      
      public function set geometryUpdateId(param1:int) : void
      {
         this.var_1740 = param1;
      }
      
      public function set target(param1:IVector3d) : void
      {
         var _loc2_:* = null;
         if(this.var_214 == null)
         {
            this.var_214 = new Vector3d();
         }
         if(this.var_214.x != param1.x || this.var_214.y != param1.y || this.var_214.z != param1.z)
         {
            this.var_214.assign(param1);
            this.var_2030 = 0;
            _loc2_ = Vector3d.dif(this.var_214,this.var_191);
            this.var_1295 = _loc2_.length;
            this.var_2028 = true;
         }
      }
      
      public function dispose() : void
      {
         this.var_214 = null;
         this.var_191 = null;
      }
      
      public function initializeLocation(param1:IVector3d) : void
      {
         if(this.var_191 != null)
         {
            return;
         }
         this.var_191 = new Vector3d();
         this.var_191.assign(param1);
      }
      
      public function resetLocation(param1:IVector3d) : void
      {
         if(this.var_191 == null)
         {
            this.var_191 = new Vector3d();
         }
         this.var_191.assign(param1);
      }
      
      public function update(param1:uint, param2:Number) : void
      {
         var _loc3_:* = null;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         if(this.var_214 != null && this.var_191 != null)
         {
            ++this.var_2030;
            if(this.var_2027)
            {
               this.var_2027 = false;
               this.var_191 = this.var_214;
               this.var_214 = null;
               return;
            }
            _loc3_ = Vector3d.dif(this.var_214,this.var_191);
            if(_loc3_.length > this.var_1295)
            {
               this.var_1295 = _loc3_.length;
            }
            if(_loc3_.length <= param2)
            {
               this.var_191 = this.var_214;
               this.var_214 = null;
               this.var_1576 = 0;
            }
            else
            {
               _loc4_ = Math.sin(0 * _loc3_.length / this.var_1295);
               _loc5_ = param2 * 0.5;
               _loc6_ = this.var_1295 / const_1549;
               _loc7_ = _loc5_ + (_loc6_ - _loc5_) * _loc4_;
               if(this.var_2028)
               {
                  if(_loc7_ < this.var_1576)
                  {
                     _loc7_ = this.var_1576;
                     if(_loc7_ > _loc3_.length)
                     {
                        _loc7_ = _loc3_.length;
                     }
                  }
                  else
                  {
                     this.var_2028 = false;
                  }
               }
               this.var_1576 = _loc7_;
               _loc3_.div(_loc3_.length);
               _loc3_.mul(_loc7_);
               this.var_191 = Vector3d.sum(this.var_191,_loc3_);
            }
         }
      }
      
      public function reset() : void
      {
         this.var_1740 = -1;
      }
   }
}
