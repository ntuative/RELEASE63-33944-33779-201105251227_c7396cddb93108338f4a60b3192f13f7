package com.sulake.core.window.utils
{
   import com.sulake.core.window.IWindow;
   
   public class WindowRectLimits implements IRectLimiter
   {
       
      
      private var var_316:int = -2.147483648E9;
      
      private var var_313:int = 2.147483647E9;
      
      private var var_315:int = -2.147483648E9;
      
      private var var_314:int = 2.147483647E9;
      
      private var _target:IWindow;
      
      public function WindowRectLimits(param1:IWindow)
      {
         super();
         this._target = param1;
      }
      
      public function get minWidth() : int
      {
         return this.var_316;
      }
      
      public function get maxWidth() : int
      {
         return this.var_313;
      }
      
      public function get minHeight() : int
      {
         return this.var_315;
      }
      
      public function get maxHeight() : int
      {
         return this.var_314;
      }
      
      public function set minWidth(param1:int) : void
      {
         this.var_316 = param1;
         if(this.var_316 > int.MIN_VALUE && !this._target.disposed && this._target.width < this.var_316)
         {
            this._target.width = this.var_316;
         }
      }
      
      public function set maxWidth(param1:int) : void
      {
         this.var_313 = param1;
         if(this.var_313 < int.MAX_VALUE && !this._target.disposed && this._target.width > this.var_313)
         {
            this._target.width = this.var_313;
         }
      }
      
      public function set minHeight(param1:int) : void
      {
         this.var_315 = param1;
         if(this.var_315 > int.MIN_VALUE && !this._target.disposed && this._target.height < this.var_315)
         {
            this._target.height = this.var_315;
         }
      }
      
      public function set maxHeight(param1:int) : void
      {
         this.var_314 = param1;
         if(this.var_314 < int.MAX_VALUE && !this._target.disposed && this._target.height > this.var_314)
         {
            this._target.height = this.var_314;
         }
      }
      
      public function get isEmpty() : Boolean
      {
         return this.var_316 == int.MIN_VALUE && this.var_313 == int.MAX_VALUE && this.var_315 == int.MIN_VALUE && this.var_314 == int.MAX_VALUE;
      }
      
      public function setEmpty() : void
      {
         this.var_316 = int.MIN_VALUE;
         this.var_313 = int.MAX_VALUE;
         this.var_315 = int.MIN_VALUE;
         this.var_314 = int.MAX_VALUE;
      }
      
      public function limit() : void
      {
         if(!this.isEmpty && this._target)
         {
            if(this._target.width < this.var_316)
            {
               this._target.width = this.var_316;
            }
            else if(this._target.width > this.var_313)
            {
               this._target.width = this.var_313;
            }
            if(this._target.height < this.var_315)
            {
               this._target.height = this.var_315;
            }
            else if(this._target.height > this.var_314)
            {
               this._target.height = this.var_314;
            }
         }
      }
      
      public function assign(param1:int, param2:int, param3:int, param4:int) : void
      {
         this.var_316 = param1;
         this.var_313 = param2;
         this.var_315 = param3;
         this.var_314 = param4;
         this.limit();
      }
      
      public function clone(param1:IWindow) : WindowRectLimits
      {
         var _loc2_:WindowRectLimits = new WindowRectLimits(param1);
         _loc2_.var_316 = this.var_316;
         _loc2_.var_313 = this.var_313;
         _loc2_.var_315 = this.var_315;
         _loc2_.var_314 = this.var_314;
         return _loc2_;
      }
   }
}
