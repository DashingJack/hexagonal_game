extends Node

var global_player_id_int: int = -1
var no_of_players: int
var players_list: Array[Player]
var current_player

func _on_ready():
	SignalBus.player_moved.connect(_on_player_moved)

func genrate_player_id() -> int:
	global_player_id_int += 1
	return global_player_id_int

func _on_player_moved():
	current_player = (current_player + 1) % players_list.size()

func roll_dice() -> Array[int]:
	var roll: Array[int] = [randi_range(1, 6), randi_range(1, 6)]
	return roll

func start_game():
	players_list.sort_custom(func(a, b): return a.player_id < b.player_id)
	current_player = 0

