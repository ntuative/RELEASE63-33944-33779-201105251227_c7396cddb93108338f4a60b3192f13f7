package com.sulake.core.window.utils.tablet
{
   import com.sulake.core.window.WindowController;
   import com.sulake.core.window.utils.EventProcessorState;
   import com.sulake.core.window.utils.IEventQueue;
   import com.sulake.core.window.utils.MouseEventProcessor;
   
   public class TabletEventProcessor extends MouseEventProcessor
   {
       
      
      private var var_3007:String = "";
      
      public function TabletEventProcessor()
      {
         super();
      }
      
      override public function process(param1:EventProcessorState, param2:IEventQueue) : void
      {
         if(param2.length == 0)
         {
            return;
         }
         var_86 = param1.desktop;
         var_65 = param1.var_1349 as WindowController;
         var_177 = param1.var_1348 as WindowController;
         var_166 = param1.renderer;
         var_887 = param1.var_1345;
         param2.begin();
         param2.end();
         param1.desktop = var_86;
         param1.var_1349 = var_65;
         param1.var_1348 = var_177;
         param1.renderer = var_166;
         param1.var_1345 = var_887;
      }
   }
}
