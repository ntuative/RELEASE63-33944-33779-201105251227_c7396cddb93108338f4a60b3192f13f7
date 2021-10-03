package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class HabboSearchResultData
   {
       
      
      private var var_2398:int;
      
      private var var_1766:String;
      
      private var var_2415:String;
      
      private var var_2565:Boolean;
      
      private var var_2566:Boolean;
      
      private var var_2563:int;
      
      private var var_2414:String;
      
      private var var_2564:String;
      
      private var var_1767:String;
      
      public function HabboSearchResultData(param1:IMessageDataWrapper)
      {
         super();
         this.var_2398 = param1.readInteger();
         this.var_1766 = param1.readString();
         this.var_2415 = param1.readString();
         this.var_2565 = param1.readBoolean();
         this.var_2566 = param1.readBoolean();
         param1.readString();
         this.var_2563 = param1.readInteger();
         this.var_2414 = param1.readString();
         this.var_2564 = param1.readString();
         this.var_1767 = param1.readString();
      }
      
      public function get avatarId() : int
      {
         return this.var_2398;
      }
      
      public function get avatarName() : String
      {
         return this.var_1766;
      }
      
      public function get avatarMotto() : String
      {
         return this.var_2415;
      }
      
      public function get isAvatarOnline() : Boolean
      {
         return this.var_2565;
      }
      
      public function get canFollow() : Boolean
      {
         return this.var_2566;
      }
      
      public function get avatarGender() : int
      {
         return this.var_2563;
      }
      
      public function get avatarFigure() : String
      {
         return this.var_2414;
      }
      
      public function get lastOnlineDate() : String
      {
         return this.var_2564;
      }
      
      public function get realName() : String
      {
         return this.var_1767;
      }
   }
}
