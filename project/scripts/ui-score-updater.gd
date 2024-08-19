extends Node

@export var eta_hard_s: float = 60
@export var eta_medium_s: float = 150
@export var eta_easy_s: float = 450

@onready var score_label: Label = $TextBackground/ScoreText
@onready var eta_label: Label = $TextBackground/EtaText

var _eta_s: float = eta_easy_s
var _curr_score: int


func _ready() -> void:
	var difficulty: String = DifficultyTracker.get_difficulty()
	match difficulty:
		"easy":
			_eta_s = eta_easy_s
		"medium":
			_eta_s = eta_medium_s
		"hard":
			_eta_s = eta_hard_s
		_:
			print("Error: Unknown difficulty " + difficulty + ", using easy")
			_eta_s = eta_easy_s
	ScoreTracker.score_changed.connect(_on_score_changed)
	_on_score_changed()


func _process(delta: float) -> void:
	_eta_s -= delta
	eta_label.text = "ETA: " + str(int(_eta_s)) + " seconds"
	if _eta_s < 0 or _curr_score == 0:
		get_tree().change_scene_to_file("res://rooms/report-card.tscn")


func _on_score_changed() -> void:
	_curr_score = ScoreTracker.get_score()
	score_label.text = "Safety Rating: %s" % str(_curr_score)
