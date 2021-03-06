package com.sulake.room.object.visualization.utils
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.IAsset;
   import flash.display.BitmapData;
   
   public class GraphicAsset implements IGraphicAsset
   {
       
      
      private var var_2625:String;
      
      private var var_2834:String;
      
      private var var_411:BitmapDataAsset;
      
      private var var_1414:Boolean;
      
      private var var_1415:Boolean;
      
      private var var_2833:Boolean;
      
      private var _offsetX:int;
      
      private var var_1267:int;
      
      private var var_269:int;
      
      private var _height:int;
      
      private var var_742:Boolean;
      
      public function GraphicAsset(param1:String, param2:String, param3:IAsset, param4:Boolean, param5:Boolean, param6:int, param7:int, param8:Boolean = false)
      {
         super();
         this.var_2625 = param1;
         this.var_2834 = param2;
         var _loc9_:BitmapDataAsset = param3 as BitmapDataAsset;
         if(_loc9_ != null)
         {
            this.var_411 = _loc9_;
            this.var_742 = false;
         }
         else
         {
            this.var_411 = null;
            this.var_742 = true;
         }
         this.var_1414 = param4;
         this.var_1415 = param5;
         this._offsetX = param6;
         this.var_1267 = param7;
         this.var_2833 = param8;
      }
      
      public function dispose() : void
      {
         this.var_411 = null;
      }
      
      private function initialize() : void
      {
         var _loc1_:* = null;
         if(!this.var_742 && this.var_411 != null)
         {
            _loc1_ = this.var_411.content as BitmapData;
            if(_loc1_ != null)
            {
               this.var_269 = _loc1_.width;
               this._height = _loc1_.height;
            }
            this.var_742 = true;
         }
      }
      
      public function get flipV() : Boolean
      {
         return this.var_1415;
      }
      
      public function get flipH() : Boolean
      {
         return this.var_1414;
      }
      
      public function get width() : int
      {
         this.initialize();
         return this.var_269;
      }
      
      public function get height() : int
      {
         this.initialize();
         return this._height;
      }
      
      public function get assetName() : String
      {
         return this.var_2625;
      }
      
      public function get libraryAssetName() : String
      {
         return this.var_2834;
      }
      
      public function get asset() : IAsset
      {
         return this.var_411;
      }
      
      public function get usesPalette() : Boolean
      {
         return this.var_2833;
      }
      
      public function get offsetX() : int
      {
         if(!this.var_1414)
         {
            return this._offsetX;
         }
         return -(this.width + this._offsetX);
      }
      
      public function get offsetY() : int
      {
         if(!this.var_1415)
         {
            return this.var_1267;
         }
         return -(this.height + this.var_1267);
      }
      
      public function get originalOffsetX() : int
      {
         return this._offsetX;
      }
      
      public function get originalOffsetY() : int
      {
         return this.var_1267;
      }
   }
}
