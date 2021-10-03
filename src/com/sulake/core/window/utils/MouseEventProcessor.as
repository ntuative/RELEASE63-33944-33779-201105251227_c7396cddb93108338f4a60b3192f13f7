package com.sulake.core.window.utils
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContextStateListener;
   import com.sulake.core.window.WindowController;
   import com.sulake.core.window.components.IDesktopWindow;
   import com.sulake.core.window.components.IInteractiveWindow;
   import com.sulake.core.window.enum.MouseCursorType;
   import com.sulake.core.window.enum.WindowParam;
   import com.sulake.core.window.enum.WindowState;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.core.window.graphics.IWindowRenderer;
   import flash.display.BitmapData;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   
   public class MouseEventProcessor implements IEventProcessor, IDisposable
   {
      
      protected static var var_341:Array;
      
      protected static var var_290:Array;
      
      protected static var var_410:Point = new Point();
       
      
      protected var var_711:Point;
      
      protected var var_177:WindowController;
      
      protected var var_65:WindowController;
      
      protected var var_166:IWindowRenderer;
      
      protected var var_86:IDesktopWindow;
      
      protected var var_887:IWindowContextStateListener;
      
      private var _disposed:Boolean = false;
      
      public function MouseEventProcessor()
      {
         super();
         this.var_711 = new Point();
         if(var_341 == null)
         {
            var_341 = new Array();
            var_341[0] = MouseCursorType.const_337;
            var_341[1] = MouseCursorType.const_30;
            var_341[2] = MouseCursorType.const_337;
            var_341[3] = MouseCursorType.const_337;
            var_341[4] = MouseCursorType.const_337;
            var_341[5] = MouseCursorType.const_30;
            var_341[6] = MouseCursorType.const_337;
         }
         if(var_290 == null)
         {
            var_290 = new Array();
            var_290[0] = WindowState.const_89;
            var_290[1] = WindowState.const_85;
            var_290[2] = WindowState.const_86;
            var_290[3] = WindowState.const_69;
            var_290[4] = WindowState.const_58;
            var_290[5] = WindowState.const_96;
            var_290[6] = WindowState.const_88;
         }
      }
      
      public static function setMouseCursorByState(param1:uint, param2:uint) : void
      {
         var _loc3_:int = var_290.indexOf(param1);
         if(_loc3_ > -1)
         {
            var_341[_loc3_] = param2;
         }
      }
      
      public static function getMouseCursorByState(param1:uint) : uint
      {
         var _loc2_:int = 0;
         while(_loc2_-- > 0)
         {
            if((param1 & 0) > 0)
            {
               return var_341[_loc2_];
            }
         }
         return MouseCursorType.const_30;
      }
      
      protected static function convertMouseEventType(param1:MouseEvent, param2:IWindow, param3:IWindow) : WindowMouseEvent
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:Boolean = false;
         _loc5_ = new Point(param1.stageX,param1.stageY);
         param2.convertPointFromGlobalToLocalSpace(_loc5_);
         switch(param1.type)
         {
            case MouseEvent.MOUSE_MOVE:
               _loc4_ = "null";
               break;
            case MouseEvent.MOUSE_OVER:
               _loc4_ = "null";
               break;
            case MouseEvent.MOUSE_OUT:
               _loc4_ = "null";
               break;
            case MouseEvent.ROLL_OUT:
               _loc4_ = "null";
               break;
            case MouseEvent.ROLL_OVER:
               _loc4_ = "null";
               break;
            case MouseEvent.CLICK:
               _loc4_ = "null";
               break;
            case MouseEvent.DOUBLE_CLICK:
               _loc4_ = "null";
               break;
            case MouseEvent.MOUSE_DOWN:
               _loc4_ = "null";
               break;
            case MouseEvent.MOUSE_UP:
               _loc6_ = _loc5_.x > -1 && _loc5_.y > -1 && _loc5_.x < param2.width && _loc5_.y < param2.height;
               _loc4_ = !!_loc6_ ? "null" : WindowMouseEvent.const_213;
               break;
            case MouseEvent.MOUSE_WHEEL:
               _loc4_ = "null";
               break;
            default:
               _loc4_ = "null";
         }
         return WindowMouseEvent.allocate(_loc4_,param2,param3,_loc5_.x,_loc5_.y,param1.stageX,param1.stageY,param1.altKey,param1.ctrlKey,param1.shiftKey,param1.buttonDown,param1.delta);
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
         }
      }
      
      public function process(param1:EventProcessorState, param2:IEventQueue) : void
      {
         var event:MouseEvent = null;
         var index:int = 0;
         var child:WindowController = null;
         var array:Array = null;
         var tempWindowEvent:WindowEvent = null;
         var window:IWindow = null;
         var temp:IWindow = null;
         var state:EventProcessorState = param1;
         var eventQueue:IEventQueue = param2;
         if(eventQueue.length == 0)
         {
            return;
         }
         this.var_86 = state.desktop;
         this.var_65 = state.var_1349 as WindowController;
         this.var_177 = state.var_1348 as WindowController;
         this.var_166 = state.renderer;
         this.var_887 = state.var_1345;
         eventQueue.begin();
         this.var_711.x = -1;
         this.var_711.y = -1;
         var mouseCursorType:int = 0;
         while(true)
         {
            event = eventQueue.next() as MouseEvent;
            if(event == null)
            {
               break;
            }
            if(event.stageX != this.var_711.x || event.stageY != this.var_711.y)
            {
               this.var_711.x = event.stageX;
               this.var_711.y = event.stageY;
               array = new Array();
               this.var_86.groupParameterFilteredChildrenUnderPoint(this.var_711,array,WindowParam.const_31);
            }
            index = array != null ? int(array.length) : 0;
            if(index == 0)
            {
               if(event.type == MouseEvent.MOUSE_MOVE)
               {
                  if(this.var_65 != this.var_86 && !this.var_65.disposed)
                  {
                     this.var_65.getGlobalPosition(var_410);
                     tempWindowEvent = WindowMouseEvent.allocate(WindowMouseEvent.const_25,this.var_65,null,event.stageX - 0,event.stageY - 0,event.stageX,event.stageY,event.altKey,event.ctrlKey,event.shiftKey,event.buttonDown,event.delta);
                     this.var_65.update(this.var_65,tempWindowEvent);
                     this.var_65 = WindowController(this.var_86);
                     tempWindowEvent.recycle();
                  }
               }
               else if(event.type == MouseEvent.MOUSE_DOWN)
               {
                  window = this.var_86.getActiveWindow();
                  if(window)
                  {
                     window.deactivate();
                  }
               }
            }
            while(--index > -1)
            {
               child = this.passMouseEvent(WindowController(array[index]),event);
               if(child != null && child.visible)
               {
                  if(event.type == MouseEvent.MOUSE_MOVE)
                  {
                     if(child != this.var_65)
                     {
                        if(!this.var_65.disposed)
                        {
                           this.var_65.getGlobalPosition(var_410);
                           tempWindowEvent = WindowMouseEvent.allocate(WindowMouseEvent.const_25,this.var_65,child,event.stageX - 0,event.stageY - 0,event.stageX,event.stageY,event.altKey,event.ctrlKey,event.shiftKey,event.buttonDown,event.delta);
                           this.var_65.update(this.var_65,tempWindowEvent);
                           tempWindowEvent.recycle();
                        }
                        if(!child.disposed)
                        {
                           child.getGlobalPosition(var_410);
                           tempWindowEvent = WindowMouseEvent.allocate(WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER,child,null,event.stageX - 0,event.stageY - 0,event.stageX,event.stageY,event.altKey,event.ctrlKey,event.shiftKey,event.buttonDown,event.delta);
                           child.update(child,tempWindowEvent);
                           tempWindowEvent.recycle();
                        }
                        if(!child.disposed)
                        {
                           this.var_65 = child;
                        }
                     }
                  }
                  else if(event.type == MouseEvent.MOUSE_UP || event.type == MouseEvent.CLICK)
                  {
                     if(this.var_65 && !this.var_65.disposed)
                     {
                        if(this.var_887 != null)
                        {
                           this.var_887.mouseEventReceived(event.type,this.var_65);
                        }
                     }
                  }
                  temp = child.parent;
                  while(temp && !temp.disposed)
                  {
                     if(temp is IInputProcessorRoot)
                     {
                        tempWindowEvent = convertMouseEventType(event,temp,child);
                        IInputProcessorRoot(temp).process(tempWindowEvent);
                        tempWindowEvent.recycle();
                        break;
                     }
                     temp = temp.parent;
                  }
                  if(event.altKey)
                  {
                     if(this.var_65)
                     {
                        Logger.log("HOVER: " + this.var_65.name);
                     }
                  }
                  if(this.var_65 is IInteractiveWindow)
                  {
                     try
                     {
                        mouseCursorType = IInteractiveWindow(this.var_65).getMouseCursorByState(this.var_65.state);
                        if(mouseCursorType == MouseCursorType.const_30)
                        {
                           mouseCursorType = getMouseCursorByState(this.var_65.state);
                        }
                     }
                     catch(e:Error)
                     {
                        mouseCursorType = 0;
                     }
                  }
                  if(child != this.var_86)
                  {
                     event.stopPropagation();
                     eventQueue.remove();
                  }
                  break;
               }
            }
         }
         eventQueue.end();
         MouseCursorControl.type = mouseCursorType;
         state.desktop = this.var_86;
         state.var_1349 = this.var_65;
         state.var_1348 = this.var_177;
         state.renderer = this.var_166;
         state.var_1345 = this.var_887;
      }
      
      private function passMouseEvent(param1:WindowController, param2:MouseEvent, param3:Boolean = false) : WindowController
      {
         if(param1.disposed)
         {
            return null;
         }
         if(param1.testStateFlag(WindowState.const_88))
         {
            return null;
         }
         var _loc4_:Point = new Point(param2.stageX,param2.stageY);
         param1.convertPointFromGlobalToLocalSpace(_loc4_);
         if(param2.type == MouseEvent.MOUSE_UP)
         {
            if(param1 != this.var_177)
            {
               if(this.var_177 && !this.var_177.disposed)
               {
                  this.var_177.update(this.var_177,convertMouseEventType(new MouseEvent(MouseEvent.MOUSE_UP,false,true,param2.localX,param2.localY,null,param2.ctrlKey,param2.altKey,param2.shiftKey,param2.buttonDown,param2.delta),this.var_177,param1));
                  this.var_177 = null;
                  if(param1.disposed)
                  {
                     return null;
                  }
               }
            }
         }
         var _loc5_:BitmapData = this.var_166.getDrawBufferForRenderable(param1);
         if(!param1.validateLocalPointIntersection(_loc4_,_loc5_))
         {
            return null;
         }
         if(param1.testParamFlag(WindowParam.const_489))
         {
            if(param1.parent != null)
            {
               return this.passMouseEvent(WindowController(param1.parent),param2);
            }
         }
         if(!param3)
         {
            switch(param2.type)
            {
               case MouseEvent.MOUSE_DOWN:
                  this.var_177 = param1;
                  break;
               case MouseEvent.CLICK:
                  if(this.var_177 != param1)
                  {
                     return null;
                  }
                  this.var_177 = null;
                  break;
               case MouseEvent.DOUBLE_CLICK:
                  if(this.var_177 != param1)
                  {
                     return null;
                  }
                  this.var_177 = null;
                  break;
            }
         }
         var _loc7_:WindowMouseEvent = convertMouseEventType(param2,param1,null);
         var _loc8_:Boolean = param1.update(param1,_loc7_);
         _loc7_.recycle();
         if(!_loc8_ && !param3)
         {
            if(param1.parent)
            {
               return this.passMouseEvent(WindowController(param1.parent),param2);
            }
         }
         return param1;
      }
   }
}
