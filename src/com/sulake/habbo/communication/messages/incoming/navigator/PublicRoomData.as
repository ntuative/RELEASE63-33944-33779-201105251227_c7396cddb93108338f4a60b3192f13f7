package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class PublicRoomData implements IDisposable
   {
       
      
      private var var_2473:String;
      
      private var var_2517:int;
      
      private var var_2472:int;
      
      private var var_2764:String;
      
      private var var_2832:int;
      
      private var var_1710:int;
      
      private var _disposed:Boolean;
      
      public function PublicRoomData(param1:IMessageDataWrapper)
      {
         super();
         this.var_2473 = param1.readString();
         this.var_2517 = param1.readInteger();
         this.var_2472 = param1.readInteger();
         this.var_2764 = param1.readString();
         this.var_2832 = param1.readInteger();
         this.var_1710 = param1.readInteger();
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get unitPropertySet() : String
      {
         return this.var_2473;
      }
      
      public function get unitPort() : int
      {
         return this.var_2517;
      }
      
      public function get worldId() : int
      {
         return this.var_2472;
      }
      
      public function get castLibs() : String
      {
         return this.var_2764;
      }
      
      public function get maxUsers() : int
      {
         return this.var_2832;
      }
      
      public function get nodeId() : int
      {
         return this.var_1710;
      }
   }
}
