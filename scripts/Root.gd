extends Node

func _ready():
	var player = $Game.player
	$Deplacer.player = player

func _process(delta):
	pass
