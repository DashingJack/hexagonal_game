class_name StartButton extends Button


# Called when the node enters the scene tree for the first time.
func _ready():
	self.text = "Start"
	self.size_flags_horizontal = Control.SIZE_SHRINK_CENTER


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
