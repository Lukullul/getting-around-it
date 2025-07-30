extends Node2D

@export var rotation_velocity : float = 0.1

func _process(delta: float) -> void:
	_scroll_background()
	
func _scroll_background():
	# Tower
	var player_position : Vector2 = $Player.position
	$Tower.position = player_position
	player_position *= rotation_velocity
	$Tower.region_rect = Rect2(player_position.x, player_position.y,
											$Tower.region_rect.size.x, $Tower.region_rect.size.y)

	# var viewport_size : Vector2 = get_viewport().get_visible_rect().size
	# print(viewport_size)
	# $Sky/Pivot.position.y = $Player.position.y - 800
	# $Sun/Sprite2D.position.y = $Player.position.y - viewport_size.y / 2
