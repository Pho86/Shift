extends Area2D

var entered = false

func _on_Area2D_body_entered(body: PhysicsBody2D):
	entered = true


func _on_Area2D_body_exited(body: PhysicsBody2D):
	entered = false


func _process(delta):
	if entered == true:
		if Input.is_action_pressed("ui_accept"):
			get_tree().change_scene("res://project/scenes/AfterLevel.tscn")
	else:
		pass
