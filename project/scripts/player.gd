extends CharacterBody2D


@export var SPEED:float = 150.0
@export var JUMP_VELOCITY:float = -300.0
@export var hammer_scene: PackedScene
@export var drill_scene: PackedScene

# @onready var _hammer_sprite: Sprite2D = $AnimatedSprite2D/Tools/HammerSprite
# @onready var _drill_sprite: Sprite2D = $AnimatedSprite2D/Tools/DrillSprite
@onready var _tool_sprite: Sprite2D = $AnimatedSprite2D/Tools/ToolSprite
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

var _current_tool_type: String = "none"

signal pickup_tool(type: String, tool: Node2D)


func _ready() -> void:
	pickup_tool.connect(_on_pickup_tool)
	# _hammer_sprite.visible = false
	_tool_sprite.visible = false


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	var on_floor:bool = is_on_floor()
	var just_jumped:bool = Input.is_action_just_pressed("jump")
	var just_dropped:bool = Input.is_action_just_pressed("drop")

	if Input.is_action_pressed("look_down") and just_dropped and on_floor:
		_drop_down()
	elif just_jumped and on_floor:
		_do_jump()

	var direction := Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * SPEED
		if direction < 0:
			animated_sprite.scale.x = -1
		else:
			animated_sprite.scale.x = 1
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	if velocity.x != 0:
		animated_sprite.play("run")
	else:
		animated_sprite.play("idle")

	if velocity.y < 0:
		animated_sprite.play("jump")
	elif velocity.y > 20:
		animated_sprite.play("fall")

	move_and_slide()


func _drop_down():
	position.y += 2


func _do_jump():
	velocity.y = JUMP_VELOCITY
	AudioPlayer.play("fx", "jump")


func get_current_tool_type() -> String:
	return _current_tool_type

	
func _on_pickup_tool(type: String, tool: Node2D) -> void:
	_show_picked_up_tool(type)
	_throw_current_tool()

	_current_tool_type = type
	tool.queue_free()


func _show_picked_up_tool(type: String):
	_tool_sprite.visible = true
	match type.to_lower():
		"hammer":
			# _hammer_sprite.visible = true
			_tool_sprite.frame = 1
		"drill":
			# _drill_sprite.visible = true
			_tool_sprite.frame = 0
		_:
			print("Error: Unknown tool type " + type)
			return # TODO Maybe throw an exception instead of this BS
	

func _throw_current_tool():
	var new_tool_instance: Node2D = null
	match _current_tool_type:
		"hammer":
			new_tool_instance = hammer_scene.instantiate()
			# _hammer_sprite.visible = false
		"drill":
			new_tool_instance = drill_scene.instantiate()
			# _drill_sprite.visible = false

	if new_tool_instance != null:
		get_tree().current_scene.add_child(new_tool_instance)
		new_tool_instance.position = position + Vector2(0, -12)
		var random_offset = randf_range(-400.0, 400.0)
		new_tool_instance.rotation = randf_range(-15, 15)
		new_tool_instance.linear_velocity = Vector2(random_offset, -600)


func _landed(_body:Node) -> void:
	AudioPlayer.play("fx", "hit")
