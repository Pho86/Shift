extends Area2D

var entered = false

func _on_Area2D_body_entered(body: PhysicsBody2D):
	entered = true
	pass



func _on_Area2D_body_exited(body):
	entered = false
	pass # Replace with function body.

func _process(delta):
	if entered == true:
		if Input.is_action_just_pressed("ui_accept"):
			get_tree().change_scene("res://project/scenes/AfterLevel.tscn")
