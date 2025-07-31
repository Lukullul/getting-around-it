extends Node2D

@export var rotation_velocity : float = 0.1

func _ready() -> void:
	pass


func _process(delta: float) -> void:
	if (Input.is_anything_pressed()):
		$Player/Camera2D/Opening.hide()
	#_scroll_background()
	pass
	
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

#"""
#AREA center
#"""
#
#func _on_toggle_area_shape_entered(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	#area.show()
#
#
#func _on_toggle_area_shape_exited(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	#area.hide()
#
#
#"""
#AREA mirror
#"""
#
#func _on_mirrow_area_shape_entered(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	#var start_vector = area.position - Vector2(2 * Global.block_size, 0)
	#print(area)
	#if(area is Platform):
		#var sprite = MirrorSprite.new(start_vector, area.get_node("BackgroundTile"))
		#add_child(sprite)
#
#func _on_mirrow_area_shape_exited(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	#pass # Replace with function body.


"""
BODY mirror
"""

func _on_mirror_body_entered(body: Node2D) -> void:
	pass # Replace with function body.

func _on_area_mirror_body_exited(body: Node2D) -> void:
	pass # Replace with function body.

"""
BODY toggle
"""

func _on_area_toggle_body_entered(body: Node2D) -> void:
	body.show()


func _on_area_toggle_body_exited(body: Node2D) -> void:
	body.hide()
