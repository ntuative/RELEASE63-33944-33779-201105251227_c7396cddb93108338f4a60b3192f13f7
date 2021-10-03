package com.sulake.habbo.communication.messages.incoming.handshake
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import com.sulake.habbo.communication.messages.parser.handshake.DisconnectReasonParser;
   
   public class DisconnectReasonEvent extends MessageEvent implements IMessageEvent
   {
      
      public static const const_2164:int = 0;
      
      public static const const_1728:int = 1;
      
      public static const const_1915:int = 2;
      
      public static const const_2033:int = 3;
      
      public static const const_2105:int = 4;
      
      public static const const_2143:int = 5;
      
      public static const const_1693:int = 10;
      
      public static const const_2169:int = 11;
      
      public static const const_2156:int = 12;
      
      public static const const_2170:int = 13;
      
      public static const const_2193:int = 16;
      
      public static const const_2147:int = 17;
      
      public static const const_2051:int = 18;
      
      public static const const_2099:int = 19;
      
      public static const const_2034:int = 20;
      
      public static const const_2180:int = 22;
      
      public static const const_2171:int = 23;
      
      public static const const_2188:int = 24;
      
      public static const const_2130:int = 25;
      
      public static const const_2025:int = 26;
      
      public static const const_2146:int = 27;
      
      public static const const_2011:int = 28;
      
      public static const const_2200:int = 29;
      
      public static const const_2202:int = 100;
      
      public static const const_2094:int = 101;
      
      public static const const_1988:int = 102;
      
      public static const const_2192:int = 103;
      
      public static const const_2150:int = 104;
      
      public static const const_2071:int = 105;
      
      public static const const_2028:int = 106;
      
      public static const const_2009:int = 107;
      
      public static const const_2181:int = 108;
      
      public static const const_2006:int = 109;
      
      public static const const_2161:int = 110;
      
      public static const const_2058:int = 111;
      
      public static const const_2185:int = 112;
      
      public static const const_2057:int = 113;
      
      public static const const_2017:int = 114;
      
      public static const const_2012:int = 115;
      
      public static const const_2066:int = 116;
      
      public static const const_2050:int = 117;
      
      public static const const_2168:int = 118;
      
      public static const const_2155:int = 119;
       
      
      public function DisconnectReasonEvent(param1:Function)
      {
         super(param1,DisconnectReasonParser);
      }
      
      public function get reason() : int
      {
         return (this.var_10 as DisconnectReasonParser).reason;
      }
      
      public function get reasonString() : String
      {
         switch(this.reason)
         {
            case const_1728:
            case const_1693:
               return "banned";
            case const_1915:
               return "concurrentlogin";
            default:
               return "logout";
         }
      }
   }
}
