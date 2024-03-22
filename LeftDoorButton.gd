extends Area2D

var off_sprite : Sprite2D
var on_sprite : Sprite2D
var is_on_sprite = false

func _ready():
	off_sprite = $DoorButtonOff
	on_sprite = $DoorButtonOn
	off_sprite.visible = true
	on_sprite.visible = false

func _input(event):
	if event is InputEventMouseButton:
		if event.pressed:
			if is_mouse_in_area(event.position):
				toggle_sprites()

func is_mouse_in_area(mouse_position: Vector2) -> bool
	var area_rect = $CollisionPolygon2D. #.get_collision_rect()
	return area_rect.has_point(mouse_position)

func toggle_sprites():
	if is_on_sprite:
		off_sprite.visible = true
		on_sprite.visible = false
	else:
		off_sprite.visible = false
		on_sprite.visible = true
	
	is_on_sprite = !is_on_sprite

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
