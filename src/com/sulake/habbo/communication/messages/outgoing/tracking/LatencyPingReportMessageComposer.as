package com.sulake.habbo.communication.messages.outgoing.tracking
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class LatencyPingReportMessageComposer implements IMessageComposer
   {
       
      
      private var var_2371:int;
      
      private var var_2370:int;
      
      private var var_2372:int;
      
      public function LatencyPingReportMessageComposer(param1:int, param2:int, param3:int)
      {
         super();
         this.var_2371 = param1;
         this.var_2370 = param2;
         this.var_2372 = param3;
      }
      
      public function getMessageArray() : Array
      {
         return [this.var_2371,this.var_2370,this.var_2372];
      }
      
      public function dispose() : void
      {
      }
   }
}
