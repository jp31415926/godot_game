extends Node2D

var staticSprites
var staticVisibleImage
#var ShowStaticOverViewport
var updateStaticTimer

# Called when the node enters the scene tree for the first time.
func _ready():
	# Connect the input event
	set_process_input(true)
	staticSprites = [$CanvasLayer/StaticImage1, 
		$CanvasLayer/StaticImage2, 
		$CanvasLayer/StaticImage3]
	reset()

func reset():
	staticSprites[0].visible = true
	staticSprites[1].visible = false
	staticSprites[2].visible = false
	staticSprites[0].modulate = 0xffffff40
	staticSprites[1].modulate = 0xffffff40
	staticSprites[2].modulate = 0xffffff40
	#ShowStaticOverViewport = true
	staticVisibleImage = 0
	updateStaticTimer = 0

func _physics_process(delta):
	updateStaticTimer -= delta
	if updateStaticTimer <= 0:
		updateStaticTimer += 1.0/20.0
		
		#if ShowStaticOverViewport:
		staticSprites[staticVisibleImage].visible = false
		staticVisibleImage += 1
		if staticVisibleImage > 2:
			staticVisibleImage = 0
		staticSprites[staticVisibleImage].visible = true

func _input(event):
	# Check if the ESC key was pressed
	if event.is_action_pressed("quit_game"):
		# Quit the game
		get_tree().quit()

	if event.is_action_pressed("toggle_camera"):
		#reset()
		#ShowStaticOverViewport = false
		get_tree().change_scene_to_file("res://office_scene.tscn")
