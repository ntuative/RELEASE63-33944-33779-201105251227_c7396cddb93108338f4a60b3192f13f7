package com.sulake.habbo.ui.widget.messages
{
   public class RoomWidgetSelectOutfitMessage extends RoomWidgetMessage
   {
      
      public static const const_1157:String = "select_outfit";
       
      
      private var var_2379:int;
      
      public function RoomWidgetSelectOutfitMessage(param1:int)
      {
         super(const_1157);
         this.var_2379 = param1;
      }
      
      public function get outfitId() : int
      {
         return this.var_2379;
      }
   }
}
