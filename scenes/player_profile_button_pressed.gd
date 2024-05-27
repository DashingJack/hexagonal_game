extends Button

var selected_index: int

# Called when the node enters the scene tree for the first time.
func _ready():
	selected_index = -1
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_pressed():
	SignalBus.icon_selected.connect(_on_icon_selected , 4)
	SignalBus.icon_select_button_pressed.emit(selected_index)


func _on_icon_selected(icon, index):
	selected_index = index
	self.set_button_icon(icon)
