extends ItemList


# Called when the node enters the scene tree for the first time.
func _ready():
	SignalBus.icon_select_button_pressed.connect(_on_icon_select_button_pressed)

func _on_icon_select_button_pressed(index):
	self.visible = true
	if index >= 0:
		self.set_item_disabled(index, false)
	self.deselect_all()


func _on_item_selected(index):
	SignalBus.icon_selected.emit(self.get_item_icon(index), index)
	self.set_item_disabled(index, true)
	self.visible = false
