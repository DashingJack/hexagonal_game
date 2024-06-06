class_name Player extends Sprite2D

var player_id: int
var player_name: StringName
var player_texture

func _init(id: int, name: String, texture):
	player_id = id
	player_name = name
	player_texture = texture

# Called when the node enters the scene tree for the first time.
func _ready():
	self.texture = player_texture


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
