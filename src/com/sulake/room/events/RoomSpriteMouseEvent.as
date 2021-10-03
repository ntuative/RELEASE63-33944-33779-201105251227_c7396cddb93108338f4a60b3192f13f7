package com.sulake.room.events
{
   public class RoomSpriteMouseEvent
   {
       
      
      private var _type:String = "";
      
      private var var_1848:String = "";
      
      private var var_1945:String = "";
      
      private var var_2236:String = "";
      
      private var var_2857:Number = 0;
      
      private var var_2858:Number = 0;
      
      private var var_2214:Number = 0;
      
      private var var_2218:Number = 0;
      
      private var var_2286:Boolean = false;
      
      private var var_2289:Boolean = false;
      
      private var var_2288:Boolean = false;
      
      private var var_2287:Boolean = false;
      
      public function RoomSpriteMouseEvent(param1:String, param2:String, param3:String, param4:String, param5:Number, param6:Number, param7:Number = 0, param8:Number = 0, param9:Boolean = false, param10:Boolean = false, param11:Boolean = false, param12:Boolean = false)
      {
         super();
         this._type = param1;
         this.var_1848 = param2;
         this.var_1945 = param3;
         this.var_2236 = param4;
         this.var_2857 = param5;
         this.var_2858 = param6;
         this.var_2214 = param7;
         this.var_2218 = param8;
         this.var_2286 = param9;
         this.var_2289 = param10;
         this.var_2288 = param11;
         this.var_2287 = param12;
      }
      
      public function get type() : String
      {
         return this._type;
      }
      
      public function get eventId() : String
      {
         return this.var_1848;
      }
      
      public function get canvasId() : String
      {
         return this.var_1945;
      }
      
      public function get spriteTag() : String
      {
         return this.var_2236;
      }
      
      public function get screenX() : Number
      {
         return this.var_2857;
      }
      
      public function get screenY() : Number
      {
         return this.var_2858;
      }
      
      public function get localX() : Number
      {
         return this.var_2214;
      }
      
      public function get localY() : Number
      {
         return this.var_2218;
      }
      
      public function get ctrlKey() : Boolean
      {
         return this.var_2286;
      }
      
      public function get altKey() : Boolean
      {
         return this.var_2289;
      }
      
      public function get shiftKey() : Boolean
      {
         return this.var_2288;
      }
      
      public function get buttonDown() : Boolean
      {
         return this.var_2287;
      }
   }
}
