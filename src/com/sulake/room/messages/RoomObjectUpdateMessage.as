package com.sulake.room.messages
{
   import com.sulake.room.utils.IVector3d;
   
   public class RoomObjectUpdateMessage
   {
       
      
      protected var var_98:IVector3d;
      
      protected var var_467:IVector3d;
      
      public function RoomObjectUpdateMessage(param1:IVector3d, param2:IVector3d)
      {
         super();
         this.var_98 = param1;
         this.var_467 = param2;
      }
      
      public function get loc() : IVector3d
      {
         return this.var_98;
      }
      
      public function get dir() : IVector3d
      {
         return this.var_467;
      }
   }
}
