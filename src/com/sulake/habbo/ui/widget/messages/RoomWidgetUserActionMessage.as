package com.sulake.habbo.ui.widget.messages
{
   public class RoomWidgetUserActionMessage extends RoomWidgetMessage
   {
      
      public static const const_592:String = "RWUAM_WHISPER_USER";
      
      public static const const_545:String = "RWUAM_IGNORE_USER";
      
      public static const const_503:String = "RWUAM_UNIGNORE_USER";
      
      public static const const_443:String = "RWUAM_KICK_USER";
      
      public static const const_535:String = "RWUAM_BAN_USER";
      
      public static const const_581:String = "RWUAM_SEND_FRIEND_REQUEST";
      
      public static const const_507:String = "RWUAM_RESPECT_USER";
      
      public static const const_527:String = "RWUAM_GIVE_RIGHTS";
      
      public static const const_550:String = "RWUAM_TAKE_RIGHTS";
      
      public static const const_516:String = "RWUAM_START_TRADING";
      
      public static const const_683:String = "RWUAM_OPEN_HOME_PAGE";
      
      public static const const_502:String = "RWUAM_KICK_BOT";
      
      public static const const_591:String = "RWUAM_REPORT";
      
      public static const const_523:String = "RWUAM_PICKUP_PET";
      
      public static const const_1810:String = "RWUAM_TRAIN_PET";
      
      public static const const_580:String = " RWUAM_RESPECT_PET";
      
      public static const const_440:String = "RWUAM_REQUEST_PET_UPDATE";
      
      public static const const_786:String = "RWUAM_START_NAME_CHANGE";
       
      
      private var _userId:int = 0;
      
      public function RoomWidgetUserActionMessage(param1:String, param2:int = 0)
      {
         super(param1);
         this._userId = param2;
      }
      
      public function get userId() : int
      {
         return this._userId;
      }
   }
}
