extends Node2D

@export var total_point_value: int = 70
@export var single_hit_point_val: int = 10
@export var last_hit_point_val: int = 50

@onready var sprite:AnimatedSprite2D = $AnimatedSprite2D
@onready var last_frame: int = sprite.sprite_frames.get_frame_count("default") - 1

var _intersecting_player: Node2D


func _ready() -> void:
	ScoreTracker.increase_score(-1 * total_point_value)


func _process(_delta: float) -> void:
	if _intersecting_player != null:
		if Input.is_action_just_released("interact") and _intersecting_player.get_current_tool_type() == "drill":
			advance_sequence()

func advance_sequence() -> void:
	if sprite.frame != last_frame:
		if sprite.frame == last_frame - 1:
			ScoreTracker.increase_score(last_hit_point_val)
		else:
			ScoreTracker.increase_score(single_hit_point_val)

		sprite.frame += 1
		AudioPlayer.play("fx", "hammer")


func _on_area_2d_body_entered(body:Node2D) -> void:
	if body.has_method("get_current_tool_type"):
		_intersecting_player = body


func _on_area_2d_body_exited(_body:Node2D) -> void:
	_intersecting_player = null
