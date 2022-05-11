#version 120                  // GLSL 1.20

attribute vec3 a_position;    // per-vertex position (per-vertex input)
attribute vec3 a_normal; 

uniform mat4 u_PVM; 

// for phong shading
uniform mat4 u_model_matrix;
uniform mat3 u_normal_matrix;

varying vec3 v_color;
varying vec3 v_position;   
varying vec3 v_normal; 

void main()
{
  gl_Position = u_PVM * vec4(a_position, 1.0f);
  v_position = (u_model_matrix * vec4(a_position, 1.0f)).xyz;
  v_normal = normalize(u_normal_matrix * a_normal);
}


