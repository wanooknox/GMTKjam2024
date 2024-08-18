extends Node2D

@export var single_hit_point_val: int = 10
@export var last_hit_point_val: int = 50

@onready var sprite:AnimatedSprite2D = $AnimatedSprite2D
@onready var last_frame: int = sprite.sprite_frames.get_frame_count("default") - 1

var is_intersecting: bool = false


func _process(_delta: float) -> void:
	if is_intersecting:
		if Input.is_action_just_released("interact"):
			advance_sequence()

func advance_sequence() -> void:
	if sprite.frame != last_frame:
		if sprite.frame == last_frame - 1:
			ScoreTracker.increase_score(last_hit_point_val)
		else:
			ScoreTracker.increase_score(single_hit_point_val)

		sprite.frame += 1
		AudioPlayer.play("fx", "hammer")


func _on_area_2d_body_entered(_body:Node2D) -> void:
	is_intersecting = true


func _on_area_2d_body_exited(_body:Node2D) -> void:
	is_intersecting = false

