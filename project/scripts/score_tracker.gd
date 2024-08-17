extends Node

signal score_changed
var _current_score: int = 0


func increase_score(amount: int) -> void:
	_current_score += amount
	emit_signal("score_changed")


func reset_score() -> void:
	_current_score = 0
	emit_signal("score_changed")


func get_score() -> int:
	return _current_score
