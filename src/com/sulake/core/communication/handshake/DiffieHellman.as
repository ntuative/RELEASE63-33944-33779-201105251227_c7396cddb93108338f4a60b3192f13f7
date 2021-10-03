package com.sulake.core.communication.handshake
{
   import com.hurlant.math.BigInteger;
   import com.sulake.core.utils.ErrorReportStorage;
   
   public class DiffieHellman implements IKeyExchange
   {
       
      
      private var var_1025:BigInteger;
      
      private var var_2212:BigInteger;
      
      private var var_1680:BigInteger;
      
      private var var_2241:BigInteger;
      
      private var var_1402:BigInteger;
      
      private var var_1679:BigInteger;
      
      public function DiffieHellman(param1:BigInteger, param2:BigInteger)
      {
         super();
         this.var_1402 = param1;
         this.var_1679 = param2;
      }
      
      public function init(param1:String, param2:uint = 16) : Boolean
      {
         ErrorReportStorage.addDebugData("DiffieHellman","Prime: " + this.var_1402.toString() + ",generator: " + this.var_1679.toString() + ",secret: " + param1);
         this.var_1025 = new BigInteger();
         this.var_1025.fromRadix(param1,param2);
         this.var_2212 = this.var_1679.modPow(this.var_1025,this.var_1402);
         return true;
      }
      
      public function generateSharedKey(param1:String, param2:uint = 16) : String
      {
         this.var_1680 = new BigInteger();
         this.var_1680.fromRadix(param1,param2);
         this.var_2241 = this.var_1680.modPow(this.var_1025,this.var_1402);
         return this.getSharedKey(param2);
      }
      
      public function getPublicKey(param1:uint = 16) : String
      {
         return this.var_2212.toRadix(param1);
      }
      
      public function getSharedKey(param1:uint = 16) : String
      {
         return this.var_2241.toRadix(param1);
      }
   }
}
