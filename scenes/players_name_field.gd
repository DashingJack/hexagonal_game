extends TextEdit

func _on_focus_exited():
	SignalBus.player_name_set.emit(self.text)
