class_name Player extends Sprite2D

var player_id: int
var player_name: StringName
var player_texture

var grid_size: int = 48
var grid_diagonal_movement: Vector2 = Vector2(grid_size * 3 / 4, grid_size / 2)
var grid_vertical_movement: Vector2 = Vector2(0, grid_size)

func _init(id_recived: int, name_recived: String, texture_recived):
	player_id = id_recived
	player_name = name_recived
	player_texture = texture_recived
	self.texture = player_texture
	self.scale = Vector2(32, 32) / self.texture.get_size()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func move_player(step: int, direction: int):
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
	await(temp_tween.finished)
	SignalBus.player_moved.emit()

func change_player_position(movement):
	self.position += movement
