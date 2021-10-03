package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureValRandomizerVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_993:int = 20;
      
      private static const const_638:int = 10;
      
      private static const const_1353:int = 31;
      
      private static const const_1354:int = 32;
      
      private static const const_639:int = 30;
       
      
      private var var_291:Array;
      
      private var var_846:Boolean = false;
      
      public function FurnitureValRandomizerVisualization()
      {
         this.var_291 = new Array();
         super();
         super.setAnimation(const_639);
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == 0)
         {
            if(!this.var_846)
            {
               this.var_846 = true;
               this.var_291 = new Array();
               this.var_291.push(const_1353);
               this.var_291.push(const_1354);
               return;
            }
         }
         if(param1 > 0 && param1 <= const_638)
         {
            if(this.var_846)
            {
               this.var_846 = false;
               this.var_291 = new Array();
               if(direction == 2)
               {
                  this.var_291.push(const_993 + 5 - param1);
                  this.var_291.push(const_638 + 5 - param1);
               }
               else
               {
                  this.var_291.push(const_993 + param1);
                  this.var_291.push(const_638 + param1);
               }
               this.var_291.push(const_639);
               return;
            }
            super.setAnimation(const_639);
         }
      }
      
      override protected function updateAnimation(param1:Number) : int
      {
         if(super.getLastFramePlayed(11))
         {
            if(this.var_291.length > 0)
            {
               super.setAnimation(this.var_291.shift());
            }
         }
         return super.updateAnimation(param1);
      }
   }
}
