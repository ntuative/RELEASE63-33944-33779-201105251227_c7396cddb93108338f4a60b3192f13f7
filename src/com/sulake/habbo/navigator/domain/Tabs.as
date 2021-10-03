package com.sulake.habbo.navigator.domain
{
   import com.sulake.habbo.navigator.HabboNavigator;
   import com.sulake.habbo.navigator.mainview.MainViewCtrl;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.EventsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.MyRoomsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.OfficialTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.RoomsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.SearchTabPageDecorator;
   
   public class Tabs
   {
      
      public static const const_331:int = 1;
      
      public static const const_190:int = 2;
      
      public static const const_287:int = 3;
      
      public static const const_336:int = 4;
      
      public static const const_210:int = 5;
      
      public static const const_397:int = 1;
      
      public static const const_907:int = 2;
      
      public static const const_712:int = 3;
      
      public static const const_742:int = 4;
      
      public static const const_295:int = 5;
      
      public static const const_884:int = 6;
      
      public static const const_854:int = 7;
      
      public static const const_244:int = 8;
      
      public static const const_424:int = 9;
      
      public static const const_2089:int = 10;
      
      public static const const_976:int = 11;
      
      public static const const_464:int = 12;
       
      
      private var var_419:Array;
      
      private var _navigator:HabboNavigator;
      
      public function Tabs(param1:HabboNavigator)
      {
         super();
         this._navigator = param1;
         this.var_419 = new Array();
         this.var_419.push(new Tab(this._navigator,const_331,const_464,new EventsTabPageDecorator(this._navigator),MainViewCtrl.const_548));
         this.var_419.push(new Tab(this._navigator,const_190,const_397,new RoomsTabPageDecorator(this._navigator),MainViewCtrl.const_548));
         this.var_419.push(new Tab(this._navigator,const_336,const_976,new OfficialTabPageDecorator(this._navigator),MainViewCtrl.const_1327));
         this.var_419.push(new Tab(this._navigator,const_287,const_295,new MyRoomsTabPageDecorator(this._navigator),MainViewCtrl.const_548));
         this.var_419.push(new Tab(this._navigator,const_210,const_244,new SearchTabPageDecorator(this._navigator),MainViewCtrl.const_706));
         this.setSelectedTab(const_331);
      }
      
      public function onFrontPage() : Boolean
      {
         return this.getSelected().id == const_336;
      }
      
      public function get tabs() : Array
      {
         return this.var_419;
      }
      
      public function setSelectedTab(param1:int) : void
      {
         this.clearSelected();
         this.getTab(param1).selected = true;
      }
      
      public function getSelected() : Tab
      {
         var _loc1_:* = null;
         for each(_loc1_ in this.var_419)
         {
            if(_loc1_.selected)
            {
               return _loc1_;
            }
         }
         return null;
      }
      
      private function clearSelected() : void
      {
         var _loc1_:* = null;
         for each(_loc1_ in this.var_419)
         {
            _loc1_.selected = false;
         }
      }
      
      public function getTab(param1:int) : Tab
      {
         var _loc2_:* = null;
         for each(_loc2_ in this.var_419)
         {
            if(_loc2_.id == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
   }
}
