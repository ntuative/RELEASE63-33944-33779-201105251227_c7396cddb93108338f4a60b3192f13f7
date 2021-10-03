package com.sulake.habbo.quest
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.runtime.IUpdateReceiver;
   import com.sulake.habbo.communication.messages.incoming.quest.QuestMessageData;
   
   public class QuestController implements IDisposable, IUpdateReceiver
   {
       
      
      private var _questEngine:HabboQuestEngine;
      
      private var var_691:QuestsList;
      
      private var var_565:QuestDetails;
      
      private var _questCompleted:QuestCompleted;
      
      private var var_401:QuestTracker;
      
      private var var_1076:CampaignCompleted;
      
      public function QuestController(param1:HabboQuestEngine)
      {
         super();
         this._questEngine = param1;
         this.var_401 = new QuestTracker(this._questEngine);
         this.var_691 = new QuestsList(this._questEngine);
         this.var_565 = new QuestDetails(this._questEngine);
         this._questCompleted = new QuestCompleted(this._questEngine);
         this.var_1076 = new CampaignCompleted(this._questEngine);
      }
      
      public function onToolbarClick() : void
      {
         this.var_691.onToolbarClick();
      }
      
      public function onQuests(param1:Array, param2:Boolean) : void
      {
         this.var_691.onQuests(param1,param2);
      }
      
      public function onQuest(param1:QuestMessageData) : void
      {
         this.var_401.onQuest(param1);
         this.var_565.onQuest(param1);
         this._questCompleted.onQuest(param1);
      }
      
      public function onQuestCompleted(param1:QuestMessageData) : void
      {
         this.var_401.onQuestCompleted(param1);
         this.var_565.onQuestCompleted(param1);
         this._questCompleted.onQuestCompleted(param1);
      }
      
      public function onQuestCancelled() : void
      {
         this.var_401.onQuestCancelled();
         this.var_565.onQuestCancelled();
         this._questCompleted.onQuestCancelled();
      }
      
      public function onRoomEnter() : void
      {
         this.var_401.onRoomEnter();
      }
      
      public function onRoomExit() : void
      {
         this.var_691.onRoomExit();
         this.var_401.onRoomExit();
         this.var_565.onRoomExit();
         this.var_1076.onRoomExit();
      }
      
      public function update(param1:uint) : void
      {
         this._questCompleted.update(param1);
         this.var_401.update(param1);
      }
      
      public function dispose() : void
      {
         this._questEngine = null;
         if(this.var_691)
         {
            this.var_691.dispose();
            this.var_691 = null;
         }
         if(this.var_401)
         {
            this.var_401.dispose();
            this.var_401 = null;
         }
         if(this.var_565)
         {
            this.var_565.dispose();
            this.var_565 = null;
         }
         if(this._questCompleted)
         {
            this._questCompleted.dispose();
            this._questCompleted = null;
         }
         if(this.var_1076)
         {
            this.var_1076.dispose();
            this.var_1076 = null;
         }
      }
      
      public function get disposed() : Boolean
      {
         return this._questEngine == null;
      }
      
      public function get questsList() : QuestsList
      {
         return this.var_691;
      }
      
      public function get questDetails() : QuestDetails
      {
         return this.var_565;
      }
      
      public function get questTracker() : QuestTracker
      {
         return this.var_401;
      }
      
      public function get campaignCompleted() : CampaignCompleted
      {
         return this.var_1076;
      }
   }
}
