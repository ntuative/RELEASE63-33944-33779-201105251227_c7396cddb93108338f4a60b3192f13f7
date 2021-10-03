package com.sulake.habbo.quest
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IFrameWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.incoming.notifications.AchievementLevelUpData;
   import com.sulake.habbo.communication.messages.outgoing.tracking.ConversionPointMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.users.GetAchievementShareIdComposer;
   import com.sulake.habbo.session.events.BadgeImageReadyEvent;
   import com.sulake.habbo.utils.HabboWebTools;
   import flash.display.BitmapData;
   import flash.geom.Point;
   
   public class AchievementLevelUp implements IDisposable
   {
      
      private static const const_1359:int = 2000;
      
      private static const const_1358:int = 500;
       
      
      private var _window:IFrameWindow;
      
      private var _questEngine:HabboQuestEngine;
      
      private var var_63:AchievementLevelUpData;
      
      private var var_900:Array;
      
      private var var_901:int;
      
      public function AchievementLevelUp(param1:HabboQuestEngine)
      {
         this.var_900 = new Array();
         super();
         this._questEngine = param1;
      }
      
      public function dispose() : void
      {
         this._questEngine = null;
         this.var_900 = null;
         this.var_63 = null;
         if(this._window)
         {
            this._window.dispose();
            this._window = null;
         }
      }
      
      public function get disposed() : Boolean
      {
         return this._window == null;
      }
      
      public function onLevelUp(param1:AchievementLevelUpData) : void
      {
         this.var_900.push(param1);
         if(this._window == null || !this._window.visible)
         {
            this.var_901 = const_1359;
         }
      }
      
      private function close() : void
      {
         if(this._window)
         {
            this._window.visible = false;
            if(this.var_900.length > 0)
            {
               this.var_901 = const_1358;
            }
         }
      }
      
      private function show() : void
      {
         if(this.var_900.length < 1)
         {
            return;
         }
         this.var_63 = this.var_900.pop();
         if(this._window == null)
         {
            this._window = IFrameWindow(this._questEngine.getXmlWindow("AchievementLevelUp"));
            this._window.findChildByTag("close").procedure = this.onCloseLink;
            this._window.findChildByName("ok_button").procedure = this.onOkButton;
            this._window.findChildByName("share_button").procedure = this.onShareButton;
            new PendingImage(this._questEngine,this._window.findChildByName("reward_icon"),"ach_receive_star");
            this._window.findChildByName("achievements_link_region").procedure = this.onAchievementsLink;
            this._window.findChildByName("close_link_region").procedure = this.onCloseLink;
         }
         this.registerParameter("achievements.levelup.title","category",this._questEngine.getAchievementCategoryName(this.var_63.category));
         this.registerParameter("achievements.levelup.reward","amount","" + this.var_63.levelRewardPoints);
         this.registerParameter("achievements.levelup.reward","currency_name",this._questEngine.getActivityPointName(this.var_63.levelRewardPointType));
         this.registerParameter("achievements.levelup.score","amount","" + this.var_63.points);
         this.registerParameter("achievements.levelup.sharedesc","amount","" + this.var_63.bonusPoints);
         this._window.findChildByName("achievement_name_txt").caption = "\'" + this._questEngine.localization.getBadgeName(this.var_63.badgeCode) + "\'";
         var _loc1_:Boolean = this.isFacebookPostingEnabled();
         this._window.findChildByName("achievements_link_region").visible = !_loc1_;
         this._window.findChildByName("close_link_region").visible = _loc1_;
         this._window.findChildByName("ok_button").visible = !_loc1_;
         this._window.findChildByName("share_button").visible = _loc1_;
         this._window.findChildByName("facebook_info_txt").visible = _loc1_;
         this.setBadge(this._questEngine.sessionDataManager.getBadgeImage(this.var_63.badgeCode));
         this.doFacebookLogging();
      }
      
      private function isFacebookPostingEnabled() : Boolean
      {
         return this.var_63.bonusPoints > 0 && this.isPostingEnabled() && this._questEngine.configuration.keyExists("facebook.user");
      }
      
      private function isPostingEnabled() : Boolean
      {
         return this._questEngine.configuration.getKey("achievement.post.enabled","1") != "0";
      }
      
      private function doFacebookLogging() : void
      {
         var _loc1_:Boolean = this._questEngine.configuration.keyExists("facebook.user");
         var _loc2_:String = this.var_63.badgeCode;
         if(this.var_63.bonusPoints <= 0 || !this.isPostingEnabled())
         {
            this._questEngine.send(new ConversionPointMessageComposer("Achievements",_loc2_,"client.show.no_post"));
         }
         else if(_loc1_)
         {
            this._questEngine.send(new ConversionPointMessageComposer("Achievements",_loc2_,"client.show.post"));
         }
         else
         {
            this._questEngine.send(new ConversionPointMessageComposer("Achievements",_loc2_,"client.show.no_fb"));
         }
      }
      
      private function onOkButton(param1:WindowEvent, param2:IWindow = null) : void
      {
         if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            this.close();
         }
      }
      
      private function onCloseLink(param1:WindowEvent, param2:IWindow = null) : void
      {
         if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            this.close();
         }
      }
      
      private function onAchievementsLink(param1:WindowEvent, param2:IWindow = null) : void
      {
         if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            this._questEngine.achievementController.show();
            this.close();
         }
      }
      
      private function onShareButton(param1:WindowEvent, param2:IWindow = null) : void
      {
         if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            this._questEngine.send(new GetAchievementShareIdComposer(this.var_63.achievementID));
            this._questEngine.send(new ConversionPointMessageComposer("Achievements",this.var_63.badgeCode,"client.start_post"));
         }
      }
      
      public function update(param1:uint) : void
      {
         if(this.var_901 > 0)
         {
            this.var_901 -= param1;
            if(this.var_901 < 1)
            {
               this.show();
               this._window.center();
               this._window.visible = true;
               this._window.activate();
            }
         }
      }
      
      private function setBadge(param1:BitmapData) : void
      {
         var _loc2_:IBitmapWrapperWindow = IBitmapWrapperWindow(this._window.findChildByName("achievement_pic_bitmap"));
         if(_loc2_.bitmap == null)
         {
            _loc2_.bitmap = new BitmapData(_loc2_.width,_loc2_.height,true,0);
         }
         _loc2_.bitmap.copyPixels(param1,param1.rect,new Point((_loc2_.width - param1.width) / 2,(_loc2_.height - param1.height) / 2),null,null,true);
      }
      
      public function onBadgeImageReady(param1:BadgeImageReadyEvent) : void
      {
         if(param1 != null && this._window != null && this.var_63 != null && param1.badgeId == this.var_63.badgeCode)
         {
            this.setBadge(param1.badgeImage);
         }
      }
      
      public function requestFacebookPostDialog(param1:String, param2:String) : void
      {
         if(this._window == null || this.var_63 == null || this.var_63.badgeCode != param1)
         {
            Logger.log("Invalid facebook post: " + param1 + ", " + (this.var_63 == null ? "current is null" : this.var_63.badgeCode));
            return;
         }
         var _loc3_:String = this.getFacebookText("notifications.text.achievement_facebook");
         var _loc4_:String = this.getFacebookText("notifications.text.achievement_facebook_title");
         HabboWebTools.facebookAchievementPost(this.var_63.badgeCode,_loc4_,_loc3_,param2);
         this.close();
      }
      
      private function getFacebookText(param1:String) : String
      {
         var _loc2_:String = this._questEngine.sessionDataManager.userName;
         var _loc3_:String = this._questEngine.sessionDataManager.realName;
         var _loc4_:String = this._questEngine.localization.getAchievementNameForFacebook(this.var_63.badgeCode,_loc2_,_loc3_,this.var_63.level);
         var _loc5_:String = this._questEngine.localization.getAchievementDescForFacebook(this.var_63.badgeCode,_loc2_,_loc3_,this.var_63.level);
         this.registerParameter(param1,"badge_name",this._questEngine.localization.getBadgeName(this.var_63.badgeCode));
         this.registerParameter(param1,"badge_desc",this._questEngine.localization.getBadgeDesc(this.var_63.badgeCode));
         this.registerParameter(param1,"badge_name_fb",_loc4_);
         this.registerParameter(param1,"badge_desc_fb",_loc5_);
         this.registerParameter(param1,"level",this.var_63.level.toString());
         this.registerParameter(param1,"name",_loc2_);
         this.registerParameter(param1,"realname",_loc3_);
         return this._questEngine.localization.getKey(param1,param1);
      }
      
      private function registerParameter(param1:String, param2:String, param3:String) : void
      {
         this._questEngine.localization.registerParameter(param1,param2,param3);
      }
   }
}
