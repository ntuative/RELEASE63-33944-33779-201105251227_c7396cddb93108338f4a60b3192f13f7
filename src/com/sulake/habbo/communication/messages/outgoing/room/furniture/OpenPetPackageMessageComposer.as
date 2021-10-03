package com.sulake.habbo.communication.messages.outgoing.room.furniture
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class OpenPetPackageMessageComposer implements IMessageComposer
   {
       
      
      private var var_220:int;
      
      private var var_2668:String;
      
      public function OpenPetPackageMessageComposer(param1:int, param2:String)
      {
         super();
         this.var_220 = param1;
         this.var_2668 = param2;
      }
      
      public function getMessageArray() : Array
      {
         return [this.var_220,this.var_2668];
      }
      
      public function dispose() : void
      {
      }
   }
}
