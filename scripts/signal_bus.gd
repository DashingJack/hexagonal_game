extends Node

#player movement and main game related
signal dice_rolled(roll: Array[int])
signal choice_made(steps:int , direction:int)
signal player_moved

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

