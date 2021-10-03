package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class GuestRoomData implements IDisposable
   {
       
      
      private var var_347:int;
      
      private var var_843:Boolean;
      
      private var var_894:String;
      
      private var _ownerName:String;
      
      private var var_2442:int;
      
      private var var_2231:int;
      
      private var var_2783:int;
      
      private var var_1712:String;
      
      private var var_2780:int;
      
      private var var_2679:Boolean;
      
      private var var_793:int;
      
      private var var_1405:int;
      
      private var var_2784:String;
      
      private var var_880:Array;
      
      private var var_2781:RoomThumbnailData;
      
      private var var_2435:Boolean;
      
      private var var_2782:Boolean;
      
      private var _disposed:Boolean;
      
      public function GuestRoomData(param1:IMessageDataWrapper)
      {
         var _loc4_:* = null;
         this.var_880 = new Array();
         super();
         this.var_347 = param1.readInteger();
         this.var_843 = param1.readBoolean();
         this.var_894 = param1.readString();
         this._ownerName = param1.readString();
         this.var_2442 = param1.readInteger();
         this.var_2231 = param1.readInteger();
         this.var_2783 = param1.readInteger();
         this.var_1712 = param1.readString();
         this.var_2780 = param1.readInteger();
         this.var_2679 = param1.readBoolean();
         this.var_793 = param1.readInteger();
         this.var_1405 = param1.readInteger();
         this.var_2784 = param1.readString();
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = param1.readString();
            this.var_880.push(_loc4_);
            _loc3_++;
         }
         this.var_2781 = new RoomThumbnailData(param1);
         this.var_2435 = param1.readBoolean();
         this.var_2782 = param1.readBoolean();
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
      
      public function get flatId() : int
      {
         return this.var_347;
      }
      
      public function get event() : Boolean
      {
         return this.var_843;
      }
      
      public function get roomName() : String
      {
         return this.var_894;
      }
      
      public function get ownerName() : String
      {
         return this._ownerName;
      }
      
      public function get doorMode() : int
      {
         return this.var_2442;
      }
      
      public function get userCount() : int
      {
         return this.var_2231;
      }
      
      public function get maxUserCount() : int
      {
         return this.var_2783;
      }
      
      public function get description() : String
      {
         return this.var_1712;
      }
      
      public function get srchSpecPrm() : int
      {
         return this.var_2780;
      }
      
      public function get allowTrading() : Boolean
      {
         return this.var_2679;
      }
      
      public function get score() : int
      {
         return this.var_793;
      }
      
      public function get categoryId() : int
      {
         return this.var_1405;
      }
      
      public function get eventCreationTime() : String
      {
         return this.var_2784;
      }
      
      public function get tags() : Array
      {
         return this.var_880;
      }
      
      public function get thumbnail() : RoomThumbnailData
      {
         return this.var_2781;
      }
      
      public function get allowPets() : Boolean
      {
         return this.var_2435;
      }
      
      public function get displayRoomEntryAd() : Boolean
      {
         return this.var_2782;
      }
   }
}
