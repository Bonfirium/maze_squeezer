extends Node2D

var matrix

func _ready():
	update()
	pass

func _draw():
	for y in range(matrix.size()):
		for x in range(matrix[y].size()):
			if matrix[y][x]:
				draw_rect(Rect2(Vector2(x, y) * 64, Vector2(64, 64)), Color(1, 0, 0))
	pass
