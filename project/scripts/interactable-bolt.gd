extends Node2D

@export var total_point_value: int = 150
@export var single_hit_point_val: int = 10
@export var last_hit_point_val: int = 50
@export var seconds_per_animation_step: float = 0.5

@onready var sprite:AnimatedSprite2D = $AnimatedSprite2D
@onready var last_frame: int = sprite.sprite_frames.get_frame_count("default") - 1

var _intersecting_player: Node2D
var _bolt_progress_time: float = 0


func _ready() -> void:
	ScoreTracker.increase_score(-1 * total_point_value)


func _process(delta: float) -> void:
	if _intersecting_player != null:
		if Input.is_action_pressed("interact") and _intersecting_player.get_current_tool_type() == "drill":
			advance_sequence(delta)

func advance_sequence(additional_progress: float) -> void:
	_bolt_progress_time += additional_progress

	if _bolt_progress_time < seconds_per_animation_step:
		# Need to keep holding to make progress
		return

	_bolt_progress_time -= seconds_per_animation_step
	if sprite.frame != last_frame:
		if sprite.frame == last_frame - 1:
			ScoreTracker.increase_score(last_hit_point_val)
		else:
			ScoreTracker.increase_score(single_hit_point_val)

		sprite.frame += 1
		AudioPlayer.play("fx", "drill")


func _on_area_2d_body_entered(body:Node2D) -> void:
	if body.has_method("get_current_tool_type"):
		_intersecting_player = body


func _on_area_2d_body_exited(_body:Node2D) -> void:
	_intersecting_player = null
