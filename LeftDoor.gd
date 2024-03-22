extends Sprite2D

var animation_player : AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	animation_player = $AnimationPlayer
	animation_player.play("RESET")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func open_door():
	animation_player.play("open_door")

func close_door():
	animation_player.play_backwards("open_door")

func _on_left_door_button_toggled(toggled_on):
	if toggled_on:
		close_door()
	else:
		open_door()

func light_on():
	pass

func light_off():
	pass

func _on_left_light_button_toggled(toggled_on):
	if toggled_on:
		light_on()
	else:
		light_off()
