extends Node

@export var eta_hard_s: float = 60
@export var eta_medium_s: float = 150
@export var eta_easy_s: float = 450

@onready var score_label: Label = $TextBackground/ScoreText
@onready var eta_label: Label = $TextBackground/EtaText

var _eta_s: float = eta_easy_s


func _ready() -> void:
	var difficulty: String = "easy" # TODO wire this up to some global config
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
	if _eta_s < 0:
		eta_label.text = "Game Over" # TODO load the game end scene


func _on_score_changed() -> void:
	score_label.text = "Safety Rating: %s" % str(ScoreTracker.get_score())
