extends Polygon2D


var distance

# Called when the node enters the scene tree for the first time.
func _ready():
	distance = self.get_polygon()[0].distance_to(self.get_polygon()[1])


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _input(event):
	if event.is_action_pressed("move_down"):
		var temp_tween = get_tree().create_tween().set_trans(Tween.TRANS_BOUNCE)
		temp_tween.tween_property(self, "position", self.position + Vector2(0, 64), 0.01)
	if event.is_action_pressed("move_up"):
		var temp_tween = get_tree().create_tween().set_trans(Tween.TRANS_BOUNCE)
		temp_tween.tween_property(self, "position", self.position + Vector2(0, -64), 0.01)
	if event.is_action_pressed("move_up_left"):
		var temp_tween = get_tree().create_tween().set_trans(Tween.TRANS_BOUNCE)
		temp_tween.tween_property(self, "position", self.position + Vector2(-48, -32), 0.01)
	if event.is_action_pressed("move_down_left"):
		var temp_tween = get_tree().create_tween().set_trans(Tween.TRANS_BOUNCE)
		temp_tween.tween_property(self, "position", self.position + Vector2(-48, 32), 0.01)
	if event.is_action_pressed("move_up_right"):
		var temp_tween = get_tree().create_tween().set_trans(Tween.TRANS_BOUNCE)
		temp_tween.tween_property(self, "position", self.position + Vector2(48, -32), 0.01)
	if event.is_action_pressed("move_down_right"):
		var temp_tween = get_tree().create_tween().set_trans(Tween.TRANS_BOUNCE)
		temp_tween.tween_property(self, "position", self.position + Vector2(48, 32), 0.01)

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
