extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	SignalBus.player_data_loaded.connect(_on_player_data_loaded)
	SignalBus.play_button_pressed.connect(_on_play_button_pressed)
	SignalBus.play_again_pressed.connect(_on_play_button_pressed)

func _on_player_data_loaded():
	self.visible = false


func _on_play_button_pressed():
	self.visible = true
