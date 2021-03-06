extends Node
export (int) var width = 16
export (int) var height = 16
var matrix = []
var player
var dirs = [
	Vector2(1, 0),
	Vector2(0, -1),
	Vector2(-1, 0),
	Vector2(0, 1),
]
func save_matrix(temp_matrix):
	var result = []
	for y in range(height):
		var column = []
		column.resize(width)
		for x in range(width):
			column[x] = temp_matrix[y][x] != 2
		result.append(column)
	return result
func generate_maze():
	var temp_matrix = []
	var pre_size = Vector2(width - 1, height - 1)
	for y in range(height):
		var column = []
		column.resize(width)
		for x in range(width):
			column[x] = 0 if y > 0 and y < pre_size.y and x > 0 and x < pre_size.x else 3
		temp_matrix.append(column)
	var q = [Vector2(1 + randi() % (width - 2), 1 + randi() % (height - 2))]
	temp_matrix[q[0].y][q[0].x] = 1
	while q.size() > 0:
		var index = randi() % q.size()
		var pos = q[index]
		if (index != q.size() - 1): q[index] = q.pop_back()
		else: q.pop_back()
		if temp_matrix[pos.y][pos.x] != 1: continue
		temp_matrix[pos.y][pos.x] = 2
		for dir in dirs:
			var this_pos = pos + dir
			match temp_matrix[this_pos.y][this_pos.x]:
				1: temp_matrix[this_pos.y][this_pos.x] = 3
				0:
					temp_matrix[this_pos.y][this_pos.x] = 1
					q.append(this_pos)
	return save_matrix(temp_matrix)
func _ready():
	matrix = generate_maze()
	player = $Player
	player.position = Vector2(randi() % width + 0.5, randi() % height + 0.5) * 64
	player.matrix = matrix
	$Map.matrix = matrix
