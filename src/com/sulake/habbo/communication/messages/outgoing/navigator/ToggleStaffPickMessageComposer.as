package com.sulake.habbo.communication.messages.outgoing.navigator
{
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.runtime.IDisposable;
   
   public class ToggleStaffPickMessageComposer implements IMessageComposer, IDisposable
   {
       
      
      private var var_33:Array;
      
      public function ToggleStaffPickMessageComposer(param1:int, param2:Boolean)
      {
         this.var_33 = new Array();
         super();
         this.var_33.push(param1);
         this.var_33.push(param2);
      }
      
      public function getMessageArray() : Array
      {
         return this.var_33;
      }
      
      public function dispose() : void
      {
         this.var_33 = null;
      }
      
      public function get disposed() : Boolean
      {
         return false;
      }
   }
}
