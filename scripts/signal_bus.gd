extends Node

signal choice_made(steps:int , direction:int, id:int)
signal dice_rolled(roll: Array[int])
signal player_moved
signal icon_select_button_pressed(index: int)
signal icon_selected(icon, index: int)
signal game_can_be_started
signal game_can_not_be_started
signal player_name_set(text: String)
signal start_button_pressed
signal player_data_recived
signal main_scene_loaded

