///pal_swap_set(palette_sprite_index, palette_index,palette is surface);

var _pal_sprite = argument0;
var _pal_index = argument1;
if (_pal_index == 0) exit;
var mode = Pal_Shader_Type.Standard;
if (!argument2)
{ //Using a sprite based palette
  if (Pal_HTML5)
  {
    shader_set(Pal_HTML5_Sprite);
    mode = Pal_Shader_Type.HTML_Sprite;
  }
  else
    shader_set(Pal_Shader);
  Pal_Shader_Is_Set = true;
  var tex = sprite_get_texture(_pal_sprite, 0);
  var UVs = sprite_get_uvs(_pal_sprite, 0);
  texture_set_stage(Pal_Texture[mode], tex);
  texture_set_interpolation_ext(Pal_Texture[mode], true);
  var texel_x = texture_get_texel_width(tex);
  var texel_y = texture_get_texel_height(tex);
  var texel_hx = texel_x * 0.5;
  var texel_hy = texel_y * 0.5;
  shader_set_uniform_f(Pal_Texel_Size[mode], texel_x, texel_y);
  shader_set_uniform_f(Pal_UVs[mode], UVs[0] + texel_hx, UVs[1] + texel_hy, UVs[2] + texel_hx, UVs[3] + texel_hy);
  shader_set_uniform_f(Pal_Index[mode], _pal_index);
}
else
{ //Using a surface based palette
  if (Pal_HTML5)
  {
    shader_set(Pal_HTML5_Surface);
    mode = Pal_Shader_Type.HTML_Surface;
  }
  else
    shader_set(Pal_Shader);
  Pal_Shader_Is_Set = true;
  var tex = surface_get_texture(_pal_sprite);
  texture_set_stage(Pal_Texture[mode], tex);
  texture_set_interpolation_ext(Pal_Texture[mode], true);
  var texel_x = texture_get_texel_width(tex);
  var texel_y = texture_get_texel_height(tex);
  var texel_hx = texel_x * 0.5;
  var texel_hy = texel_y * 0.5;
  shader_set_uniform_f(Pal_Texel_Size[mode], texel_x, texel_y);
  shader_set_uniform_f(Pal_UVs[mode], texel_hx, texel_hy, 1.0 + texel_hx, 1.0 + texel_hy);
  shader_set_uniform_f(Pal_Index[mode], _pal_index);
}

