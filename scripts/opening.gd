extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Timer.start()



func _on_timer_timeout() -> void:
	get_tree().change_scene_to_file("res://scenes/main.tscn")
