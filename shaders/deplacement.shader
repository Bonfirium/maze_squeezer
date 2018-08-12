shader_type canvas_item;

void fragment() {
	vec2 orig_pos = vec2(UV.x, 1.0 - UV.y);
	vec2 deplacement = texture(TEXTURE, orig_pos).rb - 0.5;
	deplacement.y *= -1.0;
	vec2 new_pos = orig_pos - deplacement;
	vec4 color = texture(SCREEN_TEXTURE, new_pos);
	color.a = 1.0;
	COLOR = color;
}
