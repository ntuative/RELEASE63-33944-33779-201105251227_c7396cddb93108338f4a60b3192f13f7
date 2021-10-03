package com.sulake.habbo.avatar
{
   import com.sulake.habbo.avatar.actions.IActionDefinition;
   import com.sulake.habbo.avatar.structure.figure.IPartColor;
   import flash.geom.ColorTransform;
   
   public class AvatarImagePartContainer
   {
       
      
      private var var_1398:String;
      
      private var var_180:String;
      
      private var var_2841:String;
      
      private var var_1670:String;
      
      private var _color:IPartColor;
      
      private var _frames:Array;
      
      private var _action:IActionDefinition;
      
      private var var_1592:Boolean;
      
      private var _isBlendable:Boolean;
      
      private var var_2842:ColorTransform;
      
      private var var_2706:int;
      
      public function AvatarImagePartContainer(param1:String, param2:String, param3:String, param4:IPartColor, param5:Array, param6:IActionDefinition, param7:Boolean, param8:int, param9:String = "", param10:Boolean = false, param11:Number = 1)
      {
         super();
         this.var_1398 = param1;
         this.var_180 = param2;
         this.var_1670 = param3;
         this._color = param4;
         this._frames = param5;
         this._action = param6;
         this.var_1592 = param7;
         this.var_2706 = param8;
         this.var_2841 = param9;
         this._isBlendable = param10;
         this.var_2842 = new ColorTransform(1,1,1,param11);
         if(this._frames == null)
         {
            Logger.log("Null frame list");
         }
         if(this.var_180 == "ey")
         {
            this.var_1592 = false;
         }
      }
      
      public function getFrameIndex(param1:int) : int
      {
         return this._frames[param1 % this._frames.length];
      }
      
      public function get frames() : Array
      {
         return this._frames;
      }
      
      public function get bodyPartId() : String
      {
         return this.var_1398;
      }
      
      public function get partType() : String
      {
         return this.var_180;
      }
      
      public function get partId() : String
      {
         return this.var_1670;
      }
      
      public function get color() : IPartColor
      {
         return this._color;
      }
      
      public function get action() : IActionDefinition
      {
         return this._action;
      }
      
      public function set isColorable(param1:Boolean) : void
      {
         this.var_1592 = param1;
      }
      
      public function get isColorable() : Boolean
      {
         return this.var_1592;
      }
      
      public function get paletteMapId() : int
      {
         return this.var_2706;
      }
      
      public function get flippedPartType() : String
      {
         return this.var_2841;
      }
      
      public function get isBlendable() : Boolean
      {
         return this._isBlendable;
      }
      
      public function get blendTransform() : ColorTransform
      {
         return this.var_2842;
      }
   }
}
