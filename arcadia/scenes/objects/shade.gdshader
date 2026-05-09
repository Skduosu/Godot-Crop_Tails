shader_type canvas_item;

// 左右摇晃的幅度
uniform float shake_intensity = 0.0;
// 摇晃的速度
uniform float shake_speed = 25.0;

// 从顶点开始摇晃
void vertex() {
	vec2 shake = vec2(0, 0);
	
	if(VERTEX.y < 0.0) {
		shake.x = sin(TIME * shake_speed + VERTEX.y) * shake_intensity;
	}
	
	VERTEX.xy += shake;
}
