package com.sulake.core.utils.profiler.tracking
{
   import flash.display.BitmapData;
   
   public class TrackedBitmapData extends BitmapData
   {
      
      public static const const_2096:int = 16777215;
      
      public static const const_1246:int = 8191;
      
      public static const const_1268:int = 8191;
      
      public static const const_2191:int = 1;
      
      public static const const_1332:int = 1;
      
      public static const const_1320:int = 1;
      
      private static var var_542:uint = 0;
      
      private static var var_541:uint = 0;
       
      
      private var _owner:Object;
      
      private var _disposed:Boolean = false;
      
      public function TrackedBitmapData(param1:*, param2:int, param3:int, param4:Boolean = true, param5:uint = 4.294967295E9)
      {
         if(param2 > const_1246)
         {
            param2 = const_1246;
         }
         else if(param2 < const_1332)
         {
            param2 = const_1332;
         }
         if(param3 > const_1268)
         {
            param3 = const_1268;
         }
         else if(param3 < const_1320)
         {
            param3 = const_1320;
         }
         super(param2,param3,param4,param5);
         ++var_542;
         var_541 += param2 * param3 * 4;
         this._owner = param1;
      }
      
      public static function get numInstances() : uint
      {
         return var_542;
      }
      
      public static function get allocatedByteCount() : uint
      {
         return var_541;
      }
      
      override public function dispose() : void
      {
         if(!this._disposed)
         {
            var_541 -= width * height * 4;
            --var_542;
            this._disposed = true;
            this._owner = null;
            super.dispose();
         }
      }
   }
}
