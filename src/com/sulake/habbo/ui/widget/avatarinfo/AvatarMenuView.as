package com.sulake.habbo.ui.widget.avatarinfo
{
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IInteractiveWindow;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.tracking.HabboTracking;
   import com.sulake.habbo.ui.widget.events.RoomWidgetUserInfoUpdateEvent;
   import com.sulake.habbo.ui.widget.messages.RoomWidgetMessage;
   import com.sulake.habbo.ui.widget.messages.RoomWidgetUserActionMessage;
   import flash.geom.Point;
   
   public class AvatarMenuView extends AvatarInfoView
   {
      
      protected static const const_1345:uint = 0;
      
      protected static const const_362:uint = 1;
      
      protected static const const_990:uint = 2;
      
      protected static var var_1372:uint = const_362;
      
      private static const const_1530:uint = 4281149991;
      
      private static const const_1529:uint = 4283715916;
      
      private static const const_1533:uint = 16777215;
      
      private static const const_1531:uint = 9552639;
      
      private static const const_1528:uint = 16744755;
      
      private static const const_1532:uint = 16756591;
       
      
      protected var _data:AvatarInfoData;
      
      protected var var_338:uint = 1;
      
      protected var var_1367:Boolean;
      
      public function AvatarMenuView(param1:AvatarInfoWidget)
      {
         super(param1);
         var_1626 = false;
      }
      
      public static function setup(param1:AvatarMenuView, param2:int, param3:String, param4:int, param5:int, param6:AvatarInfoData) : void
      {
         param1._data = param6;
         AvatarInfoView.setup(param1,param2,param3,param4,param5,false);
      }
      
      override public function dispose() : void
      {
         if(_window)
         {
            _window.removeEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER,this.onMouseHoverEvent);
            _window.removeEventListener(WindowMouseEvent.const_25,this.onMouseHoverEvent);
         }
         this._data = null;
         super.dispose();
      }
      
      override protected function updateWindow() : void
      {
         var _loc1_:* = null;
         if(!_widget || true || true)
         {
            return;
         }
         if(!_window)
         {
            _loc1_ = XmlAsset(_widget.assets.getAssetByName("avatar_menu_widget")).content as XML;
            _window = _widget.windowManager.buildFromXML(_loc1_,0) as IWindowContainer;
            if(!_window)
            {
               return;
            }
            _window.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER,this.onMouseHoverEvent);
            _window.addEventListener(WindowMouseEvent.const_25,this.onMouseHoverEvent);
            _window.findChildByName("link_moderate").procedure = this.buttonEventProc;
            _window.findChildByName("link_show_actions").procedure = this.buttonEventProc;
            _window.findChildByName("link_more_actions").procedure = this.buttonEventProc;
         }
         _window.findChildByName("name").caption = _userName;
         this.updateButtons();
         _window.visible = false;
      }
      
      protected function updateButtons() : void
      {
         var _loc4_:int = 0;
         var _loc5_:* = null;
         var _loc6_:Boolean = false;
         var _loc1_:IItemListWindow = _window.findChildByName("buttons") as IItemListWindow;
         _loc1_.procedure = this.buttonEventProc;
         _loc1_.autoArrangeItems = false;
         var _loc2_:int = _loc1_.numListItems;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc1_.getListItemAt(_loc3_).visible = false;
            _loc3_++;
         }
         if(!this.var_1367)
         {
            if(this._data.isIgnored)
            {
               this.var_338 = const_990;
            }
            else
            {
               this.var_338 = var_1372;
            }
         }
         if(this.var_338 == const_1345)
         {
            _window.findChildByName("link_moderate").visible = false;
            _window.findChildByName("link_show_actions").visible = false;
            _window.findChildByName("link_more_actions").visible = true;
         }
         if(this.var_338 == const_1345 || this.var_338 == const_362)
         {
            _loc1_.getListItemByName("friend").visible = true;
            if(this._data.canBeAskedAsFriend)
            {
               this.toggleButtonElement(_loc1_.getListItemByName("friend"),true);
            }
            else
            {
               this.toggleButtonElement(_loc1_.getListItemByName("friend"),false);
               this.var_338 = const_362;
            }
         }
         if(this.var_338 == const_362)
         {
            _window.findChildByName("link_moderate").visible = true;
            _window.findChildByName("link_show_actions").visible = false;
            _window.findChildByName("link_more_actions").visible = false;
            _loc4_ = this._data.respectLeft;
            _widget.localizations.registerParameter("infostand.button.respect","count",_loc4_.toString());
            _loc1_.getListItemByName("respect").visible = true;
            if(_loc4_ > 0)
            {
               this.toggleButtonElement(_loc1_.getListItemByName("respect"),true);
            }
            else
            {
               this.toggleButtonElement(_loc1_.getListItemByName("respect"),false);
            }
            _loc1_.getListItemByName("trade").visible = true;
            if(this._data.canTrade)
            {
               this.toggleButtonElement(_loc1_.getListItemByName("trade"),true);
            }
            else
            {
               this.toggleButtonElement(_loc1_.getListItemByName("trade"),false);
            }
            switch(this._data.canTradeReason)
            {
               case RoomWidgetUserInfoUpdateEvent.const_955:
                  _loc5_ = "${infostand.button.trade.tooltip.shutdown}";
                  break;
               case RoomWidgetUserInfoUpdateEvent.const_779:
                  _loc5_ = "${infostand.button.trade.tooltip.tradingroom}";
                  break;
               default:
                  _loc5_ = "";
            }
            IInteractiveWindow(IWindowContainer(_loc1_.getListItemByName("trade")).getChildByName("button")).toolTipCaption = _loc5_;
            _loc1_.getListItemByName("whisper").visible = true;
         }
         if(this.var_338 == const_990)
         {
            _window.findChildByName("link_moderate").visible = false;
            _window.findChildByName("link_show_actions").visible = true;
            _window.findChildByName("link_more_actions").visible = false;
            _loc1_.getListItemByName("ignore").visible = !this._data.isIgnored;
            _loc1_.getListItemByName("unignore").visible = this._data.isIgnored;
            _loc1_.getListItemByName("kick").visible = (this._data.amIOwner || this._data.amIController || this._data.amIAnyRoomController) && this._data.canBeKicked;
            _loc1_.getListItemByName("ban").visible = (this._data.amIOwner || this._data.amIAnyRoomController) && this._data.canBeKicked;
            _loc6_ = false;
            if(false && _widget.configuration.getKey("infostand.report.show","0") == "1")
            {
               _loc6_ = true;
            }
            _loc1_.getListItemByName("report").visible = _loc6_;
            if(this._data.amIOwner)
            {
               _loc1_.getListItemByName("give_rights").visible = !this._data.hasFlatControl;
               _loc1_.getListItemByName("remove_rights").visible = this._data.hasFlatControl;
            }
            else
            {
               _loc1_.getListItemByName("give_rights").visible = false;
               _loc1_.getListItemByName("remove_rights").visible = false;
            }
         }
         _loc1_.autoArrangeItems = true;
         _loc1_.visible = true;
         var_1372 = this.var_338;
         this.var_1367 = false;
      }
      
      private function toggleButtonElement(param1:IWindow, param2:Boolean) : void
      {
         param1.visible = param2;
      }
      
      private function buttonEventProc(param1:WindowEvent, param2:IWindow) : void
      {
         var _loc4_:* = null;
         var _loc5_:int = 0;
         var _loc6_:* = null;
         if(disposed)
         {
            return;
         }
         if(!_window || false)
         {
            return;
         }
         var _loc3_:Boolean = false;
         if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            if(param2.name == "button")
            {
               _loc3_ = true;
               switch(param2.parent.name)
               {
                  case "whisper":
                     _loc4_ = "null";
                     break;
                  case "friend":
                     param2.disable();
                     this._data.canBeAskedAsFriend = false;
                     _loc4_ = "null";
                     break;
                  case "respect":
                     --this._data.respectLeft;
                     _loc5_ = this._data.respectLeft;
                     _widget.localizations.registerParameter("infostand.button.respect","count",_loc5_.toString());
                     if(this._data.respectLeft > 0)
                     {
                        this.toggleButtonElement(param2.parent,true);
                     }
                     else
                     {
                        this.toggleButtonElement(param2.parent,false);
                     }
                     _loc4_ = "null";
                     if(_loc5_ > 0)
                     {
                        _loc3_ = false;
                     }
                     break;
                  case "ignore":
                     param2.parent.visible = false;
                     _window.findChildByName("unignore").visible = true;
                     this._data.isIgnored = true;
                     _loc4_ = "null";
                     break;
                  case "unignore":
                     param2.parent.visible = false;
                     _window.findChildByName("ignore").visible = true;
                     this._data.isIgnored = false;
                     _loc4_ = "null";
                     break;
                  case "kick":
                     _loc4_ = "null";
                     break;
                  case "ban":
                     _loc4_ = "null";
                     break;
                  case "give_rights":
                     param2.parent.visible = false;
                     _window.findChildByName("remove_rights").visible = true;
                     this._data.hasFlatControl = true;
                     _loc4_ = "null";
                     break;
                  case "remove_rights":
                     param2.parent.visible = false;
                     _window.findChildByName("give_rights").visible = true;
                     this._data.hasFlatControl = false;
                     _loc4_ = "null";
                     break;
                  case "trade":
                     _loc4_ = "null";
                     break;
                  case "report":
                     _loc4_ = "null";
               }
            }
            else
            {
               switch(param2.name)
               {
                  case "link_moderate":
                     this.var_338 = const_990;
                     this.var_1367 = true;
                     break;
                  case "link_show_actions":
                     this.var_338 = const_362;
                     this.var_1367 = true;
                     break;
                  case "link_more_actions":
                     this.var_338 = const_362;
                     this.var_1367 = true;
               }
            }
            if(_loc4_ != null)
            {
               _loc6_ = new RoomWidgetUserActionMessage(_loc4_,_userId);
               _widget.messageListener.processWidgetMessage(_loc6_);
               HabboTracking.getInstance().trackConversionPoint("InfoStand","click",_loc4_);
            }
            this.updateButtons();
         }
         else if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER)
         {
            if(param2.name == "button")
            {
               param2.color = const_1529;
            }
            else if(param2.tags.indexOf("link") > -1)
            {
               if(param2.tags.indexOf("actions") > -1)
               {
                  ITextWindow(IWindowContainer(param2).getChildAt(0)).textColor = const_1531;
               }
               else if(param2.tags.indexOf("moderate") > -1)
               {
                  ITextWindow(IWindowContainer(param2).getChildAt(0)).textColor = const_1532;
               }
            }
         }
         else if(param1.type == WindowMouseEvent.const_25)
         {
            if(param2.name == "button")
            {
               param2.color = const_1530;
            }
            else if(param2.tags.indexOf("link") > -1)
            {
               if(param2.tags.indexOf("actions") > -1)
               {
                  ITextWindow(IWindowContainer(param2).getChildAt(0)).textColor = const_1533;
               }
               else if(param2.tags.indexOf("moderate") > -1)
               {
                  ITextWindow(IWindowContainer(param2).getChildAt(0)).textColor = const_1528;
               }
            }
         }
         if(_loc3_)
         {
            _widget.removeView(this,false);
         }
      }
      
      protected function onMouseHoverEvent(param1:WindowMouseEvent) : void
      {
         if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER)
         {
            var_1350 = true;
         }
         else if(param1.type == WindowMouseEvent.const_25)
         {
            if(!_window.hitTestGlobalPoint(new Point(param1.stageX,param1.stageY)))
            {
               var_1350 = false;
            }
         }
      }
   }
}
