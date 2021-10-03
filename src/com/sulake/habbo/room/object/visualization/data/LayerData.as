package com.sulake.habbo.room.object.visualization.data
{
   public class LayerData
   {
      
      public static const const_759:String = "";
      
      public static const const_401:int = 0;
      
      public static const const_485:int = 255;
      
      public static const const_983:Boolean = false;
      
      public static const const_610:int = 0;
      
      public static const const_577:int = 0;
      
      public static const const_370:int = 0;
      
      public static const const_1109:int = 1;
      
      public static const const_1158:int = 2;
      
      public static const INK_DARKEN:int = 3;
       
      
      private var var_2431:String = "";
      
      private var var_2082:int = 0;
      
      private var var_2555:int = 255;
      
      private var var_2552:Boolean = false;
      
      private var var_2554:int = 0;
      
      private var var_2556:int = 0;
      
      private var var_2553:Number = 0;
      
      public function LayerData()
      {
         super();
      }
      
      public function set tag(param1:String) : void
      {
         this.var_2431 = param1;
      }
      
      public function get tag() : String
      {
         return this.var_2431;
      }
      
      public function set ink(param1:int) : void
      {
         this.var_2082 = param1;
      }
      
      public function get ink() : int
      {
         return this.var_2082;
      }
      
      public function set alpha(param1:int) : void
      {
         this.var_2555 = param1;
      }
      
      public function get alpha() : int
      {
         return this.var_2555;
      }
      
      public function set ignoreMouse(param1:Boolean) : void
      {
         this.var_2552 = param1;
      }
      
      public function get ignoreMouse() : Boolean
      {
         return this.var_2552;
      }
      
      public function set xOffset(param1:int) : void
      {
         this.var_2554 = param1;
      }
      
      public function get xOffset() : int
      {
         return this.var_2554;
      }
      
      public function set yOffset(param1:int) : void
      {
         this.var_2556 = param1;
      }
      
      public function get yOffset() : int
      {
         return this.var_2556;
      }
      
      public function set zOffset(param1:Number) : void
      {
         this.var_2553 = param1;
      }
      
      public function get zOffset() : Number
      {
         return this.var_2553;
      }
      
      public function copyValues(param1:LayerData) : void
      {
         if(param1 != null)
         {
            this.tag = param1.tag;
            this.ink = param1.ink;
            this.alpha = param1.alpha;
            this.ignoreMouse = param1.ignoreMouse;
            this.xOffset = param1.xOffset;
            this.yOffset = param1.yOffset;
            this.zOffset = param1.zOffset;
         }
      }
   }
}
