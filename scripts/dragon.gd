extends CharacterBody2D

@onready var flip_timer: Timer = $FlipTimer
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var timer: Timer = $Timer
var flipped := false
var attacking := true
var offset = 0
var FlameScene = preload("res://scenes/flame.tscn")
func _ready() -> void:
	timer.start()
	flip_timer.start()

func _process(delta: float) -> void:
	global_position = get_parent().get_node("Player/Camera2D").global_position
	if flipped:
		offset = 400
	else:
		offset = -400
	global_position += Vector2(offset, 0)
	animated_sprite_2d.flip_h = flipped


func shoot_balls():
	var flame_instance = FlameScene.instantiate()
	flame_instance.global_position = $Marker2D.global_position
	if not flipped:
		flame_instance.direction = 1
	else:
		flame_instance.direction = -1
	get_tree().current_scene.add_child(flame_instance)


func _on_timer_timeout() -> void:
	if attacking:
		shoot_balls()


func _on_flip_timer_timeout() -> void:
	flipped = !flipped
