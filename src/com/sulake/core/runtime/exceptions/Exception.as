package com.sulake.core.runtime.exceptions
{
   public class Exception extends Error
   {
       
      
      private var var_1894:String;
      
      public function Exception(param1:String, param2:String = "")
      {
         this.var_1894 = param2;
         super(param1);
      }
      
      public function toString() : String
      {
         return "Exception: " + super.message;
      }
      
      override public function getStackTrace() : String
      {
         return this.var_1894 != "" ? this.var_1894 : super.getStackTrace();
      }
   }
}