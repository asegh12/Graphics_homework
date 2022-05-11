#version 120                  // GLSL 1.20

uniform mat4 u_PVM; 

// for phong shading
uniform mat4 u_model_matrix;
uniform mat3 u_normal_matrix;

uniform vec3 u_light_position;
uniform vec3 u_light_ambient;
uniform vec3 u_light_diffuse;
uniform vec3 u_light_specular;

uniform vec3  u_obj_ambient;
uniform vec3  u_obj_diffuse;
uniform vec3  u_obj_specular;
uniform float u_obj_shininess;

uniform vec3 u_camera_position;
uniform mat4 u_view_matrix; 

varying vec3 v_color;
varying vec3 v_position;   
varying vec3 v_normal; 

void main()
{
	vec3 color = vec3(0.0);
	vec3 norm = normalize(v_normal);
	
	vec3 light_dir = normalize(u_light_position);

	// ambient
	color += (u_light_ambient * u_obj_ambient);
	
	// diffuse 
	float ndotl = max(dot(norm, light_dir), 0.0);
	color += (ndotl * u_light_diffuse * u_obj_diffuse);

	// specular
	vec3 view_dir = normalize(u_camera_position - v_position);
	vec3 reflect_dir = reflect(-light_dir, norm);

	float rdotv = max(dot(view_dir, reflect_dir), 0.0);
	color += (pow(rdotv, u_obj_shininess) * u_light_specular * u_obj_specular);

	gl_FragColor = vec4(color, 1.0f);
}



