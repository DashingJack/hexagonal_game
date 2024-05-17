extends Node2D


var die1: int
var die2: int

@onready var roll_button = $CanvasLayer/Roll
@onready var result_label = $CanvasLayer/RollResult
@onready var choice1_button = $CanvasLayer/Choice1
@onready var choice2_button = $CanvasLayer/Choice2


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _temp_send1():
	choice1_button.disabled = true
	choice2_button.disabled = true
	$Player.move_player(die1, die2)
	result_label.text = " "
	var temp_timer = get_tree().create_timer(die1 * 0.5)
	await(temp_timer.timeout)
	roll_button.disabled = false
	
func _temp_send2():
	choice1_button.disabled = true
	choice2_button.disabled = true
	$Player.move_player(die2, die1)
	result_label.text = " "
	var temp_timer = get_tree().create_timer(die2 * 0.5)
	await(temp_timer.timeout)
	roll_button.disabled = false

func _roll_dice():
	die1 = randi_range(1, 6)
	die2 = randi_range(1, 6)
	choice1_button.disabled = false
	choice2_button.disabled = false
	roll_button.disabled = true
	result_label.text = "You rolled %d and %d" % [die1, die2]
	choice1_button.text = "Move %d steps in direction %d" % [die1, die2]
	choice2_button.text = "Move %d steps in direction %d" % [die2, die1]
	
