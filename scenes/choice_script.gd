extends Button

var die1: int
var die2: int

@export var choice_swap: bool

func _ready():
	SignalBus.dice_rolled.connect(_on_dice_rolled)
	self.pressed.connect(_on_choice_made)

func _on_dice_rolled(roll: Array[int]):
	self.disabled = false
	die1 = roll[1] if choice_swap == false else roll[2]
	die2 = roll[2] if choice_swap == false else roll[1]
	self.text = "Move %d Steps in Direction %d" % [die1, die2]

func _on_choice_made():
	self.diabled = true
	SignalBus.choice_made.emit(die1, die2, CommonFunctions.current_player)
