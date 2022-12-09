extends Area2D


var entered = false

# if statement just in case user enters the area twice.
func _on_Area2D_body_entered(_body: KinematicBody2D):
	if entered == false:
		var new_dialog = Dialogic.start('Level3Add', 'false')
		add_child(new_dialog)
		new_dialog.connect("timeline_end", self, 'after_dialog')
		new_dialog.connect("dialogic_signal", self, 'dialogic_signal')
		entered = true
