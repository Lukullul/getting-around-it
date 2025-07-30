extends CharacterBody2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var timer: Timer = $Timer


var FlameScene = preload("res://scenes/flame.tscn")
func _ready() -> void:
	animation_player.play("appear")
	timer.start()

func _process(delta: float) -> void:
	global_position = get_parent().get_node("Player/Camera2D").global_position - Vector2(400, 0)

func shoot_balls():
	var flame_instance = FlameScene.instantiate()
	flame_instance.global_position = $Marker2D.global_position
	flame_instance.direction = 1
	get_tree().current_scene.add_child(flame_instance)


func _on_timer_timeout() -> void:
	shoot_balls()
