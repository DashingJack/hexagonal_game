extends MarginContainer

var player_texture
var player_name: String
var player_no: int
var signal_connected: bool = false


func _ready():
	player_no = CommonFunctions.genrate_player_id()
	SignalBus.start_button_pressed.connect(_on_start_button_pressed)


func _on_button_pressed():
	self.queue_free()


func _on_player_profile_pressed():
	SignalBus.icon_selected.connect(_on_icon_selected , 4)


func _on_icon_selected(icon, _index):
	player_texture = icon


func _on_text_edit_text_changed():
	if !SignalBus.player_name_set.is_connected(_get_player_name):
		SignalBus.player_name_set.connect(_get_player_name, 4)


func _get_player_name(name_recived: String):
	player_name = name_recived

func _on_start_button_pressed():
	var player = Player.new(player_no, player_name, player_texture)
	CommonFunctions.players_list.append(player)
