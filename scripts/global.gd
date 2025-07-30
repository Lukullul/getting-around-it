extends Node

@export var block_size : int = 128
var _mirror_map : = { }

func get_player_position() -> Vector2:
	return get_parent().get_node("Main/Player").position

func put_mirror_tile(key, mirrorSprite : MirrorSprite):
	_mirror_map.set(key, mirrorSprite)

func get_mirror_tile(key) -> MirrorSprite:
	return _mirror_map.get(key)
	
func erase_mirror_title(key) -> void:
	(_mirror_map.get(key) as MirrorSprite).queue_free()
	_mirror_map.erase(key)
