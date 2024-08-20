extends Control

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	ScoreTracker.reset_score()
	AudioPlayer.play("music", "music")


func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("ui_select"):
		_on_button_pressed()


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://rooms/game.tscn")


func _on_easy_button_pressed() -> void:
	DifficultyTracker.set_difficulty("easy")
	get_tree().change_scene_to_file("res://rooms/game.tscn")


func _on_medium_button_pressed() -> void:
	DifficultyTracker.set_difficulty("medium")
	get_tree().change_scene_to_file("res://rooms/game.tscn")


func _on_hard_button_pressed() -> void:
	DifficultyTracker.set_difficulty("hard")
	get_tree().change_scene_to_file("res://rooms/game.tscn")


func _on_controls_pressed() -> void:
	get_tree().change_scene_to_file("res://rooms/controls_screen.tscn")


func _on_credits_pressed() -> void:
	get_tree().change_scene_to_file("res://rooms/credits_screen.tscn")
