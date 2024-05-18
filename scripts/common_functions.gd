extends Node

var global_player_id_int: int = 0
var player_id_list: Array[int]

func genrate_player_id() -> int:
	global_player_id_int += 1
	player_id_list.append(global_player_id_int)
	return global_player_id_int
