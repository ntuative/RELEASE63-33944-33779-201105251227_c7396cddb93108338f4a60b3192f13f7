package com.sulake.core.window.utils
{
   import com.sulake.core.window.enum.WindowType;
   import flash.utils.Dictionary;
   
   public class TypeCodeTable extends WindowType
   {
       
      
      public function TypeCodeTable()
      {
         super();
      }
      
      public static function fillTables(param1:Dictionary, param2:Dictionary = null) : void
      {
         var _loc3_:* = null;
         param1["background"] = const_760;
         param1["bitmap"] = const_806;
         param1["border"] = const_863;
         param1["border_notify"] = const_1632;
         param1["bubble"] = const_829;
         param1["bubble_pointer_up"] = const_1112;
         param1["bubble_pointer_right"] = const_1121;
         param1["bubble_pointer_down"] = const_1316;
         param1["bubble_pointer_left"] = const_1149;
         param1["button"] = const_602;
         param1["button_thick"] = const_904;
         param1["button_icon"] = const_1786;
         param1["button_group_left"] = const_984;
         param1["button_group_center"] = const_875;
         param1["button_group_right"] = const_790;
         param1["canvas"] = const_855;
         param1["checkbox"] = const_691;
         param1["closebutton"] = const_1324;
         param1["container"] = const_402;
         param1["container_button"] = const_898;
         param1["display_object_wrapper"] = const_803;
         param1["dropmenu"] = const_596;
         param1["dropmenu_item"] = const_567;
         param1["frame"] = const_406;
         param1["frame_notify"] = const_1716;
         param1["header"] = const_761;
         param1["html"] = const_1295;
         param1["icon"] = const_1272;
         param1["itemgrid"] = const_1306;
         param1["itemgrid_horizontal"] = const_499;
         param1["itemgrid_vertical"] = const_981;
         param1["itemlist"] = const_1194;
         param1["itemlist_horizontal"] = const_409;
         param1["itemlist_vertical"] = const_422;
         param1["label"] = const_821;
         param1["maximizebox"] = const_1653;
         param1["menu"] = const_1659;
         param1["menu_item"] = const_1870;
         param1["submenu"] = const_1299;
         param1["minimizebox"] = const_1929;
         param1["notify"] = const_1645;
         param1["MessengerView"] = const_958;
         param1["password"] = const_853;
         param1["radiobutton"] = const_731;
         param1["region"] = const_553;
         param1["restorebox"] = const_1729;
         param1["scaler"] = const_497;
         param1["scaler_horizontal"] = const_1656;
         param1["scaler_vertical"] = const_1636;
         param1["scrollbar_horizontal"] = const_513;
         param1["scrollbar_vertical"] = const_814;
         param1["scrollbar_slider_button_up"] = const_1138;
         param1["scrollbar_slider_button_down"] = const_1211;
         param1["scrollbar_slider_button_left"] = const_1214;
         param1["scrollbar_slider_button_right"] = const_1234;
         param1["scrollbar_slider_bar_horizontal"] = const_1122;
         param1["scrollbar_slider_bar_vertical"] = const_1281;
         param1["scrollbar_slider_track_horizontal"] = const_1230;
         param1["scrollbar_slider_track_vertical"] = const_1229;
         param1["scrollable_itemlist"] = const_1808;
         param1["scrollable_itemlist_vertical"] = WINDOW_TYPE_SCROLLABLE_ITEMLIST_VERTICAL;
         param1["scrollable_itemlist_horizontal"] = const_1128;
         param1["selector"] = const_844;
         param1["selector_list"] = const_956;
         param1["submenu"] = const_1299;
         param1["tab_button"] = const_715;
         param1["tab_container_button"] = const_1123;
         param1["tab_context"] = const_400;
         param1["tab_content"] = const_1289;
         param1["tab_selector"] = const_733;
         param1["text"] = const_862;
         param1["input"] = const_859;
         param1["toolbar"] = const_1858;
         param1["tooltip"] = const_396;
         if(param2 != null)
         {
            for(param2[param1[_loc3_]] in param1)
            {
            }
         }
      }
   }
}
