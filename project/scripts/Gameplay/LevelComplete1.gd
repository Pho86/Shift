extends Area2D

var entered = false

func _on_Area2D_body_entered(_body: PhysicsBody2D):
	entered = true


func _on_Area2D_body_exited(_body: PhysicsBody2D):
	entered = false


func _process(_delta):
	if entered == true:
		get_tree().change_scene("res://project/scenes/AfterLevel.tscn")
	else:
		pass
