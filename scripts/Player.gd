extends Node2D

var matrix = null

func _ready():
	pass

func _process(delta):
	var velocity = Vector2()
	if Input.is_key_pressed(KEY_W):
		velocity.y -= 1
	if Input.is_key_pressed(KEY_A):
		velocity.x -= 1
	if Input.is_key_pressed(KEY_D):
		velocity.x += 1
	if Input.is_key_pressed(KEY_S):
		velocity.y += 1
	if velocity.length() == 0:
		pass
	position += velocity.normalized() * delta * 256

func _draw():
	draw_circle(position, 16, Color(0, 0, 1))
