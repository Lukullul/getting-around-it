extends Node2D

@export var rotation_velocity : float = 0.1



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	_scroll_background()
	
func _scroll_background():
	# Tower
	var player_position : Vector2 = $Player.position
	$Tower.position = player_position
	player_position *= rotation_velocity
	$Tower.region_rect = Rect2(player_position.x, player_position.y,
											$Tower.region_rect.size.x, $Tower.region_rect.size.y)

	$Sky/Pivot.position.y = $Player.position.y - 800
