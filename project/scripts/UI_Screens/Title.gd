extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_GameStart_button_up():
	$Transition.transition()
	yield(get_tree().create_timer(1.5), "timeout")
	get_tree().change_scene("res://project/scenes/Intro.tscn")

