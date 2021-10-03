package com.sulake.room.events
{
   public class RoomObjectMouseEvent extends RoomObjectEvent
   {
      
      public static const const_136:String = "ROE_MOUSE_CLICK";
      
      public static const const_185:String = "ROE_MOUSE_ENTER";
      
      public static const const_608:String = "ROE_MOUSE_MOVE";
      
      public static const const_170:String = "ROE_MOUSE_LEAVE";
      
      public static const const_2173:String = "ROE_MOUSE_DOUBLE_CLICK";
      
      public static const const_597:String = "ROE_MOUSE_DOWN";
       
      
      private var var_1848:String = "";
      
      private var var_2289:Boolean;
      
      private var var_2286:Boolean;
      
      private var var_2288:Boolean;
      
      private var var_2287:Boolean;
      
      public function RoomObjectMouseEvent(param1:String, param2:String, param3:int, param4:String, param5:Boolean = false, param6:Boolean = false, param7:Boolean = false, param8:Boolean = false, param9:Boolean = false, param10:Boolean = false)
      {
         super(param1,param3,param4,param9,param10);
         this.var_1848 = param2;
         this.var_2289 = param5;
         this.var_2286 = param6;
         this.var_2288 = param7;
         this.var_2287 = param8;
      }
      
      public function get eventId() : String
      {
         return this.var_1848;
      }
      
      public function get altKey() : Boolean
      {
         return this.var_2289;
      }
      
      public function get ctrlKey() : Boolean
      {
         return this.var_2286;
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
