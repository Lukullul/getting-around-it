## A class that generates a sprite a few blocks ahead from the tile, to fake the
## twoer roundnes
extends Sprite2D
class_name MirrorSprite

var start_position : Vector2
var first_player_pos : Vector2
var box_size : Vector2


func _init(start_position : Vector2, sprite2D : Sprite2D) -> void:
	position = start_position
	self.start_position = start_position
	first_player_pos = Global.get_player_position()
	box_size = sprite2D.get_rect().size

	# Setting attributs to sprite
	texture = sprite2D.texture
	region_enabled = true
	region_rect = sprite2D.region_rect
	texture_repeat = CanvasItem.TEXTURE_REPEAT_ENABLED
	scale = Vector2.ONE * Global.BLOCK_ACTUALL_SIZE
	centered = false
	start_position -= Vector2.ONE * Global.BLOCK_ACTUALL_SIZE / 2
	z_index = 0


func _process(delta: float) -> void:
	var distance_quota = (Global.get_player_position().x - first_player_pos.x) / (2 * Global.BLOCK_ACTUALL_SIZE)
	z_index = -2 if (distance_quota < 0.5) else 0
	if (0 < distance_quota and distance_quota < 1):
		show()
		position.x = start_position.x + sin(distance_quota * PI) * Global.BLOCK_ACTUALL_SIZE * delta * 1000
	elif (4.26 < distance_quota and distance_quota < 4.75):
		show()
		print(distance_quota)
		
		
	z_index = 5
	#else:
		#hide()
