extends Button


# Called when the node enters the scene tree for the first time.
func _ready():
	self.pressed.connect(_on_roll_pressed)
	SignalBus.choice_made.connect(_on_choice_made)

func _on_roll_pressed():
	self.disabled = true
	SignalBus.dice_rolled.emit(CommonFunctions.roll_dice())

func _on_choice_made(_steps, _direction, _player_id):
	self.diabled = false
