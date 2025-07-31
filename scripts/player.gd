extends CharacterBody2D

const SPEED = 450.0
const JUMP_VELOCITY = -800.0

@export var fly = false
@onready var timer: Timer = $Timer
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D

var attacking := false
var facing := 1

func _physics_process(delta: float) -> void:
	if fly:
		_handle_flight(delta)
	if not fly:
		_handle_movement(delta)

	# Animations
	if Input.is_action_just_pressed("attack"):
		attacking = true
		$AudioStreamPlayer.playing = true
		if is_on_floor():
			animated_sprite.play("slash")
		else:
			animated_sprite.play("jump_slash")
		timer.start()

	if not attacking:
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
	if direction:
		facing = direction
		print(facing)

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


func _on_timer_timeout() -> void:
	attacking = false


func _on_sword_attack_area_area_entered(area: Area2D) -> void:
	if attacking:
		if facing == 1 and area.direction == -1:
			area.direction *= -3
		elif facing == -1 and area.direction == 1:
			area.direction *= -3
		$ParrySound.playing = true
