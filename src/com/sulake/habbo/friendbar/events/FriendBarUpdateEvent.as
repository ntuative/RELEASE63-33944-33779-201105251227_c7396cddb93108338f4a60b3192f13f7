package com.sulake.habbo.friendbar.events
{
   import flash.events.Event;
   
   public class FriendBarUpdateEvent extends Event
   {
      
      public static const const_788:String = "FBE_UPDATED";
       
      
      public function FriendBarUpdateEvent()
      {
         super(const_788,false,false);
      }
   }
}
