extends Node

@export var type: String = "changeme"
@export var hit_sfx_delay_cutoff: float = 0.1


var _player: Node2D = null
var _hit_sfx_delay: float = 0.0
var _hit_sfx_allowed: bool = true


func _process(_delta: float) -> void:
	if _player != null and Input.is_action_just_pressed("interact"):
		_player.pickup_tool.emit(type, self)

	if _hit_sfx_delay > hit_sfx_delay_cutoff:
		_hit_sfx_allowed = true
		_hit_sfx_delay = 0.0
	else:
		_hit_sfx_delay += _delta


func _pickup_area_entered(body: Node2D) -> void:
	if body.has_signal("pickup_tool"):
		_player = body
		return
	print("Something collided with this tool but it could not receive a pickup signal")


func _on_pickup_area_exited(_body: Node2D) -> void:
	_player = null


func _on_body_entered(_body:Node) -> void:
	if _hit_sfx_allowed:
		AudioPlayer.play("fx", "hit")
		_hit_sfx_allowed = false

