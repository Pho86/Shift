extends Node2D

func _on_TextureButton_button_up():
	# warning-ignore:return_value_discarded
	get_tree().change_scene("res://project/scenes/Title Screen.tscn")
