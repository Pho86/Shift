extends Area2D

var entered = false

func _on_Area2D_body_entered(_body: PhysicsBody2D):
	entered = true

func _process(_delta):
	if entered == true:
		# warning-ignore:return_value_discarded
		get_tree().change_scene("res://project/scenes/AfterLevel2.tscn")
