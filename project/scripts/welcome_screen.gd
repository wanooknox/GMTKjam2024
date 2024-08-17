extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventKey:
		if event.pressed and event.keycode == KEY_SPACE:
			_on_button_pressed()

func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://rooms/game.tscn")
