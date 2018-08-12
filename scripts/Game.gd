extends Node
export (int) var width = 16
export (int) var height = 16
var matrix = []
var player
func save_matrix(temp_matrix):
	var result = []
	for y in range(height):
		var column = []
		column.resize(width)
		for x in range(width):
			column[x] = temp_matrix[y][x] == 3
		result.append(column)
	return result
func generate_maze():
	var temp_matrix = []
	var pre_size = Vector2(width - 1, height - 1)
	for y in range(height):
		var column = []
		column.resize(width)
		for x in range(width): column[x] = 0 if y > 0 and y < pre_size.y and x > 0 and x < pre_size.x else 3
		temp_matrix.append(column)
	return save_matrix(temp_matrix)
func _ready():
	matrix = generate_maze()
	print(matrix)
	player = $Player
	player.position = Vector2(randi() % width + 0.5, randi() % height + 0.5) * 64
	player.matrix = matrix
	$Map.matrix = matrix
