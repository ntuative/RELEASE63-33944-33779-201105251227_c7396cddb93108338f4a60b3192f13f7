package com.sulake.habbo.quest
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IDesktopWindow;
   import com.sulake.core.window.components.IFrameWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.incoming.quest.QuestMessageData;
   import com.sulake.habbo.communication.messages.outgoing.quest.StartCampaignMessageComposer;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.utils.Timer;
   
   public class QuestTracker implements IDisposable
   {
      
      private static const const_298:int = 0;
      
      private static const const_1016:int = 1;
      
      private static const const_1017:int = 2;
      
      private static const const_1012:int = 3;
      
      private static const const_1020:int = 4;
      
      private static const const_1014:int = 5;
      
      private static const const_1010:int = 6;
      
      private static const const_1397:int = 72;
      
      private static const const_1391:int = 4;
      
      private static const const_1019:Array = [-2,-3,-2,0,2,3,2,0,2,1,0,1];
      
      private static const const_1013:Array = [1,1,2,2,3,3,4,4,5,5,6,6,4];
      
      private static const const_1018:int = 6;
      
      private static const const_1390:int = 4;
      
      private static const const_649:int = 2;
      
      private static const const_1015:int = 200;
      
      private static const const_299:Array = ["a","b","c","d"];
      
      private static const const_1011:int = 10000;
      
      private static const const_1398:int = 0;
      
      private static const const_648:int = -1;
      
      private static const const_1393:Point = new Point(10,87);
      
      private static const const_1392:int = 162;
      
      private static const const_1394:Number = 0.01;
      
      private static const const_1395:Number = 100;
      
      private static const const_1396:int = 1000;
       
      
      private var _questEngine:HabboQuestEngine;
      
      private var var_200:QuestMessageData;
      
      private var _window:IWindowContainer;
      
      private var var_499:Timer;
      
      private var var_740:ProgressBar;
      
      private var var_300:int = 0;
      
      private var var_926:int = 0;
      
      private var var_1436:int = 0;
      
      private var var_1148:int = -1;
      
      private var var_739:int = -1;
      
      private var var_925:int = -1;
      
      private var var_1149:int;
      
      private var var_1437:int;
      
      private var var_2375:Boolean;
      
      public function QuestTracker(param1:HabboQuestEngine)
      {
         super();
         this._questEngine = param1;
      }
      
      public function dispose() : void
      {
         this._questEngine = null;
         this.var_200 = null;
         if(this._window)
         {
            this._window.dispose();
            this._window = null;
         }
         if(this.var_499)
         {
            this.var_499.stop();
            this.var_499 = null;
         }
         if(this.var_740)
         {
            this.var_740.dispose();
            this.var_740 = null;
         }
      }
      
      public function get disposed() : Boolean
      {
         return this._questEngine == null;
      }
      
      public function onQuestCompleted(param1:QuestMessageData) : void
      {
         if(this._window)
         {
            this.clearPrompt();
            this.var_200 = param1;
            this.var_926 = 0;
            this.refreshTrackerDetails();
            this.var_1148 = 0;
            this.var_300 = const_1012;
         }
      }
      
      public function onQuestCancelled() : void
      {
         this.var_200 = null;
         if(this._window)
         {
            this.clearPrompt();
            this.var_740.refresh(0,100,-1);
            this.var_300 = const_1017;
         }
      }
      
      public function onRoomEnter() : void
      {
         var _loc3_:int = 0;
         var _loc1_:Boolean = Boolean(parseInt(this._questEngine.configuration.getKey("new.identity","0")));
         var _loc2_:String = this.getDefaultCampaign();
         if(this.var_499 == null && _loc1_ && _loc2_ != "" && this._questEngine.isQuestingEnabled())
         {
            _loc3_ = int(this._questEngine.configuration.getKey("questing.startQuestDelayInSeconds","30"));
            this.var_499 = new Timer(_loc3_ * 1000,1);
            this.var_499.addEventListener(TimerEvent.TIMER,this.onStartQuestTimer);
            this.var_499.start();
            Logger.log("Initialized start quest timer with period: " + _loc3_);
         }
      }
      
      public function onRoomExit() : void
      {
         if(this._window != null && this._window.visible)
         {
            this._window.findChildByName("more_info_txt").visible = false;
            this._window.findChildByName("more_info_region").visible = false;
         }
      }
      
      public function onQuest(param1:QuestMessageData) : void
      {
         var _loc2_:Boolean = this._window && this._window.visible;
         this.var_200 = param1;
         this.prepareTrackerWindow();
         this.refreshTrackerDetails();
         this.refreshPromptFrames();
         this.hideSuccessFrames();
         if(_loc2_)
         {
            this.setupPrompt(this.var_739,const_1390,false);
         }
         else
         {
            this._window.x = this._window.desktop.width;
            this.var_300 = const_1016;
            this.setupPrompt(const_1398,const_649,false);
         }
         this._window.visible = true;
         this._questEngine.notifications.setQuestTrackerVisible(true);
      }
      
      private function refreshPromptFrames() : void
      {
         if(!this._questEngine.isQuestWithPrompts(this.var_200))
         {
            return;
         }
         var _loc1_:int = 0;
         while(_loc1_ < const_299.length)
         {
            this._questEngine.setupPromptFrameImage(this._window,this.var_200,const_299[_loc1_]);
            _loc1_++;
         }
      }
      
      private function prepareTrackerWindow() : void
      {
         if(this._window != null)
         {
            return;
         }
         this._window = IWindowContainer(this._questEngine.getXmlWindow("QuestTracker"));
         this._window.y = const_1397;
         this._window.findChildByName("more_info_region").procedure = this.onMoreInfo;
         new PendingImage(this._questEngine,this._window.findChildByName("quest_tracker_bg"),"quest_tracker_with_bar");
         var _loc1_:int = 1;
         while(_loc1_ <= const_1018)
         {
            new PendingImage(this._questEngine,this.getSuccessFrame(_loc1_),"checkanim" + _loc1_);
            _loc1_++;
         }
         this.hideSuccessFrames();
         this.var_740 = new ProgressBar(this._questEngine,IWindowContainer(this._window.findChildByName("content_cont")),const_1392,"quests.tracker.progress",false,const_1393);
      }
      
      private function hideSuccessFrames() : void
      {
         var _loc1_:int = 1;
         while(_loc1_ <= const_1018)
         {
            this.getSuccessFrame(_loc1_).visible = false;
            _loc1_++;
         }
      }
      
      private function hidePromptFrames() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < const_299.length)
         {
            this.getPromptFrame(const_299[_loc1_]).visible = false;
            _loc1_++;
         }
      }
      
      private function getSuccessFrame(param1:int) : IBitmapWrapperWindow
      {
         return IBitmapWrapperWindow(this._window.findChildByName("success_pic_" + param1));
      }
      
      private function getPromptFrame(param1:String) : IBitmapWrapperWindow
      {
         return IBitmapWrapperWindow(this._window.findChildByName("prompt_pic_" + param1));
      }
      
      private function refreshTrackerDetails() : void
      {
         this._questEngine.localization.registerParameter("quests.tracker.caption","quest_name",this._questEngine.getQuestName(this.var_200));
         this._window.findChildByName("desc_txt").caption = this._questEngine.getQuestDesc(this.var_200);
         this._window.findChildByName("more_info_txt").visible = true;
         this._window.findChildByName("more_info_region").visible = true;
         var _loc1_:int = Math.round(100 * this.var_200.completedSteps / this.var_200.totalSteps);
         this.var_740.refresh(_loc1_,100,this.var_200.id);
         this._questEngine.setupQuestImage(this._window,this.var_200);
      }
      
      private function onMoreInfo(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            this._questEngine.questController.questDetails.showDetails(this.var_200);
         }
      }
      
      public function update(param1:uint) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         if(this._window == null)
         {
            return;
         }
         this.var_740.updateView();
         switch(this.var_300)
         {
            case const_1016:
               _loc2_ = this.getDefaultLocationX();
               _loc3_ = this._window.x - _loc2_;
               if(_loc3_ > 0)
               {
                  _loc4_ = Math.max(1,Math.round(_loc3_ * param1 * const_1394));
                  this._window.x -= _loc4_;
               }
               else
               {
                  this.var_300 = const_298;
                  this._window.x = _loc2_;
               }
               break;
            case const_1017:
               _loc2_ = this._window.desktop.width;
               _loc3_ = _loc2_ - this._window.x;
               if(_loc3_ > 0)
               {
                  _loc4_ = Math.max(1,Math.round(param1 * const_1395 / _loc3_));
                  this._window.x += _loc4_;
               }
               else
               {
                  this.var_300 = const_298;
                  this._window.x = _loc2_;
                  this._window.visible = false;
                  this._questEngine.notifications.setQuestTrackerVisible(false);
               }
               break;
            case const_1012:
               this.hideSuccessFrames();
               this.getSuccessFrame(const_1013[this.var_1148]).visible = true;
               ++this.var_1148;
               if(this.var_1148 >= const_1013.length)
               {
                  this.var_300 = const_1014;
                  this.var_1436 = const_1396;
               }
               break;
            case const_1010:
               this.setQuestImageVisible(false);
               this.hidePromptFrames();
               this.var_1149 -= param1;
               this.getPromptFrame(const_299[this.var_925]).visible = true;
               if(this.var_1149 < 0)
               {
                  this.var_1149 = const_1015;
                  ++this.var_925;
                  if(this.var_925 >= const_299.length)
                  {
                     this.var_925 = 0;
                     --this.var_1437;
                     if(this.var_1437 < 1)
                     {
                        this.setupPrompt(const_1011,const_649,true);
                        this.var_300 = const_298;
                     }
                  }
               }
               break;
            case const_1020:
               if(this.var_926 >= -1)
               {
                  this._window.x = this.getDefaultLocationX();
                  this.var_300 = const_298;
                  this.setupPrompt(const_1011,const_649,false);
               }
               else
               {
                  this._window.x = this.getDefaultLocationX() + const_1019[this.var_926];
                  ++this.var_926;
               }
               break;
            case const_1014:
               this.var_1436 -= param1;
               if(this.var_1436 < 0)
               {
                  this.var_300 = const_298;
                  this._window.visible = false;
               }
               break;
            case const_298:
               if(this.var_739 != const_648)
               {
                  this.var_739 -= param1;
                  if(this.var_739 < 0)
                  {
                     this.var_739 = const_648;
                     if(this.var_200 != null && this._questEngine.isQuestWithPrompts(this.var_200))
                     {
                        if(this.var_2375)
                        {
                           this.startNudge();
                        }
                        else
                        {
                           this.var_300 = const_1010;
                           this.var_925 = 0;
                           this.var_1149 = const_1015;
                        }
                     }
                  }
               }
         }
      }
      
      private function getDefaultLocationX() : int
      {
         return this._window.desktop.width - this._window.width - const_1391;
      }
      
      public function isVisible() : Boolean
      {
         return this._window && this._window.visible;
      }
      
      private function onStartQuestTimer(param1:TimerEvent) : void
      {
         if(this.hasBlockingWindow())
         {
            Logger.log("Quest start blocked. Waiting some more");
            this.var_499.reset();
            this.var_499.start();
         }
         else
         {
            this._questEngine.questController.questDetails.openForNextQuest = this._questEngine.configuration.getKey("questing.showDetailsForNextQuest") == "true";
            this._questEngine.send(new StartCampaignMessageComposer(this.getDefaultCampaign()));
         }
      }
      
      private function getDefaultCampaign() : String
      {
         var _loc1_:String = this._questEngine.configuration.getKey("questing.defaultCampaign");
         return _loc1_ == null ? "" : _loc1_;
      }
      
      private function hasBlockingWindow() : Boolean
      {
         var _loc2_:* = null;
         var _loc1_:int = 0;
         while(_loc1_ <= 2)
         {
            _loc2_ = this._questEngine.windowManager.getDesktop(_loc1_);
            if(_loc2_ != null && this.hasBlockingWindowInLayer(_loc2_))
            {
               return true;
            }
            _loc1_++;
         }
         return false;
      }
      
      private function hasBlockingWindowInLayer(param1:IWindowContainer) : Boolean
      {
         var _loc2_:int = 0;
         var _loc3_:* = null;
         while(_loc2_ < param1.numChildren)
         {
            _loc3_ = param1.getChildAt(_loc2_);
            if(_loc3_ != null && _loc3_.visible)
            {
               if(_loc3_ as IFrameWindow != null)
               {
                  if(_loc3_.name != "mod_start_panel")
                  {
                     return true;
                  }
               }
               else if(_loc3_.name == "welcome_screen")
               {
                  return true;
               }
            }
            _loc2_++;
         }
         return false;
      }
      
      private function setQuestImageVisible(param1:Boolean) : void
      {
         this._window.findChildByName("quest_pic_bitmap").visible = param1;
      }
      
      private function clearPrompt() : void
      {
         this.setupPrompt(const_648,0,false);
      }
      
      private function setupPrompt(param1:int, param2:int, param3:Boolean) : void
      {
         this.setQuestImageVisible(true);
         this.hidePromptFrames();
         this.var_739 = param1;
         this.var_1437 = param2;
         this.var_2375 = param3;
      }
      
      private function startNudge() : void
      {
         this.var_926 = 0;
         this.var_300 = const_1020;
      }
   }
}
