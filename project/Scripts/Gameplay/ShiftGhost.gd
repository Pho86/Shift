extends AnimatedSprite

func _ready():
	$Tween.interpolate_property(self, "modulate:a", 1.0, 0.5, 0.5, 3, 1)
	$Tween.start()

func _on_Tween_tween_completed(object: Object, key: NodePath) -> void:
	queue_free()
