extends Node


func get_player_position() -> Vector2:
	return get_parent().get_node("Main/Player").position
