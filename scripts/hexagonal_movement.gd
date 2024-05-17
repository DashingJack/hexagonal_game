class_name movement extends Node

func move_player(step: int, direction: int):
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
