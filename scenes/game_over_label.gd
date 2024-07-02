extends Label


# Called when the node enters the scene tree for the first time.
func _ready():
	SignalBus.game_won.connect(_on_game_won)

func _on_game_won(player_name, _texture):
	text = "%s won, congrats" %[player_name]
