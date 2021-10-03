package com.sulake.habbo.quest
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.runtime.IUpdateReceiver;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IFrameWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.incoming.inventory.achievements.AchievementData;
   import com.sulake.habbo.communication.messages.outgoing.inventory.achievements.GetAchievementsComposer;
   import com.sulake.habbo.communication.messages.outgoing.tracking.ConversionPointMessageComposer;
   import com.sulake.habbo.session.BadgeInfo;
   import com.sulake.habbo.session.events.BadgeImageReadyEvent;
   import flash.display.BitmapData;
   import flash.events.TimerEvent;
   import flash.filters.ColorMatrixFilter;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.utils.Dictionary;
   import flash.utils.Timer;
   
   public class AchievementController implements IDisposable, IUpdateReceiver
   {
      
      private static const const_674:int = 3;
      
      private static const const_1558:int = 10;
      
      private static const const_1557:int = 8;
      
      private static const const_1553:int = 6;
      
      private static const const_1551:int = 3;
      
      private static const const_1554:int = 2;
      
      private static const const_1083:int = 6;
      
      private static const const_1560:int = 180;
      
      private static const const_1556:int = 246;
      
      private static const const_1488:int = 45;
      
      private static const const_1559:Point = new Point(115,93);
      
      private static const const_1552:Point = new Point(72,1);
      
      private static const const_1082:int = 40;
      
      private static const const_1550:int = 20;
      
      private static const const_1561:int = 3;
      
      private static const const_1555:int = 10;
       
      
      private var _questEngine:HabboQuestEngine;
      
      private var _window:IFrameWindow;
      
      private var var_672:IWindowContainer;
      
      private var var_851:IWindowContainer;
      
      private var var_459:IWindowContainer;
      
      private var var_1577:IWindowContainer;
      
      private var var_1050:IWindowContainer;
      
      private var var_1297:IWindowContainer;
      
      private var var_107:AchievementCategories;
      
      private var _category:AchievementCategory;
      
      private var var_69:AchievementData;
      
      private var var_437:Timer;
      
      private var var_850:Dictionary;
      
      private var var_673:ProgressBar;
      
      private var var_852:ProgressBar;
      
      private var var_1298:Matrix;
      
      private var var_2032:ColorMatrixFilter;
      
      private var var_1578:AchievementData;
      
      private var var_849:Timer;
      
      private var var_674:Dictionary;
      
      private var var_671:AchievementLevelUp;
      
      public function AchievementController(param1:HabboQuestEngine)
      {
         this.var_850 = new Dictionary();
         this.var_674 = new Dictionary();
         super();
         this._questEngine = param1;
         this.var_437 = new Timer(100,1);
         this.var_437.addEventListener(TimerEvent.TIMER,this.doBadgeRefresh);
         this.var_849 = new Timer(2000,1);
         this.var_849.addEventListener(TimerEvent.TIMER,this.switchIntoPendingLevel);
         this.var_671 = new AchievementLevelUp(this._questEngine);
         this.var_1298 = new Matrix();
         this.var_2032 = this.createGrayscaleFilter();
         this.var_674[16] = 1;
         this.var_674[28] = 6;
         this.var_674[38] = 4;
         this.var_674[39] = 3;
         this.var_674[40] = 1;
      }
      
      public static function moveAllChildrenToColumn(param1:IWindowContainer, param2:int, param3:int) : void
      {
         var _loc4_:int = 0;
         var _loc5_:* = null;
         while(_loc4_ < param1.numChildren)
         {
            _loc5_ = param1.getChildAt(_loc4_);
            if(_loc5_ != null && _loc5_.visible && _loc5_.height > 0)
            {
               _loc5_.y = param2;
               param2 += _loc5_.height + param3;
            }
            _loc4_++;
         }
      }
      
      public static function getLowestPoint(param1:IWindowContainer) : int
      {
         var _loc4_:* = null;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         while(_loc3_ < param1.numChildren)
         {
            _loc4_ = param1.getChildAt(_loc3_);
            if(_loc4_.visible)
            {
               _loc2_ = Math.max(_loc2_,_loc4_.y + _loc4_.height);
            }
            _loc3_++;
         }
         return _loc2_;
      }
      
      public function dispose() : void
      {
         this._questEngine = null;
         this.var_850 = null;
         if(this._window)
         {
            this._window.dispose();
            this._window = null;
         }
         if(this.var_437)
         {
            this.var_437.removeEventListener(TimerEvent.TIMER,this.doBadgeRefresh);
            this.var_437.reset();
            this.var_437 = null;
         }
         if(this.var_849)
         {
            this.var_849.removeEventListener(TimerEvent.TIMER,this.switchIntoPendingLevel);
            this.var_849.reset();
            this.var_849 = null;
         }
         if(this.var_673)
         {
            this.var_673.dispose();
            this.var_673 = null;
         }
         if(this.var_852)
         {
            this.var_852.dispose();
            this.var_852 = null;
         }
         if(this.var_671)
         {
            this.var_671.dispose();
            this.var_671 = null;
         }
         this.var_672 = null;
         this.var_459 = null;
         this.var_459 = null;
         this.var_1050 = null;
         this.var_1577 = null;
         this.var_1297 = null;
      }
      
      public function get disposed() : Boolean
      {
         return this._questEngine == null;
      }
      
      public function isVisible() : Boolean
      {
         return this._window && this._window.visible;
      }
      
      public function close() : void
      {
         if(this._window)
         {
            this._window.visible = false;
         }
      }
      
      public function onRoomExit() : void
      {
         this.close();
      }
      
      public function onToolbarClick() : void
      {
         if(this.isVisible())
         {
            this.close();
         }
         else
         {
            this.show();
         }
      }
      
      public function show() : void
      {
         if(this.var_107 == null)
         {
            this._questEngine.send(new GetAchievementsComposer());
         }
         else
         {
            this.refresh();
            this._window.visible = true;
            this._window.activate();
         }
      }
      
      public function onAchievements(param1:Array) : void
      {
         if(this.var_107 == null)
         {
            this.var_107 = new AchievementCategories(param1);
         }
         this.refresh();
         this._window.visible = true;
         this._window.activate();
      }
      
      public function onAchievement(param1:AchievementData) : void
      {
         var _loc2_:Boolean = false;
         if(this.var_107 != null)
         {
            _loc2_ = this.var_69 && this.var_69.type == param1.type;
            if(_loc2_ && param1.level > this.var_69.level)
            {
               this.var_69.setMaxProgress();
               this.var_1578 = param1;
               this.var_849.start();
            }
            else
            {
               this.var_107.update(param1);
               if(_loc2_)
               {
                  this.var_69 = param1;
               }
            }
            if(this._window && this._window.visible)
            {
               this.refresh();
            }
         }
      }
      
      private function refresh() : void
      {
         this.prepareWindow();
         this.refreshCategoryList();
         this.refreshCategoryListFooter();
         this.refreshAchievementsHeader();
         this.refreshAchievementsFooter();
         this.refreshAchievementList();
         this.refreshAchievementDetails();
         moveAllChildrenToColumn(this._window.content,0,4);
         this._window.height = getLowestPoint(this._window.content) + const_1488;
      }
      
      private function refreshCategoryList() : void
      {
         var _loc3_:Boolean = false;
         if(this._category != null)
         {
            this.var_672.visible = false;
            return;
         }
         this.var_672.visible = true;
         var _loc1_:Array = this.var_107.categoryList;
         var _loc2_:int = 0;
         while(true)
         {
            if(_loc2_ < _loc1_.length)
            {
               this.refreshCategoryEntry(_loc2_,_loc1_[_loc2_]);
            }
            else
            {
               _loc3_ = this.refreshCategoryEntry(_loc2_,null);
               if(_loc3_)
               {
                  break;
               }
            }
            _loc2_++;
         }
         this.var_672.height = getLowestPoint(this.var_672);
      }
      
      private function refreshCategoryListFooter() : void
      {
         if(this._category != null)
         {
            this.var_1297.visible = false;
            return;
         }
         this.var_1297.visible = true;
         this.var_852.refresh(this.var_107.getProgress(),this.var_107.getMaxProgress(),0);
      }
      
      private function refreshAchievementList() : void
      {
         var _loc3_:Boolean = false;
         if(this._category == null)
         {
            this.var_851.visible = false;
            return;
         }
         this.var_851.visible = true;
         Logger.log(this._category.code + " has " + this._category.achievements.length + " achievemenets");
         var _loc1_:Array = this._category.achievements;
         var _loc2_:int = 0;
         while(true)
         {
            if(_loc2_ < _loc1_.length)
            {
               this.refreshAchievementEntry(_loc2_,_loc1_[_loc2_]);
            }
            else
            {
               _loc3_ = this.refreshAchievementEntry(_loc2_,null);
               if(_loc3_)
               {
                  break;
               }
            }
            _loc2_++;
         }
         this.var_851.height = getLowestPoint(this.var_851);
      }
      
      private function refreshAchievementsHeader() : void
      {
         if(this._category == null)
         {
            this.var_1050.visible = false;
            return;
         }
         this.var_1050.visible = true;
         this.var_1050.findChildByName("category_name_txt").caption = this._questEngine.getAchievementCategoryName(this._category.code);
         this._questEngine.localization.registerParameter("achievements.details.categoryprogress","progress","" + this._category.getProgress());
         this._questEngine.localization.registerParameter("achievements.details.categoryprogress","limit","" + this._category.getMaxProgress());
         this._questEngine.setupAchievementCategoryImage(this.var_1050,this._category,false);
      }
      
      private function refreshAchievementsFooter() : void
      {
         if(this._category == null)
         {
            this.var_1577.visible = false;
            return;
         }
         this.var_1577.visible = true;
      }
      
      private function refreshAchievementDetails() : void
      {
         if(this.var_69 == null)
         {
            this.var_459.visible = false;
            return;
         }
         this.var_459.visible = true;
         var _loc1_:String = this.getAchievedBadgeId(this.var_69);
         this.var_459.findChildByName("achievement_name_txt").caption = this._questEngine.localization.getBadgeName(_loc1_);
         var _loc2_:String = this._questEngine.localization.getBadgeDesc(_loc1_);
         this.var_459.findChildByName("achievement_desc_txt").caption = _loc2_ == null ? "" : _loc2_;
         this._questEngine.localization.registerParameter("achievements.details.level","level","" + (!!this.var_69.finalLevel ? this.var_69.level : this.var_69.level - 1));
         this._questEngine.localization.registerParameter("achievements.details.level","limit","" + this.var_69.levelCount);
         this._questEngine.refreshReward(!this.var_69.finalLevel,this.var_459,this.var_69.levelRewardPointType,this.var_69.levelRewardPoints);
         this.refreshBadgeImageLarge(this.var_459,this.var_69);
         this.var_673.refresh(this.var_69.currentPoints,this.var_69.scoreLimit,this.var_69.type * 10000 + this.var_69.level);
         this.var_673.visible = !this.var_69.finalLevel;
      }
      
      private function prepareWindow() : void
      {
         if(this._window != null)
         {
            return;
         }
         this._window = IFrameWindow(this._questEngine.getXmlWindow("Achievements"));
         this._window.findChildByTag("close").procedure = this.onWindowClose;
         this._window.findChildByName("back_button").procedure = this.onBack;
         this._window.center();
         this._window.y = const_1550;
         this.var_672 = IWindowContainer(this._window.findChildByName("categories_cont"));
         this.var_1050 = IWindowContainer(this._window.findChildByName("achievements_header_cont"));
         this.var_851 = IWindowContainer(this._window.findChildByName("achievements_cont"));
         this.var_459 = IWindowContainer(this._window.findChildByName("achievement_cont"));
         this.var_1577 = IWindowContainer(this._window.findChildByName("achievements_footer_cont"));
         this.var_1297 = IWindowContainer(this._window.findChildByName("categories_footer_cont"));
         this.var_673 = new ProgressBar(this._questEngine,this.var_459,const_1560,"achievements.details.progress",true,const_1559);
         this.var_852 = new ProgressBar(this._questEngine,this.var_1297,const_1556,"achievements.categories.totalprogress",true,const_1552);
      }
      
      private function refreshCategoryEntry(param1:int, param2:AchievementCategory) : Boolean
      {
         var _loc3_:IWindowContainer = IWindowContainer(this.var_672.getChildByName("" + param1));
         var _loc4_:int = Math.floor(param1 / const_674);
         var _loc5_:* = _loc4_ < const_1551;
         if(_loc3_ == null)
         {
            if(param2 == null && !_loc5_)
            {
               return true;
            }
            _loc3_ = IWindowContainer(this._questEngine.getXmlWindow("AchievementCategory"));
            _loc3_.name = "" + param1;
            this.var_672.addChild(_loc3_);
            new PendingImage(this._questEngine,IBitmapWrapperWindow(_loc3_.findChildByName("category_bg_act")),"achievement_category_bkg_3");
            new PendingImage(this._questEngine,IBitmapWrapperWindow(_loc3_.findChildByName("category_bg_inact")),"achievement_category_bkg_empty_3");
            _loc3_.findChildByName("category_region").procedure = this.onSelectCategory;
            _loc3_.x = (_loc3_.width + const_1558) * (param1 % const_674);
            _loc3_.y = (_loc3_.height + const_1557) * Math.floor(param1 / const_674) + const_1553;
         }
         _loc3_.findChildByName("category_region").id = param1;
         _loc3_.findChildByName("category_region").visible = param2 != null;
         _loc3_.findChildByName("category_bg_inact").visible = param2 == null;
         _loc3_.findChildByName("category_bg_act").visible = param2 != null;
         _loc3_.findChildByName("header_txt").visible = param2 != null;
         _loc3_.findChildByName("completion_txt").visible = param2 != null;
         _loc3_.findChildByName("category_pic_bitmap").visible = param2 != null;
         if(param2)
         {
            _loc3_.findChildByName("header_txt").caption = this._questEngine.getAchievementCategoryName(param2.code);
            _loc3_.findChildByName("completion_txt").caption = param2.getProgress() + "/" + param2.getMaxProgress();
            this._questEngine.setupAchievementCategoryImage(_loc3_,param2,true);
            _loc3_.visible = true;
         }
         else if(_loc5_)
         {
            _loc3_.visible = true;
         }
         else
         {
            _loc3_.visible = false;
         }
         return false;
      }
      
      private function refreshAchievementEntry(param1:int, param2:AchievementData) : Boolean
      {
         var _loc9_:* = null;
         var _loc3_:IWindowContainer = IWindowContainer(this.var_851.getChildByName("" + param1));
         var _loc4_:int = Math.floor(param1 / const_1083);
         var _loc5_:* = _loc4_ < const_1554;
         if(_loc3_ == null)
         {
            if(param2 == null && !_loc5_)
            {
               return true;
            }
            _loc3_ = IWindowContainer(this._questEngine.getXmlWindow("Achievement"));
            _loc3_.name = "" + param1;
            this.var_851.addChild(_loc3_);
            _loc9_ = _loc3_.findChildByName("achievement_pic_bitmap") as IBitmapWrapperWindow;
            _loc9_.bitmap = new BitmapData(_loc9_.width,_loc9_.height,true,16777215);
            new PendingImage(this._questEngine,_loc3_.findChildByName("bg_selected_bitmap"),"achievement_active");
            new PendingImage(this._questEngine,_loc3_.findChildByName("bg_unselected_bitmap"),"achievement_inactive");
            _loc3_.x = _loc3_.width * (param1 % const_1083);
            _loc3_.y = _loc3_.height * _loc4_ + const_1561;
            _loc3_.findChildByName("bg_region").procedure = this.onSelectAchievement;
         }
         var _loc6_:IWindow = _loc3_.findChildByName("bg_region");
         _loc6_.id = param1;
         _loc6_.visible = param2 != null;
         var _loc7_:IWindow = _loc3_.findChildByName("bg_unselected_bitmap");
         var _loc8_:IWindow = _loc3_.findChildByName("bg_selected_bitmap");
         this.refreshBadgeImage(_loc3_,param2);
         if(param2)
         {
            _loc7_.visible = param2 != this.var_69;
            _loc8_.visible = param2 == this.var_69;
            _loc3_.visible = true;
         }
         else if(_loc5_)
         {
            _loc8_.visible = false;
            _loc7_.visible = true;
            _loc3_.visible = true;
         }
         else
         {
            _loc3_.visible = false;
         }
         return false;
      }
      
      private function onWindowClose(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            this.close();
         }
      }
      
      private function onSelectCategory(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var _loc3_:int = param2.id;
         Logger.log("Category index: " + _loc3_);
         this._category = this.var_107.categoryList[_loc3_];
         this.var_69 = this._category.achievements[0];
         Logger.log("Category: " + this._category.code);
         this.refresh();
         this._questEngine.send(new ConversionPointMessageComposer("Achievements",this._category.code,"Category selected"));
      }
      
      private function onSelectAchievement(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var _loc3_:int = param2.id;
         this.var_69 = this._category.achievements[_loc3_];
         this.refresh();
         this._questEngine.send(new ConversionPointMessageComposer("Achievements","" + this.var_69.type,"Achievement selected"));
      }
      
      private function onBack(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         this._category = null;
         this.var_69 = null;
         this.refresh();
      }
      
      private function refreshBadgeImage(param1:IWindowContainer, param2:AchievementData) : void
      {
         var _loc9_:* = null;
         var _loc3_:IBitmapWrapperWindow = param1.findChildByName("achievement_pic_bitmap") as IBitmapWrapperWindow;
         if(param2 == null)
         {
            _loc3_.visible = false;
            return;
         }
         var _loc4_:String = this.getAchievedBadgeId(param2);
         var _loc5_:BitmapData = this.var_850[_loc4_];
         var _loc6_:Boolean = false;
         if(_loc5_ == null)
         {
            _loc9_ = this._questEngine.sessionDataManager.getBadgeImageWithInfo(_loc4_);
            _loc5_ = _loc9_.image;
            _loc6_ = _loc9_.placeHolder;
            this.var_850[_loc4_] = _loc5_;
         }
         var _loc7_:int = const_1082 - _loc5_.height + this.getPositionFix(param2.type);
         var _loc8_:Point = new Point((_loc3_.width - _loc5_.width) / 2,!!_loc6_ ? Number(const_1555) : Number(_loc7_));
         _loc3_.bitmap.fillRect(_loc3_.bitmap.rect,16777215);
         if(param2.firstLevelAchieved)
         {
            _loc3_.bitmap.copyPixels(_loc5_,_loc5_.rect,_loc8_,null,null,true);
         }
         else
         {
            _loc3_.bitmap.applyFilter(_loc5_,_loc5_.rect,_loc8_,this.var_2032);
         }
         _loc3_.visible = false;
         _loc3_.visible = true;
      }
      
      private function refreshBadgeImageLarge(param1:IWindowContainer, param2:AchievementData) : void
      {
         var _loc3_:IBitmapWrapperWindow = param1.findChildByName("achievement_pic_bitmap") as IBitmapWrapperWindow;
         var _loc4_:String = this.getAchievedBadgeId(param2);
         var _loc5_:BitmapData = this.var_850[_loc4_];
         if(_loc5_ == null)
         {
            _loc5_ = this._questEngine.sessionDataManager.getBadgeImage(_loc4_);
            this.var_850[_loc4_] = _loc5_;
         }
         if(_loc3_.bitmap == null)
         {
            _loc3_.bitmap = new BitmapData(_loc3_.width,_loc3_.height,true,16777215);
         }
         var _loc6_:int = 2 * (const_1082 - _loc5_.height + this.getPositionFix(param2.type));
         this.var_1298.identity();
         this.var_1298.scale(2,2);
         this.var_1298.translate((_loc3_.width - _loc5_.width * 2) / 2,_loc6_);
         _loc3_.bitmap.fillRect(_loc3_.bitmap.rect,16777215);
         _loc3_.bitmap.draw(_loc5_,this.var_1298);
         if(!param2.firstLevelAchieved)
         {
            _loc3_.bitmap.applyFilter(_loc3_.bitmap,_loc3_.bitmap.rect,new Point(0,0),this.var_2032);
         }
         _loc3_.visible = false;
         _loc3_.visible = true;
      }
      
      private function doBadgeRefresh(param1:TimerEvent) : void
      {
         this.var_437.reset();
         this.refresh();
      }
      
      private function switchIntoPendingLevel(param1:TimerEvent) : void
      {
         this.var_69 = this.var_1578;
         this.var_107.update(this.var_1578);
         this.var_1578 = null;
         this.refresh();
      }
      
      public function onBadgeImageReady(param1:BadgeImageReadyEvent) : void
      {
         this.var_671.onBadgeImageReady(param1);
         if(this._window == null)
         {
            return;
         }
         this.var_850[param1.badgeId] = param1.badgeImage;
         if(!this.var_437.running)
         {
            this.var_437.start();
         }
      }
      
      private function createGrayscaleFilter() : ColorMatrixFilter
      {
         var _loc1_:* = 0.3333333333333333;
         var _loc2_:Number = 1 - _loc1_ * 2;
         var _loc3_:Array = [_loc2_,_loc1_,_loc1_,0,0,_loc1_,_loc2_,_loc1_,0,0,_loc1_,_loc1_,_loc2_,0,0,0,0,0,1,0];
         return new ColorMatrixFilter(_loc3_);
      }
      
      public function update(param1:uint) : void
      {
         if(this.var_673 != null)
         {
            this.var_673.updateView();
         }
         if(this.var_852 != null)
         {
            this.var_852.updateView();
         }
         if(this.var_671 != null)
         {
            this.var_671.update(param1);
         }
      }
      
      private function getAchievedBadgeId(param1:AchievementData) : String
      {
         return !!param1.finalLevel ? param1.badgeId : this._questEngine.localization.getPreviousLevelBadgeId(param1.badgeId);
      }
      
      private function getPositionFix(param1:int) : int
      {
         return !!this.var_674[param1] ? int(this.var_674[param1]) : 0;
      }
      
      public function get levelUpDialog() : AchievementLevelUp
      {
         return this.var_671;
      }
   }
}
