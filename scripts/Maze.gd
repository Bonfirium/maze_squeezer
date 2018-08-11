extends Area2D

export (int) var width = 16
export (int) var height = 16
var matrix = []

func _ready():
	for y in range(height):
		var column = []
		column.resize(width)
		for x in range(width):
			column[x] = [false, true][randi() % 2]
		matrix.append(column)
	$Player.position = Vector2(rand_range(0, 512), rand_range(0, 512))
	$Player.matrix = matrix
	$Map.matrix = matrix
