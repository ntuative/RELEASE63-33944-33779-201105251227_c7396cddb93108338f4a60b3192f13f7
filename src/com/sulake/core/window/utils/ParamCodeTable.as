package com.sulake.core.window.utils
{
   import com.sulake.core.window.enum.WindowParam;
   import flash.utils.Dictionary;
   
   public class ParamCodeTable extends WindowParam
   {
       
      
      public function ParamCodeTable()
      {
         super();
      }
      
      public static function fillTables(param1:Dictionary, param2:Dictionary = null) : void
      {
         var _loc3_:* = null;
         param1["MessengerView"] = const_194;
         param1["bound_to_parent_rect"] = const_102;
         param1["child_window"] = const_1193;
         param1["embedded_controller"] = const_1202;
         param1["resize_to_accommodate_children"] = WINDOW_PARAM_RESIZE_TO_ACCOMMODATE_CHILDREN;
         param1["input_event_processor"] = const_31;
         param1["internal_event_handling"] = const_928;
         param1["mouse_dragging_target"] = const_290;
         param1["mouse_dragging_trigger"] = const_372;
         param1["mouse_scaling_target"] = const_305;
         param1["mouse_scaling_trigger"] = const_590;
         param1["horizontal_mouse_scaling_trigger"] = const_266;
         param1["vertical_mouse_scaling_trigger"] = const_280;
         param1["observe_parent_input_events"] = const_1140;
         param1["optimize_region_to_layout_size"] = const_469;
         param1["parent_window"] = const_1171;
         param1["relative_horizontal_scale_center"] = const_197;
         param1["relative_horizontal_scale_fixed"] = const_158;
         param1["relative_horizontal_scale_move"] = const_382;
         param1["relative_horizontal_scale_strech"] = const_426;
         param1["relative_scale_center"] = const_1293;
         param1["relative_scale_fixed"] = const_982;
         param1["relative_scale_move"] = const_1136;
         param1["relative_scale_strech"] = const_1107;
         param1["relative_vertical_scale_center"] = const_217;
         param1["relative_vertical_scale_fixed"] = const_144;
         param1["relative_vertical_scale_move"] = const_251;
         param1["relative_vertical_scale_strech"] = const_312;
         param1["on_resize_align_left"] = const_756;
         param1["on_resize_align_right"] = const_554;
         param1["on_resize_align_center"] = const_536;
         param1["on_resize_align_top"] = const_848;
         param1["on_resize_align_bottom"] = const_492;
         param1["on_resize_align_middle"] = const_511;
         param1["on_accommodate_align_left"] = const_1221;
         param1["on_accommodate_align_right"] = const_466;
         param1["on_accommodate_align_center"] = const_925;
         param1["on_accommodate_align_top"] = const_1126;
         param1["on_accommodate_align_bottom"] = const_519;
         param1["on_accommodate_align_middle"] = const_873;
         param1["route_input_events_to_parent"] = const_489;
         param1["use_parent_graphic_context"] = const_34;
         param1["draggable_with_mouse"] = const_1280;
         param1["scalable_with_mouse"] = const_1166;
         param1["reflect_horizontal_resize_to_parent"] = const_587;
         param1["reflect_vertical_resize_to_parent"] = const_600;
         param1["reflect_resize_to_parent"] = const_307;
         param1["force_clipping"] = WINDOW_PARAM_FORCE_CLIPPING;
         param1["inherit_caption"] = const_1271;
         if(param2 != null)
         {
            for(param2[param1[_loc3_]] in param1)
            {
            }
         }
      }
   }
}
