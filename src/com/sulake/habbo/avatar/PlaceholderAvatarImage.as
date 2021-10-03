package com.sulake.habbo.avatar
{
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.avatar.alias.AssetAliasCollection;
   import com.sulake.habbo.avatar.cache.AvatarImageCache;
   import com.sulake.habbo.avatar.enum.AvatarAction;
   import flash.display.BitmapData;
   
   public class PlaceholderAvatarImage extends AvatarImage
   {
      
      static var var_735:Map = new Map();
       
      
      public function PlaceholderAvatarImage(param1:AvatarStructure, param2:AssetAliasCollection, param3:AvatarFigureContainer, param4:String)
      {
         super(param1,param2,param3,param4);
      }
      
      override public function dispose() : void
      {
         var _loc1_:* = null;
         if(!var_1092)
         {
            _structure = null;
            _assets = null;
            var_249 = null;
            var_288 = null;
            var_583 = null;
            var_569 = null;
            var_335 = null;
            if(!var_1354 && var_46)
            {
               var_46.dispose();
            }
            var_46 = null;
            _loc1_ = getCache();
            if(_loc1_)
            {
               _loc1_.dispose();
               _loc1_ = null;
            }
            var_863 = null;
            var_1092 = true;
         }
      }
      
      override protected function getFullImage(param1:String) : BitmapData
      {
         return var_735[param1];
      }
      
      override protected function cacheFullImage(param1:String, param2:BitmapData) : void
      {
         var_735[param1] = param2;
      }
      
      override public function appendAction(param1:String, ... rest) : Boolean
      {
         var _loc3_:* = null;
         if(rest != null && rest.length > 0)
         {
            _loc3_ = rest[0];
         }
         switch(param1)
         {
            case AvatarAction.const_385:
               switch(_loc3_)
               {
                  case AvatarAction.const_798:
                  case AvatarAction.const_540:
                  case AvatarAction.const_438:
                  case AvatarAction.const_847:
                  case AvatarAction.const_425:
                  case AvatarAction.const_707:
                     super.appendAction.apply(null,[param1].concat(rest));
               }
               break;
            case AvatarAction.const_323:
            case AvatarAction.const_939:
            case AvatarAction.const_271:
            case AvatarAction.const_833:
            case AvatarAction.const_918:
            case AvatarAction.const_802:
               super.addActionData.apply(null,[param1].concat(rest));
         }
         return true;
      }
      
      override public function isPlaceholder() : Boolean
      {
         return true;
      }
   }
}
