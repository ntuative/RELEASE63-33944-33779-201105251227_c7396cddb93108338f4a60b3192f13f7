package com.sulake.core.window
{
   import com.sulake.core.localization.ICoreLocalizationManager;
   import com.sulake.core.localization.ILocalizable;
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.runtime.IUpdateReceiver;
   import com.sulake.core.window.components.DesktopController;
   import com.sulake.core.window.components.IDesktopWindow;
   import com.sulake.core.window.components.SubstituteParentController;
   import com.sulake.core.window.enum.WindowParam;
   import com.sulake.core.window.enum.WindowState;
   import com.sulake.core.window.graphics.IGraphicContextHost;
   import com.sulake.core.window.graphics.IWindowRenderer;
   import com.sulake.core.window.services.IInternalWindowServices;
   import com.sulake.core.window.services.ServiceManager;
   import com.sulake.core.window.utils.EventProcessorState;
   import com.sulake.core.window.utils.IEventProcessor;
   import com.sulake.core.window.utils.IEventQueue;
   import com.sulake.core.window.utils.IWindowParser;
   import com.sulake.core.window.utils.MouseEventProcessor;
   import com.sulake.core.window.utils.MouseEventQueue;
   import com.sulake.core.window.utils.WindowParser;
   import com.sulake.core.window.utils.tablet.TabletEventProcessor;
   import com.sulake.core.window.utils.tablet.TabletEventQueue;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.Stage;
   import flash.events.Event;
   import flash.geom.Rectangle;
   
   public class WindowContext implements IWindowContext, IDisposable, IUpdateReceiver
   {
      
      public static const const_473:uint = 0;
      
      public static const const_1871:uint = 1;
      
      public static const const_2103:int = 0;
      
      public static const const_2119:int = 1;
      
      public static const const_2199:int = 2;
      
      public static const const_2024:int = 3;
      
      public static const const_1795:int = 4;
      
      public static const const_403:int = 5;
      
      public static var var_404:IEventQueue;
      
      private static var var_590:IEventProcessor;
      
      private static var var_1713:uint = const_473;
      
      private static var stage:Stage;
      
      private static var var_166:IWindowRenderer;
       
      
      private var var_2322:EventProcessorState;
      
      private var var_2320:IWindowContextStateListener;
      
      protected var _localization:ICoreLocalizationManager;
      
      protected var var_131:DisplayObjectContainer;
      
      protected var var_2985:Boolean = true;
      
      protected var var_1351:Error;
      
      protected var var_2156:int = -1;
      
      protected var var_1353:IInternalWindowServices;
      
      protected var var_1632:IWindowParser;
      
      protected var var_2931:IWindowFactory;
      
      protected var var_86:IDesktopWindow;
      
      protected var var_1631:SubstituteParentController;
      
      private var _disposed:Boolean = false;
      
      private var var_571:Boolean = false;
      
      private var var_2321:Boolean = false;
      
      private var _name:String;
      
      public function WindowContext(param1:String, param2:IWindowRenderer, param3:IWindowFactory, param4:ICoreLocalizationManager, param5:DisplayObjectContainer, param6:Rectangle, param7:IWindowContextStateListener)
      {
         super();
         this._name = param1;
         var_166 = param2;
         this._localization = param4;
         this.var_131 = param5;
         this.var_1353 = new ServiceManager(this,param5);
         this.var_2931 = param3;
         this.var_1632 = new WindowParser(this);
         this.var_2320 = param7;
         if(!stage)
         {
            if(this.var_131 is Stage)
            {
               stage = this.var_131 as Stage;
            }
            else if(this.var_131.stage)
            {
               stage = this.var_131.stage;
            }
         }
         Classes.init();
         if(param6 == null)
         {
            param6 = new Rectangle(0,0,800,600);
         }
         this.var_86 = new DesktopController("_CONTEXT_DESKTOP_" + this._name,this,param6);
         this.var_86.limits.maxWidth = param6.width;
         this.var_86.limits.maxHeight = param6.height;
         this.var_131.addChild(this.var_86.getDisplayObject());
         this.var_131.doubleClickEnabled = true;
         this.var_131.addEventListener(Event.RESIZE,this.stageResizedHandler);
         this.var_2322 = new EventProcessorState(var_166,this.var_86,this.var_86,null,this.var_2320);
         inputMode = const_473;
         this.var_1631 = new SubstituteParentController(this);
      }
      
      public static function get inputMode() : uint
      {
         return var_1713;
      }
      
      public static function set inputMode(param1:uint) : void
      {
         var value:uint = param1;
         if(var_404)
         {
            if(var_404 is IDisposable)
            {
               IDisposable(var_404).dispose();
            }
         }
         if(var_590)
         {
            if(var_590 is IDisposable)
            {
               IDisposable(var_590).dispose();
            }
         }
         switch(value)
         {
            case const_473:
               var_404 = new MouseEventQueue(stage);
               var_590 = new MouseEventProcessor();
               try
               {
               }
               catch(e:Error)
               {
               }
               break;
            case const_1871:
               var_404 = new TabletEventQueue(stage);
               var_590 = new TabletEventProcessor();
               try
               {
               }
               catch(e:Error)
               {
               }
               break;
            default:
               inputMode = const_473;
               throw new Error("Unknown input mode " + value);
         }
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function dispose() : void
      {
         if(!this._disposed)
         {
            this._disposed = true;
            this.var_131.removeEventListener(Event.RESIZE,this.stageResizedHandler);
            this.var_131.removeChild(IGraphicContextHost(this.var_86).getGraphicContext(true) as DisplayObject);
            this.var_86.destroy();
            this.var_86 = null;
            this.var_1631.destroy();
            this.var_1631 = null;
            if(this.var_1353 is IDisposable)
            {
               IDisposable(this.var_1353).dispose();
            }
            this.var_1353 = null;
            this.var_1632.dispose();
            this.var_1632 = null;
            var_166 = null;
         }
      }
      
      public function getLastError() : Error
      {
         return this.var_1351;
      }
      
      public function getLastErrorCode() : int
      {
         return this.var_2156;
      }
      
      public function handleError(param1:int, param2:Error) : void
      {
         this.var_1351 = param2;
         this.var_2156 = param1;
         if(this.var_2985)
         {
            throw param2;
         }
      }
      
      public function flushError() : void
      {
         this.var_1351 = null;
         this.var_2156 = -1;
      }
      
      public function getWindowServices() : IInternalWindowServices
      {
         return this.var_1353;
      }
      
      public function getWindowParser() : IWindowParser
      {
         return this.var_1632;
      }
      
      public function getWindowFactory() : IWindowFactory
      {
         return this.var_2931;
      }
      
      public function getDesktopWindow() : IDesktopWindow
      {
         return this.var_86;
      }
      
      public function findWindowByName(param1:String) : IWindow
      {
         return this.var_86.findChildByName(param1);
      }
      
      public function registerLocalizationListener(param1:String, param2:IWindow) : void
      {
         this._localization.registerListener(param1,param2 as ILocalizable);
      }
      
      public function removeLocalizationListener(param1:String, param2:IWindow) : void
      {
         this._localization.removeListener(param1,param2 as ILocalizable);
      }
      
      public function create(param1:String, param2:String, param3:uint, param4:uint, param5:uint, param6:Rectangle, param7:Function, param8:IWindow, param9:uint, param10:Array = null, param11:Array = null) : IWindow
      {
         var _loc12_:* = null;
         var _loc13_:Class = Classes.getWindowClassByType(param3);
         if(_loc13_ == null)
         {
            this.handleError(WindowContext.const_1795,new Error("Failed to solve implementation for window \"" + param1 + "\"!"));
            return null;
         }
         if(param8 == null)
         {
            if(param5 & 0)
            {
               param8 = this.var_1631;
            }
         }
         _loc12_ = new _loc13_(param1,param3,param4,param5,this,param6,param8 != null ? param8 : this.var_86,param7,param10,param11,param9);
         if(param2 && param2.length)
         {
            _loc12_.caption = param2;
         }
         return _loc12_;
      }
      
      public function destroy(param1:IWindow) : Boolean
      {
         if(param1 == this.var_86)
         {
            this.var_86 = null;
         }
         if(param1.state != WindowState.const_625)
         {
            param1.destroy();
         }
         return true;
      }
      
      public function invalidate(param1:IWindow, param2:Rectangle, param3:uint) : void
      {
         if(!this.disposed)
         {
            var_166.addToRenderQueue(WindowController(param1),param2,param3);
         }
      }
      
      public function update(param1:uint) : void
      {
         this.var_571 = true;
         if(this.var_1351)
         {
            throw this.var_1351;
         }
         var_590.process(this.var_2322,var_404);
         this.var_571 = false;
      }
      
      public function render(param1:uint) : void
      {
         this.var_2321 = true;
         var_166.update(param1);
         this.var_2321 = false;
      }
      
      private function stageResizedHandler(param1:Event) : void
      {
         if(this.var_86 != null && !this.var_86.disposed)
         {
            if(this.var_131 is Stage)
            {
               this.var_86.limits.maxWidth = Stage(this.var_131).stageWidth;
               this.var_86.limits.maxHeight = Stage(this.var_131).stageHeight;
               this.var_86.width = Stage(this.var_131).stageWidth;
               this.var_86.height = Stage(this.var_131).stageHeight;
            }
            else
            {
               this.var_86.limits.maxWidth = this.var_131.width;
               this.var_86.limits.maxHeight = this.var_131.height;
               this.var_86.width = this.var_131.width;
               this.var_86.height = this.var_131.height;
            }
         }
      }
   }
}
