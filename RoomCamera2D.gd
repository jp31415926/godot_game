extends Camera2D

const pan_speed = 20
const max_x_pan = 224
const min_x_pan = 0
var panning_left = false

# Called when the node enters the scene tree for the first time.
func _ready():
	reset()

func reset():
	offset.x = 0
	panning_left = false

func _process(delta):
	if panning_left:
		pan_left(delta, pan_speed)
	else:
		pan_right(delta, pan_speed)
			

func pan_left(delta, speed):
	var x = speed * delta
	if offset.x > min_x_pan:
		offset.x = max(offset.x - x, min_x_pan)
	else:
		panning_left = false
		
func pan_right(delta, speed):
	var x = speed * delta
	if offset.x < max_x_pan:
		offset.x = min(offset.x + x, max_x_pan)
	else:
		panning_left = true
