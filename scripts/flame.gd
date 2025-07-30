extends Area2D

signal hit

@export var direction = -1
@export var speed = 200
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.x += speed * direction * delta
	animated_sprite_2d.flip_h = direction < 0


func _on_body_entered(body: Node2D) -> void:
	print("player hit")
	#get_tree().call_deferred("reload_current_scene")
