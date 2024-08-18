extends CharacterBody2D


@export var SPEED:float = 150.0
@export var JUMP_VELOCITY:float = -300.0
@onready var _hammer: Sprite2D = $Tools/HammerSprite

var _hammer_scene: PackedScene = preload("res://game-objects/tool-hammer.tscn")
var _current_tool: String = "none"

signal pickup_tool(type: String, tool: Node2D)


func _ready() -> void:
	pickup_tool.connect(_on_pickup_tool)
	_hammer.visible = false


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	var on_floor:bool = is_on_floor()
	var just_jumped:bool = Input.is_action_just_pressed("jump")
	var just_dropped:bool = Input.is_action_just_pressed("drop")

	if Input.is_action_pressed("look_down") and just_dropped and on_floor:
		drop_down()
	elif just_jumped and on_floor:
		_do_jump()

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()


func drop_down():
	position.y += 2


func _do_jump():
	velocity.y = JUMP_VELOCITY
	AudioPlayer.play("fx", "jump")

	
func _on_pickup_tool(type: String, tool: Node2D) -> void:
	match type.to_lower():
		"hammer":
			_hammer.visible = true
		_:
			print("Error: Unknown tool type " + type)
			return # TODO Maybe throw an exception instead of this BS

	var new_tool: Node2D = null
	match _current_tool:
		"hammer":
			new_tool = _hammer_scene.instantiate()

	if new_tool != null:
		get_tree().current_scene.add_child(new_tool)
		new_tool.position = position
		var random_offset = randf_range(-40.0, 40.0)
		new_tool.linear_velocity = Vector2(random_offset, -250)

	_current_tool = type
	tool.queue_free()
	
