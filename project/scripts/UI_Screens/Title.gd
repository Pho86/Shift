extends Node


func _on_GameStart_button_up():
	$Transition.transition()
	yield(get_tree().create_timer(1.5), "timeout")
	# warning-ignore:return_value_discarded
	get_tree().change_scene("res://project/scenes/Act1Transition.tscn")

