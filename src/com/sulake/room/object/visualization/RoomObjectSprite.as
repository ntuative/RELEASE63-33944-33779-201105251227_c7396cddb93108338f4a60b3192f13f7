package com.sulake.room.object.visualization
{
   import flash.display.BitmapData;
   import flash.display.BlendMode;
   import flash.geom.Point;
   
   public final class RoomObjectSprite implements IRoomObjectSprite
   {
      
      private static var var_1244:int = 0;
       
      
      private var var_411:BitmapData = null;
      
      private var var_2625:String = "";
      
      private var var_324:Boolean = true;
      
      private var var_2431:String = "";
      
      private var var_2555:int = 255;
      
      private var _color:int = 16777215;
      
      private var var_1927:String;
      
      private var var_1414:Boolean = false;
      
      private var var_1415:Boolean = false;
      
      private var _offset:Point;
      
      private var var_269:int = 0;
      
      private var _height:int = 0;
      
      private var var_1317:Number = 0;
      
      private var var_2432:Boolean = false;
      
      private var var_2684:Boolean = true;
      
      private var var_2433:Boolean = false;
      
      private var _updateID:int = 0;
      
      private var var_2676:int = 0;
      
      private var var_2685:Array = null;
      
      public function RoomObjectSprite()
      {
         this.var_1927 = BlendMode.NORMAL;
         this._offset = new Point(0,0);
         super();
         this.var_2676 = var_1244++;
      }
      
      public function dispose() : void
      {
         this.var_411 = null;
         this.var_269 = 0;
         this._height = 0;
      }
      
      public function get asset() : BitmapData
      {
         return this.var_411;
      }
      
      public function get assetName() : String
      {
         return this.var_2625;
      }
      
      public function get visible() : Boolean
      {
         return this.var_324;
      }
      
      public function get tag() : String
      {
         return this.var_2431;
      }
      
      public function get alpha() : int
      {
         return this.var_2555;
      }
      
      public function get color() : int
      {
         return this._color;
      }
      
      public function get blendMode() : String
      {
         return this.var_1927;
      }
      
      public function get flipV() : Boolean
      {
         return this.var_1415;
      }
      
      public function get flipH() : Boolean
      {
         return this.var_1414;
      }
      
      public function get offsetX() : int
      {
         return this._offset.x;
      }
      
      public function get offsetY() : int
      {
         return this._offset.y;
      }
      
      public function get width() : int
      {
         return this.var_269;
      }
      
      public function get height() : int
      {
         return this._height;
      }
      
      public function get relativeDepth() : Number
      {
         return this.var_1317;
      }
      
      public function get varyingDepth() : Boolean
      {
         return this.var_2432;
      }
      
      public function get capturesMouse() : Boolean
      {
         return this.var_2684;
      }
      
      public function get clickHandling() : Boolean
      {
         return this.var_2433;
      }
      
      public function get instanceId() : int
      {
         return this.var_2676;
      }
      
      public function get updateId() : int
      {
         return this._updateID;
      }
      
      public function get filters() : Array
      {
         return this.var_2685;
      }
      
      public function set asset(param1:BitmapData) : void
      {
         if(param1 != null)
         {
            this.var_269 = param1.width;
            this._height = param1.height;
         }
         this.var_411 = param1;
         ++this._updateID;
      }
      
      public function set assetName(param1:String) : void
      {
         this.var_2625 = param1;
         ++this._updateID;
      }
      
      public function set visible(param1:Boolean) : void
      {
         this.var_324 = param1;
         ++this._updateID;
      }
      
      public function set tag(param1:String) : void
      {
         this.var_2431 = param1;
         ++this._updateID;
      }
      
      public function set alpha(param1:int) : void
      {
         param1 &= 255;
         this.var_2555 = param1;
         ++this._updateID;
      }
      
      public function set color(param1:int) : void
      {
         param1 &= 16777215;
         this._color = param1;
         ++this._updateID;
      }
      
      public function set blendMode(param1:String) : void
      {
         this.var_1927 = param1;
         ++this._updateID;
      }
      
      public function set filters(param1:Array) : void
      {
         this.var_2685 = param1;
         ++this._updateID;
      }
      
      public function set flipH(param1:Boolean) : void
      {
         this.var_1414 = param1;
         ++this._updateID;
      }
      
      public function set flipV(param1:Boolean) : void
      {
         this.var_1415 = param1;
         ++this._updateID;
      }
      
      public function set offsetX(param1:int) : void
      {
         this._offset.x = param1;
         ++this._updateID;
      }
      
      public function set offsetY(param1:int) : void
      {
         this._offset.y = param1;
         ++this._updateID;
      }
      
      public function set relativeDepth(param1:Number) : void
      {
         this.var_1317 = param1;
         ++this._updateID;
      }
      
      public function set varyingDepth(param1:Boolean) : void
      {
         this.var_2432 = param1;
         ++this._updateID;
      }
      
      public function set capturesMouse(param1:Boolean) : void
      {
         this.var_2684 = param1;
         ++this._updateID;
      }
      
      public function set clickHandling(param1:Boolean) : void
      {
         this.var_2433 = param1;
         ++this._updateID;
      }
   }
}
