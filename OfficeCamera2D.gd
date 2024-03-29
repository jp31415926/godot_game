extends Camera2D

var pan_speed_slow = 300
var pan_speed_fast = 800
var max_x_pan = 145
var left_side_slow
var left_side_fast
var right_side_slow
var right_side_fast

# Called when the node enters the scene tree for the first time.
func _ready():
	var sizex = get_viewport().get_visible_rect().size.x
	# line to cross to pan slowly (left and right 3rd of the screen)
	left_side_slow = sizex / 3
	right_side_slow = left_side_slow * 2
	# move fast if in the left or right 5th of the screen
	left_side_fast = sizex / 5
	right_side_fast = left_side_fast * 4
	reset()

func reset():
	offset.x = 0
	offset.y = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# Get the mouse position relative to the viewport
	var mouse_x_position = get_viewport().get_mouse_position().x
	if mouse_x_position < left_side_slow:
		if mouse_x_position < left_side_fast:
			pan_left(delta, pan_speed_fast)
		else:
			pan_left(delta, pan_speed_slow)
			
	elif mouse_x_position > right_side_slow:
		if mouse_x_position > right_side_fast:
			pan_right(delta, pan_speed_fast)
		else:
			pan_right(delta, pan_speed_slow)

func pan_left(delta, speed):
	var x = speed * delta
	if offset.x >= -max_x_pan:
		offset.x = max(offset.x - x, -max_x_pan)

func pan_right(delta, speed):
	var x = speed * delta
	if offset.x <= max_x_pan:
		offset.x = min(offset.x + x, max_x_pan)
