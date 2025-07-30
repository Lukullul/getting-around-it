extends CharacterBody2D
class_name Player

const SPEED = 300.0
const JUMP_VELOCITY = -700.0
@export var fly = false

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D



func _physics_process(delta: float) -> void:
	if (fly):
		_handle_flight(delta)
	else:
		_handle_movement(delta)
	
	# Animations
	if is_on_floor():
		if velocity.x == 0:
			animated_sprite.play("idle")
		else:
			animated_sprite.play("run")
	else:
		animated_sprite.play("jump")

	move_and_slide()
	
func _handle_movement(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
		animated_sprite.flip_h = velocity.x < 0
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

func _handle_flight(delta):
	velocity = velocity / 1.1
	var direction := Input.get_axis("ui_left", "ui_right")
	if (direction):
		velocity.x = direction * SPEED * delta * 200
		animated_sprite.flip_h = velocity.x < 0
	
	direction = Input.get_axis("ui_up", "ui_down")
	if (direction):
		velocity.y = direction * SPEED * delta * 200
		animated_sprite.flip_h = velocity.x < 0
		

func _on_flame_hit() -> void:
	pass
