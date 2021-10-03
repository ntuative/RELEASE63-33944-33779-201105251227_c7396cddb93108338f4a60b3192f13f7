package com.sulake.habbo.advertisement.events
{
   import flash.display.BitmapData;
   import flash.events.Event;
   
   public class AdEvent extends Event
   {
      
      public static const const_905:String = "AE_ROOM_AD_IMAGE_LOADED";
      
      public static const const_917:String = "AE_ROOM_AD_IMAGE_LOADING_FAILED";
      
      public static const const_588:String = "AE_ROOM_AD_SHOW";
      
      public static const const_496:String = "AE_INTERSTITIAL_SHOW";
      
      public static const const_582:String = "AE_INTERSTITIAL_COMPLETE";
       
      
      private var var_46:BitmapData;
      
      private var _roomId:int;
      
      private var _roomCategory:int;
      
      private var _imageUrl:String;
      
      private var var_1176:String;
      
      private var var_2492:BitmapData;
      
      private var var_2491:BitmapData;
      
      private var var_220:int;
      
      public function AdEvent(param1:String, param2:int = 0, param3:int = 0, param4:BitmapData = null, param5:String = "", param6:String = "", param7:BitmapData = null, param8:BitmapData = null, param9:int = -1, param10:Boolean = false, param11:Boolean = false)
      {
         super(param1,param10,param11);
         this.var_46 = param4;
         this._roomId = param2;
         this._roomCategory = param3;
         this._imageUrl = param5;
         this.var_1176 = param6;
         this.var_2492 = param7;
         this.var_2491 = param8;
         this.var_220 = param9;
      }
      
      public function get image() : BitmapData
      {
         return this.var_46;
      }
      
      public function get roomId() : int
      {
         return this._roomId;
      }
      
      public function get roomCategory() : int
      {
         return this._roomCategory;
      }
      
      public function get imageUrl() : String
      {
         return this._imageUrl;
      }
      
      public function get clickUrl() : String
      {
         return this.var_1176;
      }
      
      public function get adWarningL() : BitmapData
      {
         return this.var_2492;
      }
      
      public function get adWarningR() : BitmapData
      {
         return this.var_2491;
      }
      
      public function get objectId() : int
      {
         return this.var_220;
      }
   }
}
