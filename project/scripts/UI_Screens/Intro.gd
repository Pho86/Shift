extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$Transition.transitionin()
	var new_dialog = Dialogic.start('Intro', 'false')
	add_child(new_dialog)
	new_dialog.connect("timeline_end", self, 'after_dialog')
	new_dialog.connect("dialogic_signal", self, 'dialogic_signal')

func dialogic_signal(argument):
	if argument == 'transition_out':
		$Transition.transition()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
