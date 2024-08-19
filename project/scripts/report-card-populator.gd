extends Node

@export var grade_s: int = 0
@export var grade_a: int = -100
@export var grade_b: int = -300
@export var grade_c: int = -900
@export var grade_d: int = -2700

@onready var _grade: Label = $Background/Grade
@onready var _deductionVal: Label = $Background/DeductionValue
@onready var _detail: Label = $Background/Detail


func _ready() -> void:
	var score = ScoreTracker.get_score()
	_deductionVal.text = str(score)
	if score == grade_s:
		_grade.text = "s"
	elif score > grade_a:
		_grade.text = "a"
	elif score > grade_b:
		_grade.text = "b"
	elif score > grade_c:
		_grade.text = "c"
	elif score > grade_d:
		_grade.text = "d"
	else:
		_grade.text = "f"


func _go_home() -> void:
	get_tree().change_scene_to_file("res://rooms/welcome-screen.tscn")
