class_name Roll

var _die1: int
var _die2: int
var _is_same: bool = false
var _is_normal_possible: bool = false
var _is_inverse_possible: bool = false

func _init(die1: int, die2: int):
	_die1 = die1
	_die2 = die2
	if die1 == die2:
		_is_same = true

func invert():
	var temp = _die1
	_die1 = _die2
	_die2 = temp

func get_die1() -> int:
	return _die1

func get_die2() -> int:
	return _die2

func get_is_same() -> bool:
	return _is_same

func get_is_roll_possible() -> bool:
	return _is_normal_possible || _is_inverse_possible

func get_is_inverse_possible() -> bool:
	return _is_inverse_possible

func set_is_possible(normal: bool, inverse: bool):
	if normal == false and inverse == true:
		invert()
		_is_normal_possible = inverse
	else:
		_is_normal_possible = normal
		_is_inverse_possible = inverse
