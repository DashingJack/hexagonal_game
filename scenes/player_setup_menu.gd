extends VBoxContainer


# Called when the node enters the scene tree for the first time.
func _ready():
	SignalBus.game_can_be_started.connect(_add_start_button)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_play_pressed():
	self.visible = true


func _add_start_button():
	add_child(StartButton.new())
