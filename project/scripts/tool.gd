extends Node

@export var type: String = "changeme"


var _player: Node2D = null


func _process(_delta: float) -> void:
	if _player != null and Input.is_action_just_pressed("interact"):
		_player.pickup_tool.emit(type, self)


func _pickup_area_entered(body: Node2D) -> void:
	if body.has_signal("pickup_tool"):
		_player = body
		return
	print("Something collided with this tool but it could not receive a pickup signal")


func _on_pickup_area_exited(_body: Node2D) -> void:
	_player = null
