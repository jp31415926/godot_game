extends Sprite2D

var animation_player : AnimationPlayer
var audio_player : AudioStreamPlayer
@export var DoorOpen : bool
@export var LightOn : bool

# Called when the node enters the scene tree for the first time.
func _ready():
	animation_player = $AnimationPlayer
	audio_player = $AudioStreamPlayer
	reset()

func reset():
	animation_player.play("RESET")
	DoorOpen = true
	LightOn = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func open_door():
	DoorOpen = true
	animation_player.play("open_door")
	audio_player.play()

func close_door():
	DoorOpen = false
	animation_player.play_backwards("open_door")
	audio_player.play()

func _on_right_door_button_toggled(toggled_on):
	if toggled_on:
		close_door()
	else:
		open_door()

func light_on():
	LightOn = true
	# if left light is already on, turn it off
	if get_node("%LeftDoor").LightOn:
		get_node("%LeftDoor").light_off()

func light_off():
	LightOn = false
	get_node("%RightLightButton").button_pressed = false

func _on_right_light_button_toggled(toggled_on):
	if toggled_on:
		light_on()
	else:
		light_off()
