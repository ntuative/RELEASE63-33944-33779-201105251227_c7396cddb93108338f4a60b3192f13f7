package com.sulake.habbo.ui.widget.events
{
   public class RoomWidgetTeaserDataUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_529:String = "RWTDUE_TEASER_DATA";
      
      public static const const_856:String = "RWTDUE_GIFT_DATA";
      
      public static const const_696:String = "RWTDUE_GIFT_RECEIVED";
       
      
      private var var_220:int;
      
      private var _data:String;
      
      private var var_407:int;
      
      private var var_184:String;
      
      private var var_2465:String;
      
      private var var_2466:Boolean;
      
      private var var_1497:int = 0;
      
      private var var_2655:String;
      
      public function RoomWidgetTeaserDataUpdateEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         super(param1,param2,param3);
      }
      
      public function get objectId() : int
      {
         return this.var_220;
      }
      
      public function get data() : String
      {
         return this._data;
      }
      
      public function get status() : int
      {
         return this.var_407;
      }
      
      public function get firstClickUserName() : String
      {
         return this.var_2465;
      }
      
      public function get giftWasReceived() : Boolean
      {
         return this.var_2466;
      }
      
      public function get ownRealName() : String
      {
         return this.var_2655;
      }
      
      public function get itemCategory() : int
      {
         return this.var_1497;
      }
      
      public function set status(param1:int) : void
      {
         this.var_407 = param1;
      }
      
      public function set data(param1:String) : void
      {
         this._data = param1;
      }
      
      public function set firstClickUserName(param1:String) : void
      {
         this.var_2465 = param1;
      }
      
      public function set giftWasReceived(param1:Boolean) : void
      {
         this.var_2466 = param1;
      }
      
      public function set ownRealName(param1:String) : void
      {
         this.var_2655 = param1;
      }
      
      public function set objectId(param1:int) : void
      {
         this.var_220 = param1;
      }
      
      public function get campaignID() : String
      {
         return this.var_184;
      }
      
      public function set campaignID(param1:String) : void
      {
         this.var_184 = param1;
      }
      
      public function set itemCategory(param1:int) : void
      {
         this.var_1497 = param1;
      }
   }
}
