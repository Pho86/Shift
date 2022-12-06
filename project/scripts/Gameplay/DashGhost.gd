extends Sprite

func _ready():
	$Tween.set_trans(Tween.TRANS_QUART) 
	$Tween.set_ease(Tween.EASE_OUT)
	$Tween.tween_property(self,"modulate:a",0.0,0.5)

func _on_Tween_tween_completed(_object: Object, _key: NodePath) -> void:
	queue_free()
