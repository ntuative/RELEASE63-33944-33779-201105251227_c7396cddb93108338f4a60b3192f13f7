package com.sulake.core.window.services
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.IWindowContext;
   import flash.display.DisplayObject;
   
   public class ServiceManager implements IInternalWindowServices, IDisposable
   {
       
      
      private var var_2975:uint;
      
      private var var_155:DisplayObject;
      
      private var _disposed:Boolean = false;
      
      private var var_283:IWindowContext;
      
      private var var_1304:IMouseDraggingService;
      
      private var var_1301:IMouseScalingService;
      
      private var var_1303:IMouseListenerService;
      
      private var var_1299:IFocusManagerService;
      
      private var var_1300:IToolTipAgentService;
      
      private var var_1302:IGestureAgentService;
      
      public function ServiceManager(param1:IWindowContext, param2:DisplayObject)
      {
         super();
         this.var_2975 = 0;
         this.var_155 = param2;
         this.var_283 = param1;
         this.var_1304 = new WindowMouseDragger(param2);
         this.var_1301 = new WindowMouseScaler(param2);
         this.var_1303 = new WindowMouseListener(param2);
         this.var_1299 = new FocusManager(param2);
         this.var_1300 = new WindowToolTipAgent(param2);
         this.var_1302 = new GestureAgentService();
      }
      
      public function dispose() : void
      {
         if(this.var_1304 != null)
         {
            this.var_1304.dispose();
            this.var_1304 = null;
         }
         if(this.var_1301 != null)
         {
            this.var_1301.dispose();
            this.var_1301 = null;
         }
         if(this.var_1303 != null)
         {
            this.var_1303.dispose();
            this.var_1303 = null;
         }
         if(this.var_1299 != null)
         {
            this.var_1299.dispose();
            this.var_1299 = null;
         }
         if(this.var_1300 != null)
         {
            this.var_1300.dispose();
            this.var_1300 = null;
         }
         if(this.var_1302 != null)
         {
            this.var_1302.dispose();
            this.var_1302 = null;
         }
         this.var_155 = null;
         this.var_283 = null;
         this._disposed = true;
      }
      
      public function getMouseDraggingService() : IMouseDraggingService
      {
         return this.var_1304;
      }
      
      public function getMouseScalingService() : IMouseScalingService
      {
         return this.var_1301;
      }
      
      public function getMouseListenerService() : IMouseListenerService
      {
         return this.var_1303;
      }
      
      public function getFocusManagerService() : IFocusManagerService
      {
         return this.var_1299;
      }
      
      public function getToolTipAgentService() : IToolTipAgentService
      {
         return this.var_1300;
      }
      
      public function getGestureAgentService() : IGestureAgentService
      {
         return this.var_1302;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
   }
}
