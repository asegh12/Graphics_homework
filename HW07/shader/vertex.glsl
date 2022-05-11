#version 120                  // GLSL 1.20

attribute vec3 a_position;    // per-vertex position (per-vertex input)
attribute vec2 a_texcoord;
attribute vec3 a_normal;

uniform mat4 u_PVM;

varying vec2 v_texcoord;
varying vec3 v_normal;
varying vec3 v_position;

void main()
{
  gl_Position = u_PVM * vec4(a_position, 1.0f);
  v_texcoord = a_texcoord;
  v_normal = a_normal;
  v_position = a_position;
}