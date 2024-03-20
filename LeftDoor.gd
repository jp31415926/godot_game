extends Sprite2D

var animation_player : AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	animation_player = $AnimationPlayer

func open_door():
	animation_player.play("open_door")

func close_door():
	animation_player.play_backwards("open_door")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
