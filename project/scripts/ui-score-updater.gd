extends Node

@onready var score_label: Label = $TextBackground/ScoreText # Shorthand: get 'ScoreText' child from node this script is attached to


func _ready() -> void:
	ScoreTracker.score_changed.connect(_on_score_changed) # Link up to the score_changed event on ScoreTracker
	_on_score_changed()


func _on_score_changed() -> void:
	score_label.text = "Safety Rating: %s" % str(ScoreTracker.get_score())
