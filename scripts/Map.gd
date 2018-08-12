extends Node2D
export (Texture) var star_texture
var matrix
func _draw():
	for y in range(matrix.size()):
		for x in range(matrix[y].size()):
			match matrix[y][x]:
				1: draw_rect(Rect2(Vector2(x, y) * 64, Vector2(64, 64)), Color(0, 0, 0))
				2: draw_texture_rect(
					star_texture,
					Rect2(Vector2(x, y) * 64 + Vector2(16, 16), Vector2(32, 32)),
					false)
