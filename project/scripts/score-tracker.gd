extends Node

signal score_changed
var _current_score: int = 0


func increase_score(amount: int) -> void:
	_current_score += amount
	score_changed.emit();


func reset_score() -> void:
	_current_score = 0
	score_changed.emit();


func get_score() -> int:
	return _current_score


# TODO Remove this code, only using to increase the score to prove it works
# func _process(_delta: float) -> void:
	# increase_score(1)
