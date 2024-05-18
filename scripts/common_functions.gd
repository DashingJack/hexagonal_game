extends Node

var global_player_id_int: int = 0
var player_id_list: Array[int]
var current_player

func _on_ready():
	SignalBus.player_moved.connect(_on_player_moved)

func genrate_player_id() -> int:
	global_player_id_int += 1
	player_id_list.append(global_player_id_int)
	return global_player_id_int

func _on_player_moved():
	current_player = player_id_list[(player_id_list.find(current_player) + 1) % player_id_list.size()]

func roll_dice() -> Array[int]:
	var roll: Array[int] = [randi_range(1, 6), randi_range(1, 6)]
	return roll

func start_game():
	current_player = player_id_list[1]
