package com.sulake.habbo.communication.messages.outgoing.tracking
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class PerformanceLogMessageComposer implements IMessageComposer
   {
       
      
      private var var_2460:int = 0;
      
      private var var_1380:String = "";
      
      private var var_1646:String = "";
      
      private var var_2192:String = "";
      
      private var var_2617:String = "";
      
      private var var_1885:int = 0;
      
      private var var_2618:int = 0;
      
      private var var_2620:int = 0;
      
      private var var_1381:int = 0;
      
      private var var_2619:int = 0;
      
      private var var_1379:int = 0;
      
      public function PerformanceLogMessageComposer(param1:int, param2:String, param3:String, param4:String, param5:String, param6:Boolean, param7:int, param8:int, param9:int, param10:int, param11:int)
      {
         super();
         this.var_2460 = param1;
         this.var_1380 = param2;
         this.var_1646 = param3;
         this.var_2192 = param4;
         this.var_2617 = param5;
         if(param6)
         {
            this.var_1885 = 1;
         }
         else
         {
            this.var_1885 = 0;
         }
         this.var_2618 = param7;
         this.var_2620 = param8;
         this.var_1381 = param9;
         this.var_2619 = param10;
         this.var_1379 = param11;
      }
      
      public function dispose() : void
      {
      }
      
      public function getMessageArray() : Array
      {
         return [this.var_2460,this.var_1380,this.var_1646,this.var_2192,this.var_2617,this.var_1885,this.var_2618,this.var_2620,this.var_1381,this.var_2619,this.var_1379];
      }
   }
}
