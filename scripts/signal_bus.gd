extends Node

#main game related signals
signal roll_button_pressed
signal choice_to_made(roll: Roll)
signal player_moved
signal choice_made(roll: Roll)
signal game_won(player_name: StringName, player_texture)
signal play_again_pressed

#player data in main menu releted
signal icon_select_button_pressed(index: int)
signal icon_selected(icon, index: int)
signal player_name_set(text: String)

#start button  in main menu related
signal game_can_be_started
signal game_can_not_be_started

#starting game related
signal start_button_pressed
signal player_data_recived
signal player_data_loaded

#ui control related
signal play_button_pressed


