extends Node

@export var block_size : int = 128
@export var BLOCK_SCALE : float = 0.5
@onready var BLOCK_ACTUALL_SIZE : float = block_size * BLOCK_SCALE

var _mirror_map : = { }

func get_player_position() -> Vector2:
	return get_parent().get_node("Main/Player").position

func get_player_speed() -> float:
	return (get_parent().get_node("Main/Player") as Player).speed




func put_mirror_tile(key, mirrorSprite : MirrorSprite):
	_mirror_map.set(key, mirrorSprite)

func get_mirror_tile(key) -> MirrorSprite:
	return _mirror_map.get(key)
	
func erase_mirror_title(key) -> void:
	(_mirror_map.get(key) as MirrorSprite).queue_free()
	_mirror_map.erase(key)
