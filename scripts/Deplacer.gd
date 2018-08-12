extends Viewport

var player

func _ready():
	pass

func _process(delta):
	$PlayerDeplace.position = player.position
