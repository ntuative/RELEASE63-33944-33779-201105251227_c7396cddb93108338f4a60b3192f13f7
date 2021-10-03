package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ModeratorUserInfoData
   {
       
      
      private var _userId:int;
      
      private var _userName:String;
      
      private var var_2328:int;
      
      private var var_2324:int;
      
      private var var_743:Boolean;
      
      private var var_2325:int;
      
      private var var_2327:int;
      
      private var var_2326:int;
      
      private var var_2323:int;
      
      public function ModeratorUserInfoData(param1:IMessageDataWrapper)
      {
         super();
         this._userId = param1.readInteger();
         this._userName = param1.readString();
         this.var_2328 = param1.readInteger();
         this.var_2324 = param1.readInteger();
         this.var_743 = param1.readBoolean();
         this.var_2325 = param1.readInteger();
         this.var_2327 = param1.readInteger();
         this.var_2326 = param1.readInteger();
         this.var_2323 = param1.readInteger();
      }
      
      public function get userId() : int
      {
         return this._userId;
      }
      
      public function get userName() : String
      {
         return this._userName;
      }
      
      public function get minutesSinceRegistration() : int
      {
         return this.var_2328;
      }
      
      public function get minutesSinceLastLogin() : int
      {
         return this.var_2324;
      }
      
      public function get online() : Boolean
      {
         return this.var_743;
      }
      
      public function get cfhCount() : int
      {
         return this.var_2325;
      }
      
      public function get abusiveCfhCount() : int
      {
         return this.var_2327;
      }
      
      public function get cautionCount() : int
      {
         return this.var_2326;
      }
      
      public function get banCount() : int
      {
         return this.var_2323;
      }
   }
}
