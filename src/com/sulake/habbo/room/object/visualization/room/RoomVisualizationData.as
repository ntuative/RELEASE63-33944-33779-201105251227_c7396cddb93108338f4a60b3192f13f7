package com.sulake.habbo.room.object.visualization.room
{
   import com.sulake.habbo.room.object.visualization.room.mask.PlaneMaskManager;
   import com.sulake.habbo.room.object.visualization.room.rasterizer.IPlaneRasterizer;
   import com.sulake.habbo.room.object.visualization.room.rasterizer.animated.LandscapeRasterizer;
   import com.sulake.habbo.room.object.visualization.room.rasterizer.basic.FloorRasterizer;
   import com.sulake.habbo.room.object.visualization.room.rasterizer.basic.WallAdRasterizer;
   import com.sulake.habbo.room.object.visualization.room.rasterizer.basic.WallRasterizer;
   import com.sulake.room.object.visualization.IRoomObjectVisualizationData;
   import com.sulake.room.object.visualization.utils.IGraphicAssetCollection;
   
   public class RoomVisualizationData implements IRoomObjectVisualizationData
   {
       
      
      private var var_519:WallRasterizer;
      
      private var var_520:FloorRasterizer;
      
      private var var_799:WallAdRasterizer;
      
      private var var_521:LandscapeRasterizer;
      
      private var var_798:PlaneMaskManager;
      
      private var var_742:Boolean = false;
      
      public function RoomVisualizationData()
      {
         super();
         this.var_519 = new WallRasterizer();
         this.var_520 = new FloorRasterizer();
         this.var_799 = new WallAdRasterizer();
         this.var_521 = new LandscapeRasterizer();
         this.var_798 = new PlaneMaskManager();
      }
      
      public function get initialized() : Boolean
      {
         return this.var_742;
      }
      
      public function get floorRasterizer() : IPlaneRasterizer
      {
         return this.var_520;
      }
      
      public function get wallRasterizer() : IPlaneRasterizer
      {
         return this.var_519;
      }
      
      public function get wallAdRasterizr() : WallAdRasterizer
      {
         return this.var_799;
      }
      
      public function get landscapeRasterizer() : IPlaneRasterizer
      {
         return this.var_521;
      }
      
      public function get maskManager() : PlaneMaskManager
      {
         return this.var_798;
      }
      
      public function dispose() : void
      {
         if(this.var_519 != null)
         {
            this.var_519.dispose();
            this.var_519 = null;
         }
         if(this.var_520 != null)
         {
            this.var_520.dispose();
            this.var_520 = null;
         }
         if(this.var_799 != null)
         {
            this.var_799.dispose();
            this.var_799 = null;
         }
         if(this.var_521 != null)
         {
            this.var_521.dispose();
            this.var_521 = null;
         }
         if(this.var_798 != null)
         {
            this.var_798.dispose();
            this.var_798 = null;
         }
      }
      
      public function clearCache() : void
      {
         if(this.var_519 != null)
         {
            this.var_519.clearCache();
         }
         if(this.var_520 != null)
         {
            this.var_520.clearCache();
         }
         if(this.var_521 != null)
         {
            this.var_521.clearCache();
         }
      }
      
      public function initialize(param1:XML) : Boolean
      {
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:* = null;
         this.reset();
         if(param1 == null)
         {
            return false;
         }
         var _loc2_:XMLList = param1.wallData;
         if(_loc2_.length() > 0)
         {
            _loc7_ = _loc2_[0];
            this.var_519.initialize(_loc7_);
         }
         var _loc3_:XMLList = param1.floorData;
         if(_loc3_.length() > 0)
         {
            _loc8_ = _loc3_[0];
            this.var_520.initialize(_loc8_);
         }
         var _loc4_:XMLList = param1.wallAdData;
         if(_loc4_.length() > 0)
         {
            _loc9_ = _loc4_[0];
            this.var_799.initialize(_loc9_);
         }
         var _loc5_:XMLList = param1.landscapeData;
         if(_loc5_.length() > 0)
         {
            _loc10_ = _loc5_[0];
            this.var_521.initialize(_loc10_);
         }
         var _loc6_:XMLList = param1.maskData;
         if(_loc6_.length() > 0)
         {
            _loc11_ = _loc6_[0];
            this.var_798.initialize(_loc11_);
         }
         return true;
      }
      
      public function initializeAssetCollection(param1:IGraphicAssetCollection) : void
      {
         if(this.var_742)
         {
            return;
         }
         this.var_519.initializeAssetCollection(param1);
         this.var_520.initializeAssetCollection(param1);
         this.var_799.initializeAssetCollection(param1);
         this.var_521.initializeAssetCollection(param1);
         this.var_798.initializeAssetCollection(param1);
         this.var_742 = true;
      }
      
      protected function reset() : void
      {
      }
   }
}
