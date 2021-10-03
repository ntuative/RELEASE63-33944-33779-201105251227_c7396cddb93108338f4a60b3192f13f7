package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class RoomEventData implements IDisposable
   {
       
      
      private var var_1752:Boolean;
      
      private var var_2389:int;
      
      private var var_2392:String;
      
      private var var_347:int;
      
      private var var_2388:int;
      
      private var var_1655:String;
      
      private var var_2391:String;
      
      private var var_2390:String;
      
      private var var_880:Array;
      
      private var _disposed:Boolean;
      
      public function RoomEventData(param1:IMessageDataWrapper)
      {
         var _loc5_:* = null;
         this.var_880 = new Array();
         super();
         var _loc2_:String = param1.readString();
         if(_loc2_ == "-1")
         {
            Logger.log("Got null room event");
            this.var_1752 = false;
            return;
         }
         this.var_1752 = true;
         this.var_2389 = int(_loc2_);
         this.var_2392 = param1.readString();
         this.var_347 = int(param1.readString());
         this.var_2388 = param1.readInteger();
         this.var_1655 = param1.readString();
         this.var_2391 = param1.readString();
         this.var_2390 = param1.readString();
         var _loc3_:int = param1.readInteger();
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc5_ = param1.readString();
            this.var_880.push(_loc5_);
            _loc4_++;
         }
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
         this.var_880 = null;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get ownerAvatarId() : int
      {
         return this.var_2389;
      }
      
      public function get ownerAvatarName() : String
      {
         return this.var_2392;
      }
      
      public function get flatId() : int
      {
         return this.var_347;
      }
      
      public function get eventType() : int
      {
         return this.var_2388;
      }
      
      public function get eventName() : String
      {
         return this.var_1655;
      }
      
      public function get eventDescription() : String
      {
         return this.var_2391;
      }
      
      public function get creationTime() : String
      {
         return this.var_2390;
      }
      
      public function get tags() : Array
      {
         return this.var_880;
      }
      
      public function get exists() : Boolean
      {
         return this.var_1752;
      }
   }
}
