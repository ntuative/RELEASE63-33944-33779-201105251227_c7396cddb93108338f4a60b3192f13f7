package com.sulake.habbo.ui.widget.messages
{
   public class RoomWidgetGetBadgeImageMessage extends RoomWidgetMessage
   {
      
      public static const const_895:String = "RWGOI_MESSAGE_GET_BADGE_IMAGE";
       
      
      private var var_295:String = "";
      
      public function RoomWidgetGetBadgeImageMessage(param1:String)
      {
         super(const_895);
         this.var_295 = param1;
      }
      
      public function get badgeId() : String
      {
         return this.var_295;
      }
   }
}
