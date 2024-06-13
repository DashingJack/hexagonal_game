extends Node

var player_id: int
var grid_size: int = 48
var grid_diagonal_movement: Vector2 = Vector2(grid_size * 3 / 4, grid_size / 2)
var grid_vertical_movement: Vector2 = Vector2(0, grid_size)

func _ready():
	player_id = CommonFunctions.genrate_player_id()

func move_player(step: int, direction: int, signal_player_id):
	if signal_player_id != player_id: return
	var movement: Vector2
	match direction:
		1: 
			movement = Vector2(-1, -1) * grid_diagonal_movement
		2: 
			movement = Vector2(1, -1) * grid_vertical_movement
		3: 
			movement = Vector2(1, -1) * grid_diagonal_movement
		4: 
			movement = Vector2(1, 1) * grid_diagonal_movement
		5: 
			movement = Vector2(1, 1) * grid_vertical_movement
		6: 
			movement = Vector2(-1, 1) * grid_diagonal_movement
	
	var temp_tween = get_tree().create_tween().set_trans(Tween.TRANS_BOUNCE).set_loops(step)
	temp_tween.tween_callback(change_player_position.bind(movement)).set_delay(0.5)
	#TODO add emit signal to player moved

func change_player_position(movement):
	self.position += movement
