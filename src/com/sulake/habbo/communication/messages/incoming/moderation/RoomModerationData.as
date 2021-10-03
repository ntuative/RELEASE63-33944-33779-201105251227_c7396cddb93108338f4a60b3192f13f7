package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class RoomModerationData implements IDisposable
   {
       
      
      private var var_347:int;
      
      private var var_2231:int;
      
      private var var_2232:Boolean;
      
      private var var_2230:int;
      
      private var _ownerName:String;
      
      private var var_128:RoomData;
      
      private var var_843:RoomData;
      
      private var _disposed:Boolean;
      
      public function RoomModerationData(param1:IMessageDataWrapper)
      {
         super();
         this.var_347 = param1.readInteger();
         this.var_2231 = param1.readInteger();
         this.var_2232 = param1.readBoolean();
         this.var_2230 = param1.readInteger();
         this._ownerName = param1.readString();
         this.var_128 = new RoomData(param1);
         this.var_843 = new RoomData(param1);
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
         if(this.var_128 != null)
         {
            this.var_128.dispose();
            this.var_128 = null;
         }
         if(this.var_843 != null)
         {
            this.var_843.dispose();
            this.var_843 = null;
         }
      }
      
      public function get flatId() : int
      {
         return this.var_347;
      }
      
      public function get userCount() : int
      {
         return this.var_2231;
      }
      
      public function get ownerInRoom() : Boolean
      {
         return this.var_2232;
      }
      
      public function get ownerId() : int
      {
         return this.var_2230;
      }
      
      public function get ownerName() : String
      {
         return this._ownerName;
      }
      
      public function get room() : RoomData
      {
         return this.var_128;
      }
      
      public function get event() : RoomData
      {
         return this.var_843;
      }
   }
}
