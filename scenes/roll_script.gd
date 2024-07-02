extends Button

func _ready():
	self.pressed.connect(_on_roll_pressed)
	SignalBus.player_moved.connect(_on_player_moved)

func _on_roll_pressed():
	self.disabled = true
	SignalBus.roll_button_pressed.emit()

func _on_player_moved():
	self.disabled = false
