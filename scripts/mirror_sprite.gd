extends Sprite2D
class_name MirrorSprite

var mirror_position : Vector2
var first_player_pos: Vector2


func _init(mirror_position : Vector2, sprite2D : Sprite2D) -> void:
	texture = sprite2D.texture
	region_enabled = true
	region_rect = sprite2D.region_rect
	texture_repeat = CanvasItem.TEXTURE_REPEAT_ENABLED
	z_index = -2

	self.mirror_position = mirror_position
	first_player_pos = Global.get_player_position()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.x = Global.get_player_position().x - 2 * (first_player_pos.x - Global.get_player_position().x)
