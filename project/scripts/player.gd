extends CharacterBody2D


@export var SPEED:float = 150.0
@export var JUMP_VELOCITY:float = -300.0

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
		apply_jump_velocity()

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


func apply_jump_velocity():
	velocity.y = JUMP_VELOCITY
