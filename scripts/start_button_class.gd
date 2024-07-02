class_name StartButton extends Button


# Called when the node enters the scene tree for the first time.
func _ready():
	self.text = "Start"
	self.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
	self.pressed.connect(_on_pressed)

func _on_pressed():
	SignalBus.start_button_pressed.emit()
	print("button presssed")
