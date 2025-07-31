extends StaticBody2D
class_name Stone

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hide()

func _process(delta: float) -> void:
	$ColorRect.color =Color(0,0,0,
		abs((position.x - Global.get_player_position().x) / (Global.block_size * 5)))
	#$Sprite2D.scale = Vector2.ONE * 0.75 * floor(4 * abs(1 - abs(
		#(position.x - Global.get_player_position().x) / (Global.block_size * 6))))
