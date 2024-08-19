extends Node


@export var grade_a: int = -100
@export var grade_b: int = -300 
@export var grade_c: int = -900
@export var grade_d: int = -2700
@export var grade_e: int = -8100


@onready var _grade: Label = $Background/Grade
@onready var _detail: Label = $Background/Detail


func _ready() -> void:
	var score = ScoreTracker.get_score()
	if score > grade_a:
		_grade.text = "a"
	elif score > grade_b:
		_grade.text = "b"
	elif score > grade_c:
		_grade.text = "c"
	elif score > grade_d:
		_grade.text = "d"
	elif score > grade_e:
		_grade.text = "e"
	else:
		_grade.text = "f"
