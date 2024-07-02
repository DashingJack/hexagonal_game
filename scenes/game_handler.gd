extends Node2D

var current_player: int
var current_player_reference
var no_of_players
var players_list: Array
var player_load
var temp_player_instance
var player_uid: int = ResourceUID.text_to_id("uid://gscrxpjkfdj7")

@onready var tilemap_reference = CommonFunctions.tilemap_reference

const spawn_points: Array[Vector2i]= [Vector2i(-6,2), Vector2i(-6,-4), Vector2i(0,-7), Vector2i(6,-4), Vector2i(6,2), Vector2i(0,5)]

func _ready():
	SignalBus.player_data_loaded.connect(_on_player_data_loaded)
	SignalBus.player_moved.connect(_on_player_moved)
	SignalBus.roll_button_pressed.connect(_on_roll_button_pressed)
	SignalBus.choice_made.connect(_on_choice_made)
	SignalBus.game_won.connect(_on_game_won)
	player_load = load(ResourceUID.get_id_path(player_uid))

func _on_player_data_loaded():
	no_of_players = CommonFunctions.no_of_players
	for player in CommonFunctions.players_list:
		add_player(player)
	
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
	
	self.visible = true
	current_player = 0
	current_player_reference = players_list[current_player]
	CommonFunctions.current_player = current_player_reference


func _on_player_moved():
	current_player = (current_player + 1) % no_of_players
	current_player_reference = players_list[current_player]
	CommonFunctions.current_player  = current_player_reference


func add_player(object: Player):
	print("player_added")
	temp_player_instance = player_load.instantiate()
	
	temp_player_instance.player_id = object.player_id
	temp_player_instance.name = object.player_name
	temp_player_instance.texture = object.player_texture
	players_list.push_back(temp_player_instance)
	print(temp_player_instance)
	self.add_child(temp_player_instance)


func _on_roll_button_pressed():
	var roll: Roll = roll_dice()
	current_player_reference.check_if_possible(roll)
	while not roll.get_is_roll_possible():
		roll = roll_dice()
		current_player_reference.check_if_possible(roll)
	SignalBus.choice_to_made.emit(roll)

func roll_dice() -> Roll:
	return Roll.new(randi_range(1, 6), randi_range(1, 6))

func _on_choice_made(roll):
	current_player_reference.move_player(roll)

func _on_game_won(_player_name, _texture):
	visible = false
