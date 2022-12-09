extends Node2D


func _ready():
	$Transition.transitionin()
	var new_dialog = Dialogic.start('Intro', 'false')
	add_child(new_dialog)
	new_dialog.connect("timeline_end", self, 'after_dialog')
	new_dialog.connect("dialogic_signal", self, 'dialogic_signal')

func dialogic_signal(argument):
	if argument == 'transition_out':
		$Transition.transition()

