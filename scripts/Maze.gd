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
	$Player.position = Vector2(randi() % width + 0.5, randi() % height + 0.5) * 64
	$Player.matrix = matrix
	$Map.matrix = matrix
