package com.sulake.habbo.room.utils
{
   import com.sulake.core.utils.Map;
   
   public class RoomInstanceData
   {
       
      
      private var _roomId:int = 0;
      
      private var _roomCategory:int = 0;
      
      private var var_781:TileHeightMap = null;
      
      private var var_1197:LegacyWallGeometry = null;
      
      private var var_1198:RoomCamera = null;
      
      private var var_779:SelectedRoomObjectData = null;
      
      private var var_780:SelectedRoomObjectData = null;
      
      private var _worldType:String = null;
      
      private var var_511:Map;
      
      private var var_510:Map;
      
      public function RoomInstanceData(param1:int, param2:int)
      {
         this.var_511 = new Map();
         this.var_510 = new Map();
         super();
         this._roomId = param1;
         this._roomCategory = param2;
         this.var_1197 = new LegacyWallGeometry();
         this.var_1198 = new RoomCamera();
      }
      
      public function get roomId() : int
      {
         return this._roomId;
      }
      
      public function get roomCategory() : int
      {
         return this._roomCategory;
      }
      
      public function get tileHeightMap() : TileHeightMap
      {
         return this.var_781;
      }
      
      public function set tileHeightMap(param1:TileHeightMap) : void
      {
         if(this.var_781 != null)
         {
            this.var_781.dispose();
         }
         this.var_781 = param1;
      }
      
      public function get legacyGeometry() : LegacyWallGeometry
      {
         return this.var_1197;
      }
      
      public function get roomCamera() : RoomCamera
      {
         return this.var_1198;
      }
      
      public function get worldType() : String
      {
         return this._worldType;
      }
      
      public function set worldType(param1:String) : void
      {
         this._worldType = param1;
      }
      
      public function get selectedObject() : SelectedRoomObjectData
      {
         return this.var_779;
      }
      
      public function set selectedObject(param1:SelectedRoomObjectData) : void
      {
         if(this.var_779 != null)
         {
            this.var_779.dispose();
         }
         this.var_779 = param1;
      }
      
      public function get placedObject() : SelectedRoomObjectData
      {
         return this.var_780;
      }
      
      public function set placedObject(param1:SelectedRoomObjectData) : void
      {
         if(this.var_780 != null)
         {
            this.var_780.dispose();
         }
         this.var_780 = param1;
      }
      
      public function dispose() : void
      {
         if(this.var_781 != null)
         {
            this.var_781.dispose();
            this.var_781 = null;
         }
         if(this.var_1197 != null)
         {
            this.var_1197.dispose();
            this.var_1197 = null;
         }
         if(this.var_1198 != null)
         {
            this.var_1198.dispose();
            this.var_1198 = null;
         }
         if(this.var_779 != null)
         {
            this.var_779.dispose();
            this.var_779 = null;
         }
         if(this.var_780 != null)
         {
            this.var_780.dispose();
            this.var_780 = null;
         }
         if(this.var_511 != null)
         {
            this.var_511.dispose();
            this.var_511 = null;
         }
         if(this.var_510 != null)
         {
            this.var_510.dispose();
            this.var_510 = null;
         }
      }
      
      public function addFurnitureData(param1:FurnitureData) : void
      {
         if(param1 != null)
         {
            this.var_511.remove(param1.id);
            this.var_511.add(param1.id,param1);
         }
      }
      
      public function getFurnitureData() : FurnitureData
      {
         if(this.var_511.length > 0)
         {
            return this.getFurnitureDataWithId(this.var_511.getKey(0));
         }
         return null;
      }
      
      public function getFurnitureDataWithId(param1:int) : FurnitureData
      {
         return this.var_511.remove(param1);
      }
      
      public function addWallItemData(param1:FurnitureData) : void
      {
         if(param1 != null)
         {
            this.var_510.remove(param1.id);
            this.var_510.add(param1.id,param1);
         }
      }
      
      public function getWallItemData() : FurnitureData
      {
         if(this.var_510.length > 0)
         {
            return this.getWallItemDataWithId(this.var_510.getKey(0));
         }
         return null;
      }
      
      public function getWallItemDataWithId(param1:int) : FurnitureData
      {
         return this.var_510.remove(param1);
      }
   }
}
