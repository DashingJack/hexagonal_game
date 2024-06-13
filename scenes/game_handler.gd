extends Node2D

var current_player: int
var current_player_reference
var no_of_players

# Called when the node enters the scene tree for the first time.
func _ready():
	SignalBus.player_data_recived.connect(_on_player_data_recived)
	SignalBus.player_data_loaded.connect(_on_player_data_loaded)
	SignalBus.player_moved.connect(_on_player_moved)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_player_data_recived():
	no_of_players = CommonFunctions.no_of_players
	for player in CommonFunctions.players_list:
		self.add_child(player)


func _on_player_data_loaded():
	self.visible = true
	current_player = 0
	current_player_reference = CommonFunctions.players_list[current_player]
	CommonFunctions.current_player = current_player_reference
	SignalBus.choice_made.connect(current_player_reference.move_player, 4)


func _on_player_moved():
	current_player = (current_player + 1) % no_of_players
	current_player_reference = CommonFunctions.players_list[current_player]
	CommonFunctions.current_player  = current_player_reference
	SignalBus.choice_made.connect(current_player_reference.move_player, 4)
