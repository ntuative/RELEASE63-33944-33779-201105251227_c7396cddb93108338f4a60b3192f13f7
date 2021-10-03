package com.sulake.core.runtime
{
   import flash.utils.getQualifiedClassName;
   
   final class InterfaceStruct implements IDisposable
   {
       
      
      private var var_1511:IID;
      
      private var var_1873:String;
      
      private var var_108:IUnknown;
      
      private var var_796:uint;
      
      function InterfaceStruct(param1:IID, param2:IUnknown)
      {
         super();
         this.var_1511 = param1;
         this.var_1873 = getQualifiedClassName(this.var_1511);
         this.var_108 = param2;
         this.var_796 = 0;
      }
      
      public function get iid() : IID
      {
         return this.var_1511;
      }
      
      public function get iis() : String
      {
         return this.var_1873;
      }
      
      public function get unknown() : IUnknown
      {
         return this.var_108;
      }
      
      public function get references() : uint
      {
         return this.var_796;
      }
      
      public function get disposed() : Boolean
      {
         return this.var_108 == null;
      }
      
      public function dispose() : void
      {
         this.var_1511 = null;
         this.var_1873 = null;
         this.var_108 = null;
         this.var_796 = 0;
      }
      
      public function reserve() : uint
      {
         return ++this.var_796;
      }
      
      public function release() : uint
      {
         return this.references > 0 ? uint(--this.var_796) : uint(0);
      }
   }
}
