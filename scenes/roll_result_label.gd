extends Label


# Called when the node enters the scene tree for the first time.
func _ready():
	SignalBus.dice_rolled.connect(_on_dice_rolled)

func _on_dice_rolled(roll: Array[int]):
	self.text = "you have rolled %d and %d" % [roll[0], roll[1]]
