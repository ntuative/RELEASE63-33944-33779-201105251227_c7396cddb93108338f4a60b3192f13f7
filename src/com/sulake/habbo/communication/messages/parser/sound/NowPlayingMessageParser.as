package com.sulake.habbo.communication.messages.parser.sound
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class NowPlayingMessageParser implements IMessageParser
   {
       
      
      private var var_2008:int;
      
      private var _currentPosition:int;
      
      private var var_2007:int;
      
      private var var_2005:int;
      
      private var var_2006:int;
      
      public function NowPlayingMessageParser()
      {
         super();
      }
      
      public function get currentSongId() : int
      {
         return this.var_2008;
      }
      
      public function get currentPosition() : int
      {
         return this._currentPosition;
      }
      
      public function get nextSongId() : int
      {
         return this.var_2007;
      }
      
      public function get nextPosition() : int
      {
         return this.var_2005;
      }
      
      public function get syncCount() : int
      {
         return this.var_2006;
      }
      
      public function flush() : Boolean
      {
         this.var_2008 = -1;
         this._currentPosition = -1;
         this.var_2007 = -1;
         this.var_2005 = -1;
         this.var_2006 = -1;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_2008 = param1.readInteger();
         this._currentPosition = param1.readInteger();
         this.var_2007 = param1.readInteger();
         this.var_2005 = param1.readInteger();
         this.var_2006 = param1.readInteger();
         return true;
      }
   }
}
