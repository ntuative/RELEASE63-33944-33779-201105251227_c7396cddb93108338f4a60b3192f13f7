package com.sulake.habbo.inventory.effects
{
   import com.sulake.habbo.inventory.common.IThumbListDataProvider;
   
   public class EffectListProxy implements IThumbListDataProvider
   {
       
      
      private var var_70:EffectsModel;
      
      private var var_146:int;
      
      public function EffectListProxy(param1:EffectsModel, param2:int)
      {
         super();
         this.var_70 = param1;
         this.var_146 = param2;
      }
      
      public function dispose() : void
      {
         this.var_70 = null;
      }
      
      public function getDrawableList() : Array
      {
         return this.var_70.getEffects(this.var_146);
      }
   }
}
