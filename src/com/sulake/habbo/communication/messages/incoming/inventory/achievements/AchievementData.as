package com.sulake.habbo.communication.messages.incoming.inventory.achievements
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class AchievementData
   {
       
      
      private var _type:int;
      
      private var var_1150:int;
      
      private var var_295:String;
      
      private var var_1731:int;
      
      private var var_2284:int;
      
      private var var_1698:int;
      
      private var var_1732:int;
      
      private var var_1730:Boolean;
      
      private var _category:String;
      
      private var var_2358:int;
      
      public function AchievementData(param1:IMessageDataWrapper)
      {
         super();
         this._type = param1.readInteger();
         this.var_1150 = param1.readInteger();
         this.var_295 = param1.readString();
         this.var_1731 = Math.max(1,param1.readInteger());
         this.var_2284 = param1.readInteger();
         this.var_1698 = param1.readInteger();
         this.var_1732 = param1.readInteger();
         this.var_1730 = param1.readBoolean();
         this._category = param1.readString();
         this.var_2358 = param1.readInteger();
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get badgeId() : String
      {
         return this.var_295;
      }
      
      public function get level() : int
      {
         return this.var_1150;
      }
      
      public function get scoreLimit() : int
      {
         return this.var_1731;
      }
      
      public function get levelRewardPoints() : int
      {
         return this.var_2284;
      }
      
      public function get levelRewardPointType() : int
      {
         return this.var_1698;
      }
      
      public function get currentPoints() : int
      {
         return this.var_1732;
      }
      
      public function get finalLevel() : Boolean
      {
         return this.var_1730;
      }
      
      public function get category() : String
      {
         return this._category;
      }
      
      public function get levelCount() : int
      {
         return this.var_2358;
      }
      
      public function get firstLevelAchieved() : Boolean
      {
         return this.var_1150 > 1 || this.var_1730;
      }
      
      public function setMaxProgress() : void
      {
         this.var_1732 = this.var_1731;
      }
   }
}
