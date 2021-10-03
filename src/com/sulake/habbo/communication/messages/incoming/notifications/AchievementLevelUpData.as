package com.sulake.habbo.communication.messages.incoming.notifications
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class AchievementLevelUpData
   {
       
      
      private var _type:int;
      
      private var var_1150:int;
      
      private var var_1942:int;
      
      private var var_2284:int;
      
      private var var_1698:int;
      
      private var var_1416:int;
      
      private var var_295:int;
      
      private var var_2485:String = "";
      
      private var var_2487:String = "";
      
      private var var_2486:int;
      
      private var _category:String;
      
      public function AchievementLevelUpData(param1:IMessageDataWrapper)
      {
         super();
         this._type = param1.readInteger();
         this.var_1150 = param1.readInteger();
         this.var_295 = param1.readInteger();
         this.var_2485 = param1.readString();
         this.var_1942 = param1.readInteger();
         this.var_2284 = param1.readInteger();
         this.var_1698 = param1.readInteger();
         this.var_1416 = param1.readInteger();
         this.var_2486 = param1.readInteger();
         this.var_2487 = param1.readString();
         this._category = "CAT NOT AVAILABLE";
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get level() : int
      {
         return this.var_1150;
      }
      
      public function get points() : int
      {
         return this.var_1942;
      }
      
      public function get levelRewardPoints() : int
      {
         return this.var_2284;
      }
      
      public function get levelRewardPointType() : int
      {
         return this.var_1698;
      }
      
      public function get bonusPoints() : int
      {
         return this.var_1416;
      }
      
      public function get badgeId() : int
      {
         return this.var_295;
      }
      
      public function get badgeCode() : String
      {
         return this.var_2485;
      }
      
      public function get removedBadgeCode() : String
      {
         return this.var_2487;
      }
      
      public function get achievementID() : int
      {
         return this.var_2486;
      }
      
      public function get category() : String
      {
         return this._category;
      }
   }
}
