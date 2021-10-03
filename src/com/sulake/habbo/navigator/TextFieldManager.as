package com.sulake.habbo.navigator
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowKeyboardEvent;
   import flash.geom.Point;
   import flash.ui.Keyboard;
   
   public class TextFieldManager
   {
       
      
      private var _navigator:HabboNavigator;
      
      private var var_82:ITextFieldWindow;
      
      private var var_695:Boolean;
      
      private var var_1447:String = "";
      
      private var var_2104:int;
      
      private var var_2105:Function;
      
      private var var_2912:String = "";
      
      private var var_150:IWindowContainer;
      
      private var var_2910:Boolean;
      
      private var _orgTextBackgroundColor:uint;
      
      private var var_2911:uint;
      
      public function TextFieldManager(param1:HabboNavigator, param2:ITextFieldWindow, param3:int = 1000, param4:Function = null, param5:String = null)
      {
         super();
         this._navigator = param1;
         this.var_82 = param2;
         this.var_2104 = param3;
         this.var_2105 = param4;
         if(param5 != null)
         {
            this.var_695 = true;
            this.var_1447 = param5;
            this.var_82.text = param5;
         }
         Util.setProcDirectly(this.var_82,this.onInputClick);
         this.var_82.addEventListener(WindowKeyboardEvent.const_215,this.checkEnterPress);
         this.var_82.addEventListener(WindowEvent.const_108,this.checkMaxLen);
         this.var_2910 = this.var_82.textBackground;
         this._orgTextBackgroundColor = this.var_82.textBackgroundColor;
         this.var_2911 = this.var_82.textColor;
      }
      
      public function checkMandatory(param1:String) : Boolean
      {
         if(!this.isInputValid())
         {
            this.displayError(param1);
            return false;
         }
         this.restoreBackground();
         return true;
      }
      
      public function restoreBackground() : void
      {
         this.var_82.textBackground = this.var_2910;
         this.var_82.textBackgroundColor = this._orgTextBackgroundColor;
         this.var_82.textColor = this.var_2911;
      }
      
      public function displayError(param1:String) : void
      {
         this.var_82.textBackground = true;
         this.var_82.textBackgroundColor = 4294021019;
         this.var_82.textColor = 4278190080;
         if(this.var_150 == null)
         {
            this.var_150 = IWindowContainer(this._navigator.getXmlWindow("nav_error_popup"));
            this._navigator.refreshButton(this.var_150,"popup_arrow_down",true,null,0);
            IWindowContainer(this.var_82.parent).addChild(this.var_150);
         }
         var _loc2_:ITextWindow = ITextWindow(this.var_150.findChildByName("error_text"));
         _loc2_.text = param1;
         _loc2_.width = _loc2_.textWidth + 5;
         this.var_150.findChildByName("border").width = _loc2_.width + 15;
         this.var_150.width = _loc2_.width + 15;
         var _loc3_:Point = new Point();
         this.var_82.getLocalPosition(_loc3_);
         this.var_150.x = _loc3_.x;
         this.var_150.y = _loc3_.y - this.var_150.height + 3;
         var _loc4_:IWindow = this.var_150.findChildByName("popup_arrow_down");
         _loc4_.x = this.var_150.width / 2 - _loc4_.width / 2;
         this.var_150.x += (this.var_82.width - this.var_150.width) / 2;
         this.var_150.visible = true;
      }
      
      public function goBackToInitialState() : void
      {
         this.clearErrors();
         if(this.var_1447 != null)
         {
            this.var_82.text = this.var_1447;
            this.var_695 = true;
         }
         else
         {
            this.var_82.text = "";
            this.var_695 = false;
         }
      }
      
      public function getText() : String
      {
         if(this.var_695)
         {
            return this.var_2912;
         }
         return this.var_82.text;
      }
      
      public function setText(param1:String) : void
      {
         this.var_695 = false;
         this.var_82.text = param1;
      }
      
      public function clearErrors() : void
      {
         this.restoreBackground();
         if(this.var_150 != null)
         {
            this.var_150.visible = false;
         }
      }
      
      public function get input() : ITextFieldWindow
      {
         return this.var_82;
      }
      
      private function isInputValid() : Boolean
      {
         return !this.var_695 && Util.trim(this.getText()).length > 2;
      }
      
      private function onInputClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowEvent.const_321)
         {
            return;
         }
         if(!this.var_695)
         {
            return;
         }
         this.var_82.text = this.var_2912;
         this.var_695 = false;
         this.restoreBackground();
      }
      
      private function checkEnterPress(param1:WindowKeyboardEvent) : void
      {
         if(param1.charCode == Keyboard.ENTER)
         {
            if(this.var_2105 != null)
            {
               this.var_2105();
            }
         }
      }
      
      private function checkMaxLen(param1:WindowEvent) : void
      {
         var _loc2_:String = this.var_82.text;
         if(_loc2_.length > this.var_2104)
         {
            this.var_82.text = _loc2_.substring(0,this.var_2104);
         }
      }
   }
}
