extends Area2D


var entered = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



func _on_Area2D2_body_entered(_body: PhysicsBody2D):
	entered = true

func _process(_delta):
	if entered == true:
		get_tree().change_scene("res://project/scenes/GameOver.tscn")
