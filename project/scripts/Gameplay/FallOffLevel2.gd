extends Area2D

var entered = false

func _on_Area2D2_body_entered(_body: PhysicsBody2D):
	entered = true

func _process(_delta):
	if entered == true:
		get_tree().change_scene("res://project/scenes/GameOver2.tscn")
