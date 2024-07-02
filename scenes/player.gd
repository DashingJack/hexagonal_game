extends Sprite2D

var player_id: int

var grid_size: int = 48
var grid_diagonal_movement: Vector2 = Vector2(int(grid_size * 0.75), int(grid_size * 0.5))
var grid_vertical_movement: Vector2 = Vector2(0, grid_size)


# Called when the node enters the scene tree for the first time.
func _ready():
	if texture:
		self.scale = Vector2(32, 32) / self.texture.get_size()


func move_player(roll: Roll):
	var movement: Vector2 = movement_from_direction(roll.get_die2())
	var temp_tween = get_tree().create_tween().set_trans(Tween.TRANS_BOUNCE).set_loops(roll.get_die1())
	temp_tween.tween_callback(change_player_position.bind(movement)).set_delay(0.5)
	await(temp_tween.finished)
	if check_if_won():
		SignalBus.game_won.emit(name, texture)
	else:
		SignalBus.player_moved.emit()

func change_player_position(movement):
	self.position += movement

func check_if_possible(roll: Roll):
	var tilemap = CommonFunctions.tilemap_reference
	
	var movement1: Vector2 = movement_from_direction(roll.get_die2())
	movement1 *= roll.get_die1()
	movement1 += self.position
	movement1 = tilemap.to_local(movement1)
	var tiledata1: Vector2i = tilemap.get_cell_atlas_coords(0, tilemap.local_to_map(movement1))
	
	var movement2: Vector2 = movement_from_direction(roll.get_die1())
	movement2 *= roll.get_die2()
	movement2 += self.position
	movement2 = tilemap.to_local(movement2)
	var tiledata2: Vector2i = tilemap.get_cell_atlas_coords(0, tilemap.local_to_map(movement2))
	
	roll.set_is_possible(tiledata1.x == 0, tiledata2.x == 0)

func movement_from_direction(direction: int) -> Vector2:
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
	return movement

func check_if_won():
	var tilemap = CommonFunctions.tilemap_reference
	var tiledata: Vector2i = tilemap.get_cell_atlas_coords(0, tilemap.local_to_map(tilemap.to_local(position)))
	return tiledata == Vector2i(0, 1)
