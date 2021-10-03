package com.sulake.habbo.communication.messages.parser.users
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class ScrSendUserInfoMessageParser implements IMessageParser
   {
      
      public static const const_2100:int = 1;
      
      public static const const_1792:int = 2;
       
      
      private var var_1004:String;
      
      private var var_2313:int;
      
      private var var_2309:int;
      
      private var var_2312:int;
      
      private var var_2310:int;
      
      private var var_2307:Boolean;
      
      private var var_2314:Boolean;
      
      private var var_2308:int;
      
      private var var_2311:int;
      
      private var var_2316:Boolean;
      
      private var var_2306:int;
      
      private var var_2315:int;
      
      public function ScrSendUserInfoMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1004 = param1.readString();
         this.var_2313 = param1.readInteger();
         this.var_2309 = param1.readInteger();
         this.var_2312 = param1.readInteger();
         this.var_2310 = param1.readInteger();
         this.var_2307 = param1.readBoolean();
         this.var_2314 = param1.readBoolean();
         this.var_2308 = param1.readInteger();
         this.var_2311 = param1.readInteger();
         this.var_2316 = param1.readBoolean();
         this.var_2306 = param1.readInteger();
         this.var_2315 = param1.readInteger();
         return true;
      }
      
      public function get productName() : String
      {
         return this.var_1004;
      }
      
      public function get daysToPeriodEnd() : int
      {
         return this.var_2313;
      }
      
      public function get memberPeriods() : int
      {
         return this.var_2309;
      }
      
      public function get periodsSubscribedAhead() : int
      {
         return this.var_2312;
      }
      
      public function get responseType() : int
      {
         return this.var_2310;
      }
      
      public function get hasEverBeenMember() : Boolean
      {
         return this.var_2307;
      }
      
      public function get isVIP() : Boolean
      {
         return this.var_2314;
      }
      
      public function get pastClubDays() : int
      {
         return this.var_2308;
      }
      
      public function get pastVipDays() : int
      {
         return this.var_2311;
      }
      
      public function get isShowBasicPromo() : Boolean
      {
         return this.var_2316;
      }
      
      public function get basicNormalPrice() : int
      {
         return this.var_2306;
      }
      
      public function get basicPromoPrice() : int
      {
         return this.var_2315;
      }
   }
}
