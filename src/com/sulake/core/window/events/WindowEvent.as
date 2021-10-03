package com.sulake.core.window.events
{
   import com.sulake.core.window.IWindow;
   
   public class WindowEvent
   {
      
      public static const const_1738:String = "WE_DESTROY";
      
      public static const const_304:String = "WE_DESTROYED";
      
      public static const const_1627:String = "WE_OPEN";
      
      public static const const_1865:String = "WE_OPENED";
      
      public static const const_1721:String = "WE_CLOSE";
      
      public static const const_1662:String = "WE_CLOSED";
      
      public static const const_1649:String = "WE_FOCUS";
      
      public static const const_321:String = "WE_FOCUSED";
      
      public static const const_1760:String = "WE_UNFOCUS";
      
      public static const const_1857:String = "WE_UNFOCUSED";
      
      public static const const_1897:String = "WE_ACTIVATE";
      
      public static const const_474:String = "WE_ACTIVATED";
      
      public static const const_1637:String = "WE_DEACTIVATE";
      
      public static const const_486:String = "WE_DEACTIVATED";
      
      public static const const_335:String = "WE_SELECT";
      
      public static const const_50:String = "WE_SELECTED";
      
      public static const const_601:String = "WE_UNSELECT";
      
      public static const const_560:String = "WE_UNSELECTED";
      
      public static const const_1783:String = "WE_LOCK";
      
      public static const const_1734:String = "WE_LOCKED";
      
      public static const const_1713:String = "WE_UNLOCK";
      
      public static const const_1675:String = "WE_UNLOCKED";
      
      public static const const_843:String = "WE_ENABLE";
      
      public static const const_260:String = "WE_ENABLED";
      
      public static const const_758:String = "WE_DISABLE";
      
      public static const const_245:String = "WE_DISABLED";
      
      public static const WINDOW_EVENT_RELOCATE:String = "WE_RELOCATE";
      
      public static const const_433:String = "WE_RELOCATED";
      
      public static const const_1180:String = "WE_RESIZE";
      
      public static const const_40:String = "WE_RESIZED";
      
      public static const const_1923:String = "WE_MINIMIZE";
      
      public static const const_1775:String = "WE_MINIMIZED";
      
      public static const const_1712:String = "WE_MAXIMIZE";
      
      public static const const_1892:String = "WE_MAXIMIZED";
      
      public static const const_1714:String = "WE_RESTORE";
      
      public static const const_1779:String = "WE_RESTORED";
      
      public static const const_348:String = "WE_CHILD_ADDED";
      
      public static const const_411:String = "WE_CHILD_REMOVED";
      
      public static const const_208:String = "WE_CHILD_RELOCATED";
      
      public static const const_119:String = "WE_CHILD_RESIZED";
      
      public static const const_313:String = "WE_CHILD_ACTIVATED";
      
      public static const const_623:String = "WE_PARENT_ADDED";
      
      public static const const_1876:String = "WE_PARENT_REMOVED";
      
      public static const const_1797:String = "WE_PARENT_RELOCATED";
      
      public static const const_765:String = "WE_PARENT_RESIZED";
      
      public static const const_1173:String = "WE_PARENT_ACTIVATED";
      
      public static const const_181:String = "WE_OK";
      
      public static const const_551:String = "WE_CANCEL";
      
      public static const const_108:String = "WE_CHANGE";
      
      public static const const_463:String = "WE_SCROLL";
      
      public static const const_171:String = "";
      
      private static const POOL:Array = [];
       
      
      protected var _type:String;
      
      protected var _window:IWindow;
      
      protected var var_708:IWindow;
      
      protected var var_1101:Boolean;
      
      protected var var_485:Boolean;
      
      protected var var_478:Boolean;
      
      protected var var_709:Array;
      
      public function WindowEvent()
      {
         super();
      }
      
      public static function allocate(param1:String, param2:IWindow, param3:IWindow, param4:Boolean = false) : WindowEvent
      {
         var _loc5_:WindowEvent = POOL.length > 0 ? POOL.pop() : new WindowEvent();
         _loc5_._type = param1;
         _loc5_._window = param2;
         _loc5_.var_708 = param3;
         _loc5_.var_485 = param4;
         _loc5_.var_478 = false;
         _loc5_.var_709 = POOL;
         return _loc5_;
      }
      
      public function get type() : String
      {
         return this._type;
      }
      
      public function get target() : IWindow
      {
         return this._window;
      }
      
      public function get window() : IWindow
      {
         return this._window;
      }
      
      public function get related() : IWindow
      {
         return this.var_708;
      }
      
      public function get cancelable() : Boolean
      {
         return this.var_485;
      }
      
      public function recycle() : void
      {
         if(this.var_478)
         {
            throw new Error("Event already recycled!");
         }
         this.var_708 = null;
         this._window = null;
         this.var_478 = true;
         this.var_1101 = false;
         this.var_709.push(this);
      }
      
      public function clone() : WindowEvent
      {
         return allocate(this._type,this.window,this.related,this.cancelable);
      }
      
      public function preventDefault() : void
      {
         this.preventWindowOperation();
      }
      
      public function isDefaultPrevented() : Boolean
      {
         return this.var_1101;
      }
      
      public function preventWindowOperation() : void
      {
         if(this.cancelable)
         {
            this.var_1101 = true;
            return;
         }
         throw new Error("Attempted to prevent window operation that is not cancelable!");
      }
      
      public function isWindowOperationPrevented() : Boolean
      {
         return this.var_1101;
      }
      
      public function stopPropagation() : void
      {
         this.var_1101 = true;
      }
      
      public function stopImmediatePropagation() : void
      {
         this.var_1101 = true;
      }
      
      public function toString() : String
      {
         return "WindowEvent { type: " + this._type + " cancelable: " + this.var_485 + " window: " + this._window + " }";
      }
   }
}
