package com.sulake.habbo.communication.messages.parser.poll
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class VoteResultMessageParser implements IMessageParser
   {
       
      
      private var var_1207:String;
      
      private var var_1438:Array;
      
      private var var_1189:Array;
      
      private var var_1944:int;
      
      public function VoteResultMessageParser()
      {
         super();
      }
      
      public function get question() : String
      {
         return this.var_1207;
      }
      
      public function get choices() : Array
      {
         return this.var_1438.slice();
      }
      
      public function get votes() : Array
      {
         return this.var_1189.slice();
      }
      
      public function get totalVotes() : int
      {
         return this.var_1944;
      }
      
      public function flush() : Boolean
      {
         this.var_1207 = "";
         this.var_1438 = [];
         this.var_1189 = [];
         this.var_1944 = 0;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1207 = param1.readString();
         this.var_1438 = [];
         this.var_1189 = [];
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            param1.readInteger();
            this.var_1438.push(param1.readString());
            this.var_1189.push(param1.readInteger());
            _loc3_++;
         }
         this.var_1944 = param1.readInteger();
         return true;
      }
   }
}
