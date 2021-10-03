package com.sulake.habbo.communication.messages.outgoing.friendlist
{
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.runtime.IDisposable;
   
   public class SendRoomInviteMessageComposer implements IMessageComposer, IDisposable
   {
       
      
      private var var_923:Array;
      
      private var var_1936:String;
      
      public function SendRoomInviteMessageComposer(param1:String)
      {
         this.var_923 = new Array();
         super();
         this.var_1936 = param1;
      }
      
      public function getMessageArray() : Array
      {
         var _loc1_:Array = new Array();
         _loc1_.push(this.var_923.length);
         var _loc2_:int = 0;
         while(_loc2_ < this.var_923.length)
         {
            _loc1_.push(this.var_923[_loc2_]);
            _loc2_++;
         }
         _loc1_.push(this.var_1936);
         return _loc1_;
      }
      
      public function addInvitedFriend(param1:int) : void
      {
         this.var_923.push(param1);
      }
      
      public function dispose() : void
      {
         this.var_923 = null;
      }
      
      public function get disposed() : Boolean
      {
         return false;
      }
   }
}
