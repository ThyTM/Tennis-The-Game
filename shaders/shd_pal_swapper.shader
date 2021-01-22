attribute vec3 in_Position;                  // (x,y,z)
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
    v_vColour = in_Colour;
    v_vTexcoord = in_TextureCoord;
}

//######################_==_YOYO_SHADER_MARKER_==_######################@~varying vec2 v_vTexcoord;
varying vec4 v_vColour;

#define Transparent vec4(.0,.0,.0,.0)
#define Tolerance 0.004 

uniform sampler2D u_palTexture;
uniform vec4 u_Uvs;
uniform float u_paletteId;
uniform vec2 u_pixelSize;

vec4 findAltColor(vec4 inCol, vec2 corner)
{
  if(inCol.a == 0.0){ return Transparent;}
  
  float dist;
  vec2 testPos;
  vec4 leftCol;
  for(float i = corner.y; i < 1.0; i+=u_pixelSize.y)
  {
    testPos = vec2(corner.x,i);
    leftCol = texture2D(u_palTexture, testPos);
    dist = distance(leftCol,inCol);
    if(dist < Tolerance)
    {
      testPos = vec2(corner.x+=u_pixelSize.x*u_paletteId,i);
      return texture2D( u_palTexture,testPos);
    }
  }
  return inCol;
}

void main()
{
  vec4 col = texture2D( gm_BaseTexture, v_vTexcoord);
  gl_FragColor = v_vColour * findAltColor(col, u_Uvs.xy);
}

