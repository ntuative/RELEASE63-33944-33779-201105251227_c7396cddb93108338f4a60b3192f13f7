package com.sulake.habbo.ui.widget.messages
{
   public class RoomWidgetOpenCatalogMessage extends RoomWidgetMessage
   {
      
      public static const const_388:String = "RWGOI_MESSAGE_OPEN_CATALOG";
      
      public static const const_1133:String = "RWOCM_CLUB_MAIN";
      
      public static const const_1226:String = "RWOCM_PIXELS";
      
      public static const const_1172:String = "RWOCM_CREDITS";
       
      
      private var var_2700:String = "";
      
      public function RoomWidgetOpenCatalogMessage(param1:String)
      {
         super(const_388);
         this.var_2700 = param1;
      }
      
      public function get pageKey() : String
      {
         return this.var_2700;
      }
   }
}
