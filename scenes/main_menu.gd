extends Control

func _on_play_pressed():
	SignalBus.play_button_pressed.emit()
	self.visible = false
