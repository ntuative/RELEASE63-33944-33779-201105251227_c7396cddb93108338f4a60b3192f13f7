package com.sulake.habbo.ui.widget.messages
{
   public class RoomWidgetChatTypingMessage extends RoomWidgetMessage
   {
      
      public static const const_849:String = "RWCTM_TYPING_STATUS";
       
      
      private var var_692:Boolean;
      
      public function RoomWidgetChatTypingMessage(param1:Boolean)
      {
         super(const_849);
         this.var_692 = param1;
      }
      
      public function get isTyping() : Boolean
      {
         return this.var_692;
      }
   }
}
