extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	visible = false
	SignalBus.game_won.connect(_on_game_won)

func _on_game_won(_player_name, _texture):
	visible = true

func _on_play_again_pressed():
	visible = false
