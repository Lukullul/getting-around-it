extends Sprite2D
class_name MirrorSprite

var start_position : Vector2
var first_player_pos : Vector2


func _init(start_position : Vector2, sprite2D : Sprite2D) -> void:
	texture = sprite2D.texture
	region_enabled = true
	region_rect = sprite2D.region_rect
	texture_repeat = CanvasItem.TEXTURE_REPEAT_ENABLED
	scale = Vector2.ONE * Global.block_size / texture.get_size() * 2
	centered = false
	start_position -= Vector2.ONE * Global.block_size / 2
	z_index = 0

	position = start_position
	self.start_position = start_position
	first_player_pos = Global.get_player_position()


func _process(delta: float) -> void:
	var distance_quota = (Global.get_player_position().x - first_player_pos.x) / (2 * Global.block_size)
	#z_index = -2 if (distance_quota < 0.5) else 0
	if (0 < distance_quota and distance_quota < 1):
		show()
		position.x = start_position.x + sin(distance_quota * PI) * Global.block_size * delta
	elif (4.26 < distance_quota and distance_quota < 4.75):
		show()
		print(distance_quota)
	#else:
		#hide()
