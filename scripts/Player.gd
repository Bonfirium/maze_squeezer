extends Node2D
var matrix = null
func check_vert_collision(wall_from, circle_pos, circle_radius):
	var wall_to = wall_from + Vector2(0, 1)
	var dx_pow = pow(circle_pos.x - wall_from.x, 2)
	if circle_pos.y < wall_from.y: return circle_radius > sqrt(dx_pow + pow(circle_pos.y - wall_from.y, 2))
	if circle_pos.y <= wall_to.y: return circle_radius > abs(circle_pos.x - wall_from.x)
	return circle_radius > sqrt(dx_pow + pow(circle_pos.y - wall_to.y, 2))
func check_hor_collision(wall_from, circle_pos, circle_radius):
	var wall_to = wall_from + Vector2(1, 0)
	var dy_pow = pow(circle_pos.y - wall_from.y, 2)
	if circle_pos.x < wall_from.x: return circle_radius > sqrt(dy_pow + pow(circle_pos.x - wall_from.x, 2))
	if circle_pos.x <= wall_to.x: return circle_radius > abs(circle_pos.y - wall_from.y)
	return circle_radius > sqrt(dy_pow + pow(circle_pos.x - wall_to.x, 2))
func is_collide(pos):
	var grid_pos = Vector2(floor(pos.x - 0.5), floor(pos.y - 0.5))
	for i in range(4):
		var is_vert = (i + 1) % 4 < 2
		var cell_1 = grid_pos + Vector2(1 if i == 2 else 0, 1 if i == 3 else 0)
		var cell_2 = cell_1 + Vector2(1 if is_vert else 0, 1 if not is_vert else 0)
		var val_1 = matrix[cell_1.y][cell_1.x]
		var val_2 = matrix[cell_2.y][cell_2.x]
		if val_1 == val_2 or (val_1 != 1 and val_2 != 1): continue
		var wall_from = grid_pos + Vector2(0 if i == 1 else 1, 0 if i == 0 else 1)
		if is_vert:
			if check_vert_collision(wall_from, pos, 0.2): return true
		elif check_hor_collision(wall_from, pos, 0.2): return true
	return false
func _process(delta):
	var velocity = Vector2()
	if Input.is_key_pressed(KEY_W): velocity.y -= 1
	if Input.is_key_pressed(KEY_A): velocity.x -= 1
	if Input.is_key_pressed(KEY_D): velocity.x += 1
	if Input.is_key_pressed(KEY_S): velocity.y += 1
	if velocity.length() > 0:
		var new_pos = position + velocity.normalized() * delta * 256
		var new_pos_x = Vector2(new_pos.x, position.y)
		if not is_collide(new_pos_x / 64): position.x = new_pos.x
		elif velocity.y > 0: new_pos = position + Vector2(0, velocity.y).normalized() * delta * 256
		var new_pos_y = Vector2(position.x, new_pos.y)
		if not is_collide(new_pos_y / 64): position.y = new_pos.y
func _draw(): draw_circle(Vector2(), 16, Color(0.5, 0, 0))
