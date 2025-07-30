extends CharacterBody2D


@export var speed = 3000
@export var jump_velocity = -400.0


func _physics_process(delta: float) -> void:
	# Add the gravity.
	# if not is_on_floor():
	# 	velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = jump_velocity

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * speed * delta
	else:
		velocity.x = move_toward(velocity.x, 0, speed)

	direction = Input.get_axis("ui_up", "ui_down")
	if direction:
		velocity.y = direction * speed * delta
	else:
		velocity.y = move_toward(velocity.x, 0, speed)
	move_and_slide()
