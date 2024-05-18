class_name movement extends Node

var player_id: int

func _ready():
	player_id = CommonFunctions.genrate_player_id()

func move_player(step: int, direction: int, signal_player_id):
	if signal_player_id != player_id: return
	var movement: Vector2
	match direction:
		1: 
			movement = Vector2(-48, -32)
		2: 
			movement = Vector2(0, -64)
		3: 
			movement = Vector2(48, -32)
		4: 
			movement = Vector2(48, 32)
		5: 
			movement = Vector2(0, 64)
		6: 
			movement = Vector2(-48, 32)
	
	var temp_tween = get_tree().create_tween().set_trans(Tween.TRANS_BOUNCE).set_loops(step)
	temp_tween.tween_callback(change_player_position.bind(movement)).set_delay(0.5)

func change_player_position(movement):
	self.position += movement
