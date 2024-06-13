extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	SignalBus.player_data_loaded.connect(_on_player_data_loaded)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_player_data_loaded():
	self.visible = true
