package com.sulake.habbo.navigator.domain
{
   import com.sulake.habbo.communication.messages.incoming.navigator.FlatCategory;
   import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomData;
   import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomSearchResultData;
   import com.sulake.habbo.communication.messages.incoming.navigator.MsgWithRequestId;
   import com.sulake.habbo.communication.messages.incoming.navigator.OfficialRoomsData;
   import com.sulake.habbo.communication.messages.incoming.navigator.PopularRoomTagsData;
   import com.sulake.habbo.communication.messages.incoming.navigator.PublicRoomShortData;
   import com.sulake.habbo.communication.messages.incoming.navigator.RoomEventData;
   import com.sulake.habbo.communication.messages.parser.navigator.FavouritesMessageParser;
   import com.sulake.habbo.communication.messages.parser.room.engine.RoomEntryInfoMessageParser;
   import com.sulake.habbo.navigator.HabboNavigator;
   import flash.utils.Dictionary;
   
   public class NavigatorData
   {
      
      private static const const_1949:int = 10;
       
      
      private var _navigator:HabboNavigator;
      
      private var var_201:MsgWithRequestId;
      
      private var var_599:RoomEventData;
      
      private var var_2404:Boolean;
      
      private var var_2399:Boolean;
      
      private var _currentRoomOwner:Boolean;
      
      private var var_2398:int;
      
      private var var_255:GuestRoomData;
      
      private var var_930:PublicRoomShortData;
      
      private var var_2396:int;
      
      private var var_2395:Boolean;
      
      private var var_2394:int;
      
      private var var_2397:Boolean;
      
      private var var_1753:int;
      
      private var var_2403:Boolean;
      
      private var var_1443:Array;
      
      private var var_1444:Array;
      
      private var var_2400:int;
      
      private var var_1442:int;
      
      private var _favouriteIds:Dictionary;
      
      private var var_1154:Boolean;
      
      private var var_2401:int;
      
      private var var_2402:Boolean;
      
      private var var_2393:int = 0;
      
      public function NavigatorData(param1:HabboNavigator)
      {
         this.var_1443 = new Array();
         this.var_1444 = new Array();
         this._favouriteIds = new Dictionary();
         super();
         this._navigator = param1;
      }
      
      public function get canAddFavourite() : Boolean
      {
         return this.var_255 != null && !this._currentRoomOwner;
      }
      
      public function get canEditRoomSettings() : Boolean
      {
         return this.var_255 != null && this._currentRoomOwner;
      }
      
      public function onRoomEnter(param1:RoomEntryInfoMessageParser) : void
      {
         this.var_930 = null;
         this.var_255 = null;
         this._currentRoomOwner = false;
         if(param1.privateRoom)
         {
            this._currentRoomOwner = param1.owner;
         }
         else
         {
            this.var_930 = param1.publicSpace;
            this.var_599 = null;
         }
      }
      
      public function onRoomExit() : void
      {
         if(this.var_599 != null)
         {
            this.var_599.dispose();
            this.var_599 = null;
         }
         if(this.var_930 != null)
         {
            this.var_930.dispose();
            this.var_930 = null;
         }
         if(this.var_255 != null)
         {
            this.var_255.dispose();
            this.var_255 = null;
         }
         this._currentRoomOwner = false;
      }
      
      public function set enteredRoom(param1:GuestRoomData) : void
      {
         if(this.var_255 != null)
         {
            this.var_255.dispose();
         }
         this.var_255 = param1;
      }
      
      public function set roomEventData(param1:RoomEventData) : void
      {
         if(this.var_599 != null)
         {
            this.var_599.dispose();
         }
         this.var_599 = param1;
      }
      
      public function get popularTagsArrived() : Boolean
      {
         return this.var_201 != null && this.var_201 as PopularRoomTagsData != null;
      }
      
      public function get guestRoomSearchArrived() : Boolean
      {
         return this.var_201 != null && this.var_201 as GuestRoomSearchResultData != null;
      }
      
      public function get officialRoomsArrived() : Boolean
      {
         return this.var_201 != null && this.var_201 as OfficialRoomsData != null;
      }
      
      public function set guestRoomSearchResults(param1:GuestRoomSearchResultData) : void
      {
         this.disposeCurrentMsg();
         this.var_201 = param1;
         this.var_1154 = false;
      }
      
      public function set popularTags(param1:PopularRoomTagsData) : void
      {
         this.disposeCurrentMsg();
         this.var_201 = param1;
         this.var_1154 = false;
      }
      
      public function set officialRooms(param1:OfficialRoomsData) : void
      {
         this.disposeCurrentMsg();
         this.var_201 = param1;
         this.var_1154 = false;
      }
      
      private function disposeCurrentMsg() : void
      {
         if(this.var_201 == null)
         {
            return;
         }
         this.var_201.dispose();
         this.var_201 = null;
      }
      
      public function get guestRoomSearchResults() : GuestRoomSearchResultData
      {
         return this.var_201 as GuestRoomSearchResultData;
      }
      
      public function get popularTags() : PopularRoomTagsData
      {
         return this.var_201 as PopularRoomTagsData;
      }
      
      public function get officialRooms() : OfficialRoomsData
      {
         return this.var_201 as OfficialRoomsData;
      }
      
      public function get roomEventData() : RoomEventData
      {
         return this.var_599;
      }
      
      public function get avatarId() : int
      {
         return this.var_2398;
      }
      
      public function get eventMod() : Boolean
      {
         return this.var_2404;
      }
      
      public function get roomPicker() : Boolean
      {
         return this.var_2399;
      }
      
      public function get currentRoomOwner() : Boolean
      {
         return this._currentRoomOwner;
      }
      
      public function get enteredGuestRoom() : GuestRoomData
      {
         return this.var_255;
      }
      
      public function get enteredPublicSpace() : PublicRoomShortData
      {
         return this.var_930;
      }
      
      public function get hcMember() : Boolean
      {
         return this.var_2395;
      }
      
      public function get createdFlatId() : int
      {
         return this.var_2394;
      }
      
      public function get homeRoomId() : int
      {
         return this.var_1753;
      }
      
      public function get hotRoomPopupOpen() : Boolean
      {
         return this.var_2397;
      }
      
      public function get currentRoomRating() : int
      {
         return this.var_2401;
      }
      
      public function get publicSpaceNodeId() : int
      {
         return this.var_2396;
      }
      
      public function get settingsReceived() : Boolean
      {
         return this.var_2403;
      }
      
      public function get adIndex() : int
      {
         return this.var_2393;
      }
      
      public function get currentRoomIsStaffPick() : Boolean
      {
         return this.var_2402;
      }
      
      public function set avatarId(param1:int) : void
      {
         this.var_2398 = param1;
      }
      
      public function set createdFlatId(param1:int) : void
      {
         this.var_2394 = param1;
      }
      
      public function set hcMember(param1:Boolean) : void
      {
         this.var_2395 = param1;
      }
      
      public function set eventMod(param1:Boolean) : void
      {
         this.var_2404 = param1;
      }
      
      public function set roomPicker(param1:Boolean) : void
      {
         this.var_2399 = param1;
      }
      
      public function set hotRoomPopupOpen(param1:Boolean) : void
      {
         this.var_2397 = param1;
      }
      
      public function set homeRoomId(param1:int) : void
      {
         this.var_1753 = param1;
      }
      
      public function set currentRoomRating(param1:int) : void
      {
         this.var_2401 = param1;
      }
      
      public function set publicSpaceNodeId(param1:int) : void
      {
         this.var_2396 = param1;
      }
      
      public function set settingsReceived(param1:Boolean) : void
      {
         this.var_2403 = param1;
      }
      
      public function set adIndex(param1:int) : void
      {
         this.var_2393 = param1;
      }
      
      public function set currentRoomIsStaffPick(param1:Boolean) : void
      {
         this.var_2402 = param1;
      }
      
      public function set categories(param1:Array) : void
      {
         var _loc2_:* = null;
         this.var_1443 = param1;
         this.var_1444 = new Array();
         for each(_loc2_ in this.var_1443)
         {
            if(_loc2_.visible)
            {
               this.var_1444.push(_loc2_);
            }
         }
      }
      
      public function get allCategories() : Array
      {
         return this.var_1443;
      }
      
      public function get visibleCategories() : Array
      {
         return this.var_1444;
      }
      
      public function onFavourites(param1:FavouritesMessageParser) : void
      {
         var _loc2_:int = 0;
         this.var_2400 = param1.limit;
         this.var_1442 = param1.favouriteRoomIds.length;
         this._favouriteIds = new Dictionary();
         for each(_loc2_ in param1.favouriteRoomIds)
         {
            this._favouriteIds[_loc2_] = "yes";
         }
      }
      
      public function favouriteChanged(param1:int, param2:Boolean) : void
      {
         this._favouriteIds[param1] = !!param2 ? "yes" : null;
         this.var_1442 += !!param2 ? 1 : -1;
      }
      
      public function isCurrentRoomFavourite() : Boolean
      {
         var _loc1_:int = this.var_255.flatId;
         return this._favouriteIds[_loc1_] != null;
      }
      
      public function isCurrentRoomHome() : Boolean
      {
         if(this.var_255 == null)
         {
            return false;
         }
         var _loc1_:int = this.var_255.flatId;
         return this.var_1753 == _loc1_;
      }
      
      public function isRoomFavourite(param1:int) : Boolean
      {
         return this._favouriteIds[param1] != null;
      }
      
      public function isFavouritesFull() : Boolean
      {
         return this.var_1442 >= this.var_2400;
      }
      
      public function startLoading() : void
      {
         this.var_1154 = true;
      }
      
      public function isLoading() : Boolean
      {
         return this.var_1154;
      }
   }
}
