extends Button


func _on_pressed():
	SignalBus.play_again_pressed.emit()
