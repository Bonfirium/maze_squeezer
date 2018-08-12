shader_type canvas_item;

void fragment() {
	vec2 new_pos = UV + vec2(sin(TIME + UV.x * 6.5), cos(TIME + UV.y * 3.5)) * 0.1;
	vec4 color = texture(TEXTURE, new_pos);
	if (new_pos.x < 0.0 || new_pos.x >= 1.0 || new_pos.y < 0.0 || new_pos.y >= 1.0) {
		color = vec4(0.0, 0.0, 0.0, 1.0);
	}
	COLOR = color;
}
