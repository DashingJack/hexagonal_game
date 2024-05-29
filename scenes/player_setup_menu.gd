extends VBoxContainer

var start_button

# Called when the node enters the scene tree for the first time.
func _ready():
	SignalBus.game_can_be_started.connect(_add_start_button)
	SignalBus.game_can_not_be_started.connect(_remove_start_button)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_play_pressed():
	self.visible = true


func _add_start_button():
	start_button = StartButton.new()
	add_child(start_button)

func _remove_start_button():
	start_button.queue_free()
