package com.sulake.habbo.ui.widget.messages
{
   public class RoomWidgetDimmerSavePresetMessage extends RoomWidgetMessage
   {
      
      public static const const_870:String = "RWSDPM_SAVE_PRESET";
       
      
      private var var_2632:int;
      
      private var var_2631:int;
      
      private var _color:uint;
      
      private var var_1343:int;
      
      private var var_2633:Boolean;
      
      public function RoomWidgetDimmerSavePresetMessage(param1:int, param2:int, param3:uint, param4:int, param5:Boolean)
      {
         super(const_870);
         this.var_2632 = param1;
         this.var_2631 = param2;
         this._color = param3;
         this.var_1343 = param4;
         this.var_2633 = param5;
      }
      
      public function get presetNumber() : int
      {
         return this.var_2632;
      }
      
      public function get effectTypeId() : int
      {
         return this.var_2631;
      }
      
      public function get color() : uint
      {
         return this._color;
      }
      
      public function get brightness() : int
      {
         return this.var_1343;
      }
      
      public function get apply() : Boolean
      {
         return this.var_2633;
      }
   }
}
