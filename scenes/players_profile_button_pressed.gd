extends Button

var selected_index: int

# Called when the node enters the scene tree for the first time.
func _ready():
	selected_index = -1


func _on_pressed():
	SignalBus.icon_selected.connect(_on_icon_selected , 4)
	SignalBus.icon_select_button_pressed.emit(selected_index)


func _on_icon_selected(icon_recived, index):
	selected_index = index
	self.set_button_icon(icon_recived)
