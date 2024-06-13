extends Node

var global_player_id_int: int = -1
var no_of_players: int
var players_list: Array[Player]
var current_player
var tilemap_reference: TileMap

const spawn_points: Array[Vector2i]= [Vector2i(-6,2), Vector2i(-6,-4), Vector2i(0,-7), Vector2i(6,-4), Vector2i(6,2), Vector2i(0,7)]

func _ready():
	#SignalBus.player_moved.connect(_on_player_moved)
	SignalBus.start_button_pressed.connect(_on_start_button_pressed)
	SignalBus.player_data_recived.connect(_on_player_data_recived)
	set_process(false)

func _process(delta):
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
	match no_of_players:
		2:
			var temp: int = randi_range(0,2)
			for player in players_list:
				player.position = tilemap_reference.to_global(tilemap_reference.map_to_local(spawn_points[temp]))
				temp += 3
		3:
			var temp: int = randi_range(0,1)
			for player in players_list:
				player.position = tilemap_reference.map_to_local(spawn_points[temp])
				temp += 2
		4:
			var temp: int = randi_range(0,1)
			for i in range(0,1):
				players_list[i].position = tilemap_reference.map_to_local(spawn_points[temp])
				players_list[i + 3].position = tilemap_reference.map_to_local(spawn_points[temp+3])
				temp += 3
		5:
			var temp: int = randi_range(0,5)
			for i in range(0,5):
				if i == temp:
					continue
				players_list[i].position = tilemap_reference.map_to_local(spawn_points[i])
		6:
			for i in range(0,5):
				players_list[i].position = tilemap_reference.map_to_local(spawn_points[i])
	SignalBus.player_data_loaded.emit()

#TODO move implementation to game

func _on_player_moved():
	current_player = (current_player + 1) % players_list.size()

func roll_dice() -> Array[int]:
	var roll: Array[int] = [randi_range(1, 6), randi_range(1, 6)]
	return roll

func start_game():
	current_player = 0
