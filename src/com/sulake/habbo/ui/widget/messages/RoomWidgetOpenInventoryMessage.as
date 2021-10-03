package com.sulake.habbo.ui.widget.messages
{
   public class RoomWidgetOpenInventoryMessage extends RoomWidgetMessage
   {
      
      public static const const_690:String = "RWGOI_MESSAGE_OPEN_INVENTORY";
      
      public static const const_1161:String = "inventory_effects";
      
      public static const const_1102:String = "inventory_badges";
      
      public static const const_1809:String = "inventory_clothes";
      
      public static const const_1901:String = "inventory_furniture";
       
      
      private var var_2880:String;
      
      public function RoomWidgetOpenInventoryMessage(param1:String)
      {
         super(const_690);
         this.var_2880 = param1;
      }
      
      public function get method_5() : String
      {
         return this.var_2880;
      }
   }
}
