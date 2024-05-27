extends Node

signal choice_made(steps:int , direction:int, id:int)
signal dice_rolled(roll: Array[int])
signal player_moved
signal icon_select_button_pressed(index: int)
signal icon_selected(icon, index: int)
signal game_can_be_started
