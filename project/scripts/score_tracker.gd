extends Node

var _current_score: int = 0

func increase_score(amount: int) -> void:
	_current_score += amount

func reset_score() -> void:
	_current_score = 0

func get_score() -> int:
	return _current_score