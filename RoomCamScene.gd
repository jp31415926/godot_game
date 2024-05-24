extends Node2D

var staticSprites
var staticVisibleImage
#var ShowStaticOverViewport
var updateStaticTimer

func set_active(active: bool):
	self.set_process(active)
	#self.set_physics_process(active)
	#self.set_process_input(active)
	self.visible = active
	$RoomCamCanvasLayer.set_process(active)
	#$RoomCamCanvasLayer.set_physics_process(active)
	#$RoomCamCanvasLayer.set_process_input(active)
	$RoomCamCanvasLayer.visible = active
	$RoomCamera2D.set_process(active)
	#$RoomCamera2D.set_physics_process(active)
	#$RoomCamera2D.set_process_input(active)
	$RoomCamera2D.visible = active

# Called when the node enters the scene tree for the first time.
func _ready():
	staticSprites = [$RoomCamCanvasLayer/StaticImage1, 
		$RoomCamCanvasLayer/StaticImage2, 
		$RoomCamCanvasLayer/StaticImage3]
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

func _process(delta):
	updateStaticTimer -= delta
	if updateStaticTimer <= 0:
		updateStaticTimer += 1.0/20.0
		
		#if ShowStaticOverViewport:
		staticSprites[staticVisibleImage].visible = false
		staticVisibleImage += 1
		if staticVisibleImage > 2:
			staticVisibleImage = 0
		staticSprites[staticVisibleImage].visible = true

