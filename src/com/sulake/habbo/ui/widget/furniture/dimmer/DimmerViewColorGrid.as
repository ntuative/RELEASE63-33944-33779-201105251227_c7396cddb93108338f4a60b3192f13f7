package com.sulake.habbo.ui.widget.furniture.dimmer
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IItemGridWindow;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.window.IHabboWindowManager;
   import flash.display.BitmapData;
   import flash.geom.ColorTransform;
   import flash.geom.Point;
   
   public class DimmerViewColorGrid
   {
       
      
      private var var_558:IItemGridWindow;
      
      private var _view:DimmerView;
      
      private var var_2076:XML;
      
      private var var_685:BitmapData;
      
      private var var_1324:BitmapData;
      
      private var var_1065:BitmapData;
      
      private var var_221:IWindowContainer;
      
      public function DimmerViewColorGrid(param1:DimmerView, param2:IItemGridWindow, param3:IHabboWindowManager, param4:IAssetLibrary)
      {
         super();
         this._view = param1;
         this.var_558 = param2;
         this.storeAssets(param4);
         this.populate(param3);
      }
      
      public function dispose() : void
      {
         this._view = null;
         this.var_558 = null;
         this.var_2076 = null;
         this.var_685 = null;
         this.var_1324 = null;
         this.var_1065 = null;
      }
      
      public function setSelectedColorIndex(param1:int) : void
      {
         if(this.var_558 == null)
         {
            return;
         }
         if(param1 < 0 || param1 >= this.var_558.numGridItems)
         {
            return;
         }
         this.select(this.var_558.getGridItemAt(param1) as IWindowContainer);
      }
      
      private function populate(param1:IHabboWindowManager) : void
      {
         if(this._view == null || this.var_558 == null)
         {
            return;
         }
         this.populateColourGrid(param1);
      }
      
      private function select(param1:IWindowContainer) : void
      {
         var _loc2_:* = null;
         if(this.var_221 != null)
         {
            _loc2_ = this.var_221.getChildByName("chosen");
            if(_loc2_ != null)
            {
               _loc2_.visible = false;
            }
         }
         this.var_221 = param1;
         _loc2_ = this.var_221.getChildByName("chosen");
         if(_loc2_ != null)
         {
            _loc2_.visible = true;
         }
      }
      
      private function populateColourGrid(param1:IHabboWindowManager) : void
      {
         var _loc2_:int = 0;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = 0;
         var _loc8_:* = 0;
         var _loc9_:* = 0;
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc12_:Number = NaN;
         var _loc13_:* = null;
         var _loc14_:* = null;
         this.var_558.destroyGridItems();
         this.var_221 = null;
         for each(_loc2_ in this.colors)
         {
            _loc3_ = param1.buildFromXML(this.var_2076) as IWindowContainer;
            _loc3_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onClick);
            _loc3_.background = true;
            _loc3_.color = 4294967295;
            _loc3_.width = this.var_685.width;
            _loc3_.height = this.var_685.height;
            this.var_558.addGridItem(_loc3_);
            _loc4_ = _loc3_.findChildByTag("BG_BORDER") as IBitmapWrapperWindow;
            if(_loc4_ != null)
            {
               _loc4_.bitmap = new BitmapData(this.var_685.width,this.var_685.height,true,0);
               _loc4_.bitmap.copyPixels(this.var_685,this.var_685.rect,new Point(0,0));
            }
            _loc5_ = _loc3_.findChildByTag("COLOR_IMAGE") as IBitmapWrapperWindow;
            if(_loc5_ != null)
            {
               _loc5_.bitmap = new BitmapData(this.var_1324.width,this.var_1324.height,true,0);
               _loc7_ = uint(_loc2_ >> 16 & 255);
               _loc8_ = uint(_loc2_ >> 8 & 255);
               _loc9_ = uint(_loc2_ >> 0 & 255);
               _loc10_ = _loc7_ / 255 * 1;
               _loc11_ = _loc8_ / 255 * 1;
               _loc12_ = _loc9_ / 255 * 1;
               _loc13_ = new ColorTransform(_loc10_,_loc11_,_loc12_);
               _loc14_ = this.var_1324.clone();
               _loc14_.colorTransform(_loc14_.rect,_loc13_);
               _loc5_.bitmap.copyPixels(_loc14_,_loc14_.rect,new Point(0,0));
            }
            _loc6_ = _loc3_.findChildByTag("COLOR_CHOSEN") as IBitmapWrapperWindow;
            if(_loc6_ != null)
            {
               _loc6_.bitmap = new BitmapData(this.var_1065.width,this.var_1065.height,true,16777215);
               _loc6_.bitmap.copyPixels(this.var_1065,this.var_1065.rect,new Point(0,0),null,null,true);
               _loc6_.visible = false;
            }
         }
      }
      
      private function onClick(param1:WindowMouseEvent) : void
      {
         var _loc2_:int = this.var_558.getGridItemIndex(param1.target as IWindow);
         this.setSelectedColorIndex(_loc2_);
         this._view.selectedColorIndex = _loc2_;
      }
      
      private function storeAssets(param1:IAssetLibrary) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         if(param1 == null)
         {
            return;
         }
         _loc2_ = XmlAsset(param1.getAssetByName("dimmer_color_chooser_cell"));
         this.var_2076 = XML(_loc2_.content);
         _loc3_ = BitmapDataAsset(param1.getAssetByName("dimmer_color_frame"));
         this.var_685 = BitmapData(_loc3_.content);
         _loc3_ = BitmapDataAsset(param1.getAssetByName("dimmer_color_button"));
         this.var_1324 = BitmapData(_loc3_.content);
         _loc3_ = BitmapDataAsset(param1.getAssetByName("dimmer_color_selected"));
         this.var_1065 = BitmapData(_loc3_.content);
      }
      
      private function get colors() : Array
      {
         if(this._view == null)
         {
            return [];
         }
         return this._view.colors;
      }
   }
}
