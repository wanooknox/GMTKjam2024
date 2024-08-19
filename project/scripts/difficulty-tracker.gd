extends Node

var _selected_difficulty: String = "easy"


func set_difficulty(difficulty: String) -> void:
	_selected_difficulty = difficulty


func get_difficulty() -> String:
	return _selected_difficulty