extends GridContainer

@export var uid_string: String

var uid: int
var add_player_ui_load

# Called when the node enters the scene tree for the first time.
func _ready():
	uid = ResourceUID.text_to_id(uid_string)
	if ResourceUID.has_id(uid):
		add_player_ui_load = load(ResourceUID.get_id_path(uid))
	SignalBus.start_button_pressed.connect(_on_start_button_pressed)


func _on_add_player_pressed():
	self.add_child(add_player_ui_load.instantiate())
	if self.get_child_count() == 2:
		SignalBus.game_can_be_started.emit()


func _on_child_exiting_tree(node):
	if self.get_child_count() == 2:
		SignalBus.game_can_not_be_started.emit()


func _on_start_button_pressed():
	CommonFunctions.no_of_players = self.get_child_count()
