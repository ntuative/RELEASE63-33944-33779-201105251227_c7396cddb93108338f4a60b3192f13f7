package com.sulake.habbo.friendbar.view.utils
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import flash.display.BitmapData;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.utils.Timer;
   
   public class Icon implements IDisposable
   {
      
      protected static const const_2207:int = 0;
      
      protected static const const_636:int = 1;
      
      protected static const const_1939:int = 2;
      
      protected static const const_1941:int = 3;
      
      protected static const const_129:int = 4;
      
      protected static const const_637:int = 8;
      
      protected static const const_272:int = 18;
      
      protected static const const_1940:int = 18;
       
      
      private var _disposed:Boolean = false;
      
      private var var_1955:Boolean = false;
      
      protected var var_46:BitmapDataAsset;
      
      protected var var_90:IBitmapWrapperWindow;
      
      private var var_1272:uint;
      
      protected var var_210:Timer;
      
      protected var _frame:int = 0;
      
      private var var_652:Point;
      
      protected var var_885:Boolean = false;
      
      protected var _hover:Boolean = false;
      
      public function Icon()
      {
         this.var_1272 = const_636 | const_637;
         this.var_652 = new Point();
         super();
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get disabled() : Boolean
      {
         return this.var_1955;
      }
      
      protected function set image(param1:BitmapDataAsset) : void
      {
         this.var_46 = param1;
         this.redraw();
      }
      
      protected function get image() : BitmapDataAsset
      {
         return this.var_46;
      }
      
      protected function set canvas(param1:IBitmapWrapperWindow) : void
      {
         this.var_90 = param1;
         this.redraw();
      }
      
      protected function get canvas() : IBitmapWrapperWindow
      {
         return this.var_90;
      }
      
      protected function set alignment(param1:uint) : void
      {
         this.var_1272 = param1;
         this.redraw();
      }
      
      protected function get alignment() : uint
      {
         return this.var_1272;
      }
      
      public function dispose() : void
      {
         if(!this._disposed)
         {
            this.toggleTimer(false,0);
            this.image = null;
            this.canvas = null;
            this._disposed = true;
         }
      }
      
      public function notify(param1:Boolean) : void
      {
         this.var_885 = param1;
         if(this.var_885 && this.var_1955)
         {
            this.enable(true);
         }
      }
      
      public function hover(param1:Boolean) : void
      {
         this._hover = param1;
      }
      
      public function enable(param1:Boolean) : void
      {
         this.var_1955 = !param1;
      }
      
      protected function redraw() : void
      {
         var _loc1_:* = null;
         if(this.var_90 && !this.var_90.disposed)
         {
            if(!this.var_90.bitmap)
            {
               this.var_90.bitmap = new BitmapData(this.var_90.width,this.var_90.height,true,0);
            }
            else
            {
               this.var_90.bitmap.fillRect(this.var_90.bitmap.rect,0);
            }
            if(this.var_46 && !this.var_46.disposed)
            {
               this.var_652.x = this.var_652.y = 0;
               _loc1_ = this.var_46.content as BitmapData;
               switch(this.var_1272 & const_1941)
               {
                  case const_636:
                     this.var_652.x = this.var_90.bitmap.width / 2 - _loc1_.width / 2;
                     break;
                  case const_1939:
                     this.var_652.x = this.var_90.bitmap.width - _loc1_.width;
               }
               switch(this.var_1272 & const_1940)
               {
                  case const_637:
                     this.var_652.y = this.var_90.bitmap.height / 2 - _loc1_.height / 2;
                     break;
                  case const_272:
                     this.var_652.y = this.var_90.bitmap.height - _loc1_.height;
               }
               this.var_90.bitmap.copyPixels(_loc1_,_loc1_.rect,this.var_652);
               this.var_90.invalidate();
            }
         }
      }
      
      protected function toggleTimer(param1:Boolean, param2:int) : void
      {
         if(param1)
         {
            if(!this.var_210)
            {
               this.var_210 = new Timer(param2,0);
               this.var_210.addEventListener(TimerEvent.TIMER,this.onTimerEvent);
               this.var_210.start();
               this.onTimerEvent(null);
            }
            this.var_210.delay = param2;
         }
         else
         {
            this._frame = 0;
            if(this.var_210)
            {
               this.var_210.reset();
               this.var_210.removeEventListener(TimerEvent.TIMER,this.onTimerEvent);
               this.var_210 = null;
            }
         }
      }
      
      protected function onTimerEvent(param1:TimerEvent) : void
      {
      }
   }
}
