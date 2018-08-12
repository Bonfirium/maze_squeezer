shader_type canvas_item;

void fragment() {
	float dx = UV.x - 0.5;
	float dy = UV.y - 0.5;
	float r = sqrt(dx * dx + dy * dy);
	if (r > 0.5) {
		COLOR = vec4(0.5, 0.5, 0.5, 1.0);
		return;
	}
	COLOR = vec4(UV.x, 0.0, UV.y, 1.0 - sin(r * 3.1415926535));
}
