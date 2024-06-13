extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	SignalBus.player_data_loaded.connect(_on_player_data_loaded)
	SignalBus.player_data_recived.connect(_on_player_data_recived)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_player_data_loaded():
	self.visible = true

func _on_player_data_recived():
	for player in CommonFunctions.players_list:
		self.add_child(player)
