extends Camera2D

const pan_speed = 20
const max_x_pan = 224
const min_x_pan = 0
var current_x
var panning_left := false

# Called when the node enters the scene tree for the first time.
func _ready():
	offset.x = 0
	offset.y = 0
	reset()

func reset():
	current_x = offset.x
	panning_left = false

func _process(delta):
	var x = pan_speed * delta
	if panning_left:
		if offset.x > min_x_pan:
			offset.x = max(offset.x - x, min_x_pan)
		else:
			panning_left = false
	else: #panning right
		if offset.x < max_x_pan:
			offset.x = min(offset.x + x, max_x_pan)
		else:
			panning_left = true
