package com.sulake.habbo.ui.widget.messages
{
   public class RoomWidgetViralFurniMessage extends RoomWidgetMessage
   {
      
      public static const const_736:String = "RWVFM_VIRAL_FOUND";
      
      public static const const_183:String = "RWVFM_OPEN_PRESENT";
       
      
      private var var_220:int;
      
      public function RoomWidgetViralFurniMessage(param1:String)
      {
         super(param1);
      }
      
      public function get objectId() : int
      {
         return this.var_220;
      }
      
      public function set objectId(param1:int) : void
      {
         this.var_220 = param1;
      }
   }
}
