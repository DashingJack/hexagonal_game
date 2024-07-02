extends Node

var global_player_id_int: int = -1
var no_of_players: int
var players_list: Array[Player]
var current_player
var tilemap_reference: TileMap

const spawn_points: Array[Vector2i]= [Vector2i(-6,2), Vector2i(-6,-4), Vector2i(0,-7), Vector2i(6,-4), Vector2i(6,2), Vector2i(0,5)]

func _ready():
	SignalBus.start_button_pressed.connect(_on_start_button_pressed)
	SignalBus.player_data_recived.connect(_on_player_data_recived)
	set_process(false)

func _process(_delta):
	if no_of_players == players_list.size():
		SignalBus.player_data_recived.emit()
		set_process(false)

func genrate_player_id() -> int:
	global_player_id_int += 1
	return global_player_id_int

func _on_start_button_pressed():
	set_process(true)

func _on_player_data_recived():
	players_list.sort_custom(func(a, b): return a.player_id < b.player_id)
	SignalBus.player_data_loaded.emit()

