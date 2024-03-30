extends CanvasLayer

# one hour in the night is 90 seconds in real time
const SecondsInHour = 90

#region variables
var TimeOfDay: int #time of day to display (0 = 12am, 6 = 6am)
var NightNumber: int # night to display
var PowerPercentage: float # power percentage to display
var PowerUsageLevel: int # 1-4 bars to display
var secondTimer: float
var secondsLeftInHour: int

@onready var OfficeLeftDoor : Sprite2D = get_node("%LeftDoor")
@onready var OfficeRightDoor : Sprite2D = get_node("%RightDoor")
#endregion

# Called when the node enters the scene tree for the first time.
func _ready():
	reset()

func reset():
	TimeOfDay = 0 # 12am
	NightNumber = 1 # night to display
	PowerPercentage = 100 # power percentage to display
	PowerUsageLevel = 1 # 1-4 bars to display
	secondTimer = 1.0
	secondsLeftInHour = SecondsInHour

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _physics_process(delta):
	secondTimer -= delta

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
	$PowerLabel.set_text("%d%%" % int(PowerPercentage))

	if secondTimer < 0.0:
		secondTimer += 1.0
		secondsLeftInHour -= 1
		# do stuff here every second
		
		# every second the power available drops by powerlevel / 10
		# if nothing is on, 1/10 per sec, or 1 percent every 10 secs
		# if one thing on, 2/10 (1/5) per sec, or 1 percent every 5 secs
		PowerPercentage -= PowerUsageLevel / 10.0
		if secondsLeftInHour <= 0:
			secondsLeftInHour = SecondsInHour
			TimeOfDay += 1
			$TODLabel.set_text("%d AM" % TimeOfDay)
			if TimeOfDay >= 6:
				pass # TODO: Reset to next day
				
