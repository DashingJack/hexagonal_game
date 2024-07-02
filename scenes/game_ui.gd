extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	SignalBus.player_data_loaded.connect(_on_player_data_loaded)
	SignalBus.game_won.connect(_on_game_won)


func _on_player_data_loaded():
	self.visible = true

func _on_game_won(_player_name, _texture):
	visible = false
