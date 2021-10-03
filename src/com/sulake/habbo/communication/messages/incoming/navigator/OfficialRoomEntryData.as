package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class OfficialRoomEntryData implements IDisposable
   {
      
      public static const const_1277:int = 1;
      
      public static const const_776:int = 2;
      
      public static const const_931:int = 3;
      
      public static const const_1691:int = 4;
       
      
      private var _index:int;
      
      private var var_2853:String;
      
      private var var_2852:String;
      
      private var var_2855:Boolean;
      
      private var var_2851:String;
      
      private var var_920:String;
      
      private var var_2854:int;
      
      private var var_2231:int;
      
      private var _type:int;
      
      private var var_2431:String;
      
      private var var_1067:GuestRoomData;
      
      private var var_1066:PublicRoomData;
      
      private var _open:Boolean;
      
      private var _disposed:Boolean;
      
      public function OfficialRoomEntryData(param1:IMessageDataWrapper)
      {
         super();
         this._index = param1.readInteger();
         this.var_2853 = param1.readString();
         this.var_2852 = param1.readString();
         this.var_2855 = param1.readInteger() == 1;
         this.var_2851 = param1.readString();
         this.var_920 = param1.readString();
         this.var_2854 = param1.readInteger();
         this.var_2231 = param1.readInteger();
         this._type = param1.readInteger();
         if(this._type == const_1277)
         {
            this.var_2431 = param1.readString();
         }
         else if(this._type == const_931)
         {
            this.var_1066 = new PublicRoomData(param1);
         }
         else if(this._type == const_776)
         {
            this.var_1067 = new GuestRoomData(param1);
         }
         else
         {
            this._open = param1.readBoolean();
         }
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
         if(this.var_1067 != null)
         {
            this.var_1067.dispose();
            this.var_1067 = null;
         }
         if(this.var_1066 != null)
         {
            this.var_1066.dispose();
            this.var_1066 = null;
         }
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get index() : int
      {
         return this._index;
      }
      
      public function get popupCaption() : String
      {
         return this.var_2853;
      }
      
      public function get popupDesc() : String
      {
         return this.var_2852;
      }
      
      public function get showDetails() : Boolean
      {
         return this.var_2855;
      }
      
      public function get picText() : String
      {
         return this.var_2851;
      }
      
      public function get picRef() : String
      {
         return this.var_920;
      }
      
      public function get folderId() : int
      {
         return this.var_2854;
      }
      
      public function get tag() : String
      {
         return this.var_2431;
      }
      
      public function get userCount() : int
      {
         return this.var_2231;
      }
      
      public function get guestRoomData() : GuestRoomData
      {
         return this.var_1067;
      }
      
      public function get publicRoomData() : PublicRoomData
      {
         return this.var_1066;
      }
      
      public function get open() : Boolean
      {
         return this._open;
      }
      
      public function toggleOpen() : void
      {
         this._open = !this._open;
      }
      
      public function get maxUsers() : int
      {
         if(this.type == const_1277)
         {
            return 0;
         }
         if(this.type == const_776)
         {
            return this.var_1067.maxUserCount;
         }
         if(this.type == const_931)
         {
            return this.var_1066.maxUsers;
         }
         return 0;
      }
   }
}
