/// pal_swap_set_tiles(palette sprite or surface, pal index, start depth, end depth, pal is surface);
//  Call this every step you want to have all drawings between and including the indicate depths to be palette swapped.  
//  Stop calling it, or set the pal index to 0 to stop palette swapping.
//  Does not need to be called in a draw event.  In fact, I recommend the step event.

var _pal_sprite = argument0;
var _pal_index = argument1;

if(_pal_index == 0) exit;

Pal_Shader_Is_Set = true;
var _low =min(argument2,argument3)+1;
var _high = max(argument2,argument3)-1;
var _is_surface = argument4;

///Check the start object-------------------------
var _start_exists=false;
with(obj_depth_swapper_start)
{
  if(depth==_low)
  { //Object already exists, update the values.
    _start_exists=true;
    active=true;
    pal_sprite=_pal_sprite;
    pal_index=_pal_index;
    pal_is_surface=_is_surface;
  }
}

if(!_start_exists)
{ //Object does not exist.  Create it.
  with(instance_create(0,0,obj_depth_swapper_start))
  {
    active=true;
    depth=_low;
    pal_sprite=_pal_sprite;
    pal_index=_pal_index;
    pal_is_surface=_is_surface;
  }
}

///Check the start object-------------------------
var _end_exists=false;
with(obj_depth_swapper_end)
{
  if(depth==_high)
  { //Object already exists, update the values.
    _end_exists=true;
    active=true;
  }
}

if(!_end_exists)
{ //Object does not exist.  Create it.
  with(instance_create(0,0,obj_depth_swapper_end))
  {
    active=true;
    depth=_high;
  }
}


