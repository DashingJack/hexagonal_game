class_name Player

var player_id: int
var player_name: StringName
var player_texture

func _init(id_recived: int, name_recived: String, texture_recived):
	player_id = id_recived
	player_name = name_recived
	player_texture = texture_recived
