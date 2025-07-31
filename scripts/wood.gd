extends Blank

@onready var timer: Timer = $Timer

func _on_timer_timeout() -> void:
	queue_free()
	pass


func _on_area_2d_body_entered(body: Node2D) -> void:
	print(body)
	timer.start()
