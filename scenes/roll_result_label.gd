extends Label

var current_player_name

# Called when the node enters the scene tree for the first time.
func _ready():
	SignalBus.choice_to_made.connect(_on_dice_rolled)

func _on_dice_rolled(roll: Roll):
	current_player_name = CommonFunctions.current_player.name
	self.text = "%s have rolled %d and %d" % [current_player_name, roll.get_die1(), roll.get_die2()]
