extends Button

var roll: Roll

@export var choice_swap: bool

func _ready():
	SignalBus.choice_to_made.connect(_on_dice_rolled)
	SignalBus.choice_made.connect(_on_choice_made)
	self.pressed.connect(_on_pressed)
	self.visible = false

func _on_dice_rolled(roll_recived: Roll):
	roll = roll_recived
	if choice_swap == true and (roll.get_is_same() || !roll.get_is_inverse_possible()):
		return
	self.visible = true
	if choice_swap == false:
		self.text = "Move %d Steps in Direction %d" % [roll.get_die1(), roll.get_die2()]
	else:
		self.text = "Move %d Steps in Direction %d" % [roll.get_die2(), roll.get_die1()]

func _on_pressed():
	self.visible = false
	if choice_swap == true:
		roll.invert()
	SignalBus.choice_made.emit(roll)

func _on_choice_made(_roll):
	self.visible = false
