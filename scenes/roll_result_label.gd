extends Label

var current_player_name

# Called when the node enters the scene tree for the first time.
func _ready():
	SignalBus.dice_rolled.connect(_on_dice_rolled)

func _on_dice_rolled(roll: Array[int]):
	current_player_name = CommonFunctions.current_player.player_name
	self.text = "%s have rolled %d and %d" % [current_player_name, roll[0], roll[1]]
