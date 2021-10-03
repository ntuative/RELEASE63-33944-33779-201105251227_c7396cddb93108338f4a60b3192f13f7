package com.sulake.habbo.ui.widget.events
{
   public class RoomWidgetPollUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_135:String = "RWPUW_OFFER";
      
      public static const const_68:String = "RWPUW_ERROR";
      
      public static const const_143:String = "RWPUW_CONTENT";
       
      
      private var _id:int = -1;
      
      private var var_1771:String;
      
      private var var_1520:int = 0;
      
      private var var_1904:String = "";
      
      private var var_1905:String = "";
      
      private var var_1519:Array = null;
      
      public function RoomWidgetPollUpdateEvent(param1:int, param2:String, param3:Boolean = false, param4:Boolean = false)
      {
         this._id = param1;
         super(param2,param3,param4);
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get summary() : String
      {
         return this.var_1771;
      }
      
      public function set summary(param1:String) : void
      {
         this.var_1771 = param1;
      }
      
      public function get numQuestions() : int
      {
         return this.var_1520;
      }
      
      public function set numQuestions(param1:int) : void
      {
         this.var_1520 = param1;
      }
      
      public function get startMessage() : String
      {
         return this.var_1904;
      }
      
      public function set startMessage(param1:String) : void
      {
         this.var_1904 = param1;
      }
      
      public function get endMessage() : String
      {
         return this.var_1905;
      }
      
      public function set endMessage(param1:String) : void
      {
         this.var_1905 = param1;
      }
      
      public function get questionArray() : Array
      {
         return this.var_1519;
      }
      
      public function set questionArray(param1:Array) : void
      {
         this.var_1519 = param1;
      }
   }
}
