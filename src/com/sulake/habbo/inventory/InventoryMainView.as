package com.sulake.habbo.inventory
{
   import com.sulake.core.assets.IAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IFrameWindow;
   import com.sulake.core.window.components.ITabButtonWindow;
   import com.sulake.core.window.components.ITabContextWindow;
   import com.sulake.core.window.enum.WindowState;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.inventory.enum.InventoryCategory;
   import com.sulake.habbo.toolbar.HabboToolbarIconEnum;
   import com.sulake.habbo.toolbar.IHabboToolbar;
   import com.sulake.habbo.toolbar.events.HabboToolbarEvent;
   import com.sulake.habbo.utils.WindowToggle;
   import com.sulake.habbo.window.IHabboWindowManager;
   import flash.geom.Point;
   
   public class InventoryMainView
   {
      
      private static const const_1071:int = 3;
       
      
      private var _windowManager:IHabboWindowManager;
      
      private var _assetLibrary:IAssetLibrary;
      
      private var var_17:IFrameWindow;
      
      private var var_392:String;
      
      private var var_2025:IWindowContainer;
      
      private var var_848:String;
      
      private var var_2802:IWindowContainer;
      
      private var _controller:HabboInventory;
      
      private var _toolbar:IHabboToolbar;
      
      private var var_1575:IWindowContainer;
      
      private var var_2026:IWindowContainer;
      
      private const const_1971:Point = new Point(120,150);
      
      public function InventoryMainView(param1:HabboInventory, param2:IHabboWindowManager, param3:IAssetLibrary)
      {
         var _loc6_:* = null;
         var _loc7_:* = null;
         super();
         this._controller = param1;
         this._assetLibrary = param3;
         this._windowManager = param2;
         var _loc4_:IAsset = this._assetLibrary.getAssetByName("inventory_xml");
         var _loc5_:XmlAsset = XmlAsset(_loc4_);
         this.var_17 = this._windowManager.buildFromXML(XML(_loc5_.content)) as IFrameWindow;
         if(this.var_17 != null)
         {
            this.var_17.position = this.const_1971;
            this.var_17.visible = false;
            this.var_17.procedure = this.windowEventProc;
            if(this._controller.isStandaloneAchievementListEnabled())
            {
               _loc6_ = ITabContextWindow(this.var_17.findChildByName("contentArea"));
               _loc7_ = ITabButtonWindow(this.var_17.findChildByName("achievements"));
               _loc6_.removeTabItem(_loc7_);
               --this.var_17.findChildByName("badges").x;
            }
            this.setCreditBalance(0);
            this.setPixelBalance(0);
            this.setClubStatus(0,0);
         }
      }
      
      public function get isVisible() : Boolean
      {
         return !!this.var_17 ? Boolean(this.var_17.visible) : false;
      }
      
      public function get isActive() : Boolean
      {
         return !!this.var_17 ? Boolean(this.var_17.getStateFlag(WindowState.const_89)) : false;
      }
      
      public function dispose() : void
      {
         this.var_1575 = null;
         this._controller = null;
         this.var_2025 = null;
         this.var_2802 = null;
         if(this.var_17)
         {
            this.var_17.dispose();
            this.var_17 = null;
         }
         if(this._toolbar)
         {
            if(this._toolbar.events)
            {
               this._toolbar.events.removeEventListener(HabboToolbarEvent.const_49,this.onHabboToolbarEvent);
            }
            this._toolbar = null;
         }
         this._windowManager = null;
         this._assetLibrary = null;
      }
      
      public function getWindow() : IFrameWindow
      {
         return this.var_17;
      }
      
      public function getCategoryViewId() : String
      {
         return this.var_392;
      }
      
      public function getSubCategoryViewId() : String
      {
         return this.var_848;
      }
      
      public function hideInventory() : void
      {
         this._controller.closingInventoryView();
         var _loc1_:IWindow = this.getWindow();
         if(_loc1_ == null)
         {
            return;
         }
         _loc1_.visible = false;
      }
      
      public function showInventory() : void
      {
         var _loc1_:IWindow = this.getWindow();
         if(_loc1_ == null)
         {
            return;
         }
         _loc1_.visible = true;
         this._controller.inventoryViewOpened(this.var_848);
      }
      
      public function toggleCategoryView(param1:String, param2:Boolean = true, param3:Boolean = false) : void
      {
         var _loc4_:IWindow = this.getWindow();
         if(_loc4_ == null)
         {
            return;
         }
         if(_loc4_.visible)
         {
            if(this.var_392 == param1)
            {
               if(param2)
               {
                  if(WindowToggle.isHiddenByOtherWindows(_loc4_))
                  {
                     _loc4_.activate();
                  }
                  else
                  {
                     this.hideInventory();
                  }
               }
            }
            else
            {
               this.setViewToCategory(param1);
            }
         }
         else
         {
            if(param3 && this.var_392 != null && this.var_392 != param1)
            {
               this.setViewToCategory(param1);
               return;
            }
            _loc4_.visible = true;
            _loc4_.activate();
            if(param1 != this.var_392 || !this._controller.isInventoryCategoryInit(param1))
            {
               this.setViewToCategory(param1);
            }
            this._controller.inventoryViewOpened(param1);
         }
      }
      
      public function toggleSubCategoryView(param1:String, param2:Boolean = true) : void
      {
         var _loc3_:IWindow = this.getWindow();
         if(_loc3_ == null)
         {
            return;
         }
         if(_loc3_.visible)
         {
            if(this.var_848 == param1)
            {
               if(param2)
               {
                  _loc3_.visible = false;
               }
            }
            else
            {
               this.setSubViewToCategory(param1);
            }
         }
         else
         {
            _loc3_.visible = true;
            if(param1 != this.var_848)
            {
               this.setSubViewToCategory(param1);
            }
         }
      }
      
      public function updateSubCategoryView() : void
      {
         if(this.var_848 == null)
         {
            return;
         }
         this.setSubViewToCategory(this.var_848);
      }
      
      public function setCreditBalance(param1:int) : void
      {
         this._windowManager.registerLocalizationParameter("inventory.purse.creditbalance","balance",String(param1));
      }
      
      public function setPixelBalance(param1:int) : void
      {
         this._windowManager.registerLocalizationParameter("inventory.purse.pixelbalance","balance",String(param1));
      }
      
      public function setClubStatus(param1:int, param2:int) : void
      {
         this._windowManager.registerLocalizationParameter("inventory.purse.clubdays","months",String(param1));
         this._windowManager.registerLocalizationParameter("inventory.purse.clubdays","days",String(param2));
      }
      
      public function setToolbar(param1:IHabboToolbar) : void
      {
         this._toolbar = param1;
         this._toolbar.events.addEventListener(HabboToolbarEvent.const_49,this.onHabboToolbarEvent);
      }
      
      private function resetUnseenCounters(param1:String) : void
      {
         switch(param1)
         {
            case InventoryCategory.const_74:
               this._controller.furniModel.resetUnseenItems();
               break;
            case InventoryCategory.const_130:
               this._controller.petsModel.resetUnseenItems();
               break;
            case InventoryCategory.const_275:
               this._controller.badgesModel.resetUnseenItems();
         }
      }
      
      private function setViewToCategory(param1:String) : void
      {
         if(param1 == null)
         {
            return;
         }
         if(param1 == "")
         {
            return;
         }
         if(param1 != this.var_392)
         {
            this.resetUnseenCounters(this.var_392);
         }
         this._controller.checkCategoryInitilization(param1);
         var _loc2_:ITabContextWindow = this.var_17.findChildByName("contentArea") as ITabContextWindow;
         if(_loc2_ == null)
         {
            return;
         }
         _loc2_.container.removeChild(this.var_2025);
         _loc2_.invalidate();
         var _loc3_:IWindowContainer = this._controller.getCategoryWindowContainer(param1);
         if(_loc3_ == null)
         {
            return;
         }
         _loc3_.visible = true;
         _loc2_.container.addChild(_loc3_);
         this.var_2025 = _loc3_;
         this.var_392 = param1;
         _loc2_.selector.setSelected(_loc2_.selector.getSelectableByName(param1));
      }
      
      private function setSubViewToCategory(param1:String) : void
      {
         if(param1 == null || param1 == "")
         {
            return;
         }
         this._controller.checkCategoryInitilization(param1);
         var _loc2_:IWindowContainer = this.var_17.findChildByName("subContentArea") as IWindowContainer;
         while(_loc2_.numChildren > 0)
         {
            _loc2_.removeChildAt(0);
         }
         var _loc3_:IWindowContainer = this._controller.getCategorySubWindowContainer(param1);
         if(_loc3_ != null)
         {
            _loc2_.visible = true;
            _loc3_.visible = true;
            _loc2_.height = _loc3_.height;
            _loc2_.addChild(_loc3_);
         }
         else
         {
            _loc2_.visible = false;
            _loc2_.height = 0;
         }
         this.var_17.resizeToFitContent();
         if(this.var_17.parent != null)
         {
            if(this.var_17.x + this.var_17.width > this.var_17.parent.width)
            {
               this.var_17.x = this.var_17.parent.width - this.var_17.width;
            }
            if(this.var_17.y + this.var_17.height > this.var_17.parent.height)
            {
               this.var_17.y = this.var_17.parent.height - this.var_17.height;
            }
         }
         this.var_2802 = _loc3_;
         this.var_848 = param1;
      }
      
      private function onHabboToolbarEvent(param1:HabboToolbarEvent) : void
      {
         if(param1.iconId != HabboToolbarIconEnum.INVENTORY)
         {
            return;
         }
         if(param1.type == HabboToolbarEvent.const_49)
         {
            if(this.var_392 == InventoryCategory.const_130)
            {
               this.toggleCategoryView(InventoryCategory.const_130);
            }
            else if(this.var_392 == InventoryCategory.const_74)
            {
               this.toggleCategoryView(InventoryCategory.const_74);
            }
            else if(this._controller != null)
            {
               this._controller.toggleInventoryPage(InventoryCategory.const_74);
            }
         }
      }
      
      public function windowEventProc(param1:WindowEvent, param2:IWindow) : void
      {
         var _loc3_:* = null;
         if(param1.type == WindowEvent.const_50)
         {
            _loc3_ = ITabContextWindow(param2).selector.getSelected().name;
            if(_loc3_ != this.var_392)
            {
               this._controller.toggleInventoryPage(_loc3_);
            }
         }
         else if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            if(param2.name == "header_button_close")
            {
               this.hideInventory();
            }
         }
      }
      
      public function updateUnseenItemCounts() : void
      {
         this.updateUnseenFurniCount();
         this.updateUnseenBadgeCount();
      }
      
      private function updateUnseenFurniCount() : void
      {
         if(!this.var_1575)
         {
            this.var_1575 = this.createCounter("furni");
         }
         var _loc1_:int = this._controller.furniModel.getUnseenItemCount() + this._controller.petsModel.getUnseenItemCount();
         this.updateCounter(this.var_1575,_loc1_);
         this._controller.furniModel.updateView();
         this._controller.petsModel.updateView();
      }
      
      private function updateUnseenBadgeCount() : void
      {
         if(!this.var_2026)
         {
            this.var_2026 = this.createCounter("badges");
         }
         var _loc1_:int = this._controller.badgesModel.getUnseenItemCount();
         this.updateCounter(this.var_2026,_loc1_);
         this._controller.badgesModel.updateView();
      }
      
      private function createCounter(param1:String) : IWindowContainer
      {
         var _loc2_:XmlAsset = this._assetLibrary.getAssetByName("unseen_items_counter_xml") as XmlAsset;
         var _loc3_:IWindowContainer = this._windowManager.buildFromXML(_loc2_.content as XML) as IWindowContainer;
         var _loc4_:IWindowContainer = this.var_17.findChildByName(param1) as IWindowContainer;
         if(_loc4_)
         {
            _loc4_.addChild(_loc3_);
            _loc3_.x = _loc4_.width - _loc3_.width - const_1071;
            _loc3_.y = const_1071;
         }
         return _loc3_;
      }
      
      private function updateCounter(param1:IWindowContainer, param2:int) : void
      {
         param1.findChildByName("count").caption = param2.toString();
         param1.visible = param2 > 0;
      }
   }
}
