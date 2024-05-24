extends Node2D

enum
{
	STATE_MAIN_MENU,
	STATE_CONFIG_MENU,
	STATE_OFFICE,
	STATE_ROOM_CAMERA
}

var CurrentState

# Called when the node enters the scene tree for the first time.
func _ready():
	# Connect the input event
	set_process_input(true)
	# Disable resizeable. This will force our window to have focus on startup
	# https://github.com/godotengine/godot/issues/74587
	DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_RESIZE_DISABLED, true)

	reset()

func reset():
	$OfficeScene.set_active(false)
	$RoomCamScene.set_active(true)
	CurrentState = STATE_ROOM_CAMERA

func _input(event):
	# Check if the ESC key was pressed
	if event.is_action_pressed("quit_game"):
		# Quit the game
		get_tree().quit()

	match CurrentState:
		STATE_MAIN_MENU:
			pass

		STATE_OFFICE:
			if event.is_action_pressed("toggle_camera"):
				$OfficeScene.set_active(false)
				$RoomCamScene.set_active(true)
				CurrentState = STATE_ROOM_CAMERA

		STATE_ROOM_CAMERA:
			if event.is_action_pressed("toggle_camera"):
				$RoomCamScene.set_active(false)
				$OfficeScene.set_active(true)
				CurrentState = STATE_OFFICE
