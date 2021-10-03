package com.sulake.habbo.communication.messages.incoming.quest
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class QuestMessageData
   {
       
      
      private var var_1979:String;
      
      private var var_2737:int;
      
      private var var_2735:int;
      
      private var var_1643:int;
      
      private var _id:int;
      
      private var var_1978:Boolean;
      
      private var _type:String;
      
      private var var_1977:String;
      
      private var var_1976:int;
      
      private var _localizationCode:String;
      
      private var var_2734:int;
      
      private var var_2736:int;
      
      private var var_2738:int;
      
      public function QuestMessageData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1979 = param1.readString();
         this.var_2737 = param1.readInteger();
         this.var_2735 = param1.readInteger();
         this.var_1643 = param1.readInteger();
         this._id = param1.readInteger();
         this.var_1978 = param1.readBoolean();
         this._type = param1.readString();
         this.var_1977 = param1.readString();
         this.var_1976 = param1.readInteger();
         this._localizationCode = param1.readString();
         this.var_2734 = param1.readInteger();
         this.var_2736 = param1.readInteger();
         this.var_2738 = param1.readInteger();
      }
      
      public function dispose() : void
      {
         this._id = 0;
         this._type = "";
         this.var_1977 = "";
         this.var_1976 = 0;
      }
      
      public function get campaignCode() : String
      {
         return this.var_1979;
      }
      
      public function get localizationCode() : String
      {
         return this._localizationCode;
      }
      
      public function get completedQuestsInCampaign() : int
      {
         return this.var_2737;
      }
      
      public function get questCountInCampaign() : int
      {
         return this.var_2735;
      }
      
      public function get activityPointType() : int
      {
         return this.var_1643;
      }
      
      public function get accepted() : Boolean
      {
         return this.var_1978;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get type() : String
      {
         return this._type;
      }
      
      public function get imageVersion() : String
      {
         return this.var_1977;
      }
      
      public function get rewardCurrencyAmount() : int
      {
         return this.var_1976;
      }
      
      public function get completedSteps() : int
      {
         return this.var_2734;
      }
      
      public function get totalSteps() : int
      {
         return this.var_2736;
      }
      
      public function get waitPeriodSeconds() : int
      {
         return this.var_2738;
      }
      
      public function getCampaignLocalizationKey() : String
      {
         return "quests." + this.var_1979;
      }
      
      public function getQuestLocalizationKey() : String
      {
         return this.getCampaignLocalizationKey() + "." + this._localizationCode;
      }
      
      public function get completedCampaign() : Boolean
      {
         return this._id < 1;
      }
      
      public function set id(param1:int) : void
      {
         this._id = param1;
      }
      
      public function set accepted(param1:Boolean) : void
      {
         this.var_1978 = param1;
      }
   }
}
