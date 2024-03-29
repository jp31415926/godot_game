extends CanvasLayer

#region variables
var TimeOfDay: int #time of day to display (0 = 12am, 6 = 6am)
var NightNumber: int # night to display
var PowerPercentage: int # power percentage to display
var PowerUsageLevel: int # 1-4 bars to display

var secondCounter: float
@onready var OfficeLeftDoor : Sprite2D = get_node("%LeftDoor")
@onready var OfficeRightDoor : Sprite2D = get_node("%RightDoor")
#endregion

# Called when the node enters the scene tree for the first time.
func _ready():
	reset()

func reset():
	TimeOfDay = 0 # 12am
	NightNumber = 1 # night to display
	PowerPercentage = 99 # power percentage to display
	PowerUsageLevel = 1 # 1-4 bars to display
	secondCounter = 1.0

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _physics_process(delta):
	secondCounter -= delta
	if secondCounter < 0.0:
		secondCounter += 1.0

		# do stuff here every second
		PowerPercentage -= 1

	PowerUsageLevel = 1
	if not OfficeLeftDoor.DoorOpen:
		PowerUsageLevel += 1
	if OfficeLeftDoor.LightOn:
		PowerUsageLevel += 1
	if not OfficeRightDoor.DoorOpen:
		PowerUsageLevel += 1
	if OfficeRightDoor.LightOn:
		PowerUsageLevel += 1
	$UsageLabel.set_text("Usage: %d" % PowerUsageLevel)
	$PowerLabel.set_text("%d%%" % PowerPercentage)
		
