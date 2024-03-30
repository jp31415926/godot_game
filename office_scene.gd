extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	# Connect the input event
	set_process_input(true)
	# Disable resizeable. This will force our window to have focus on startup
	# https://github.com/godotengine/godot/issues/74587
	DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_RESIZE_DISABLED, true)

func reset():
	pass

func _input(event):
	# Check if the ESC key was pressed
	if event.is_action_pressed("quit_game"):
		# Quit the game
		get_tree().quit()

	if event.is_action_pressed("toggle_camera"):
		get_tree().change_scene_to_file("res://RoomCameraScene.tscn")
