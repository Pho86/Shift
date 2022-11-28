extends CanvasLayer

signal transitioned

func _ready():
	pass

# Called when the node enters the scene tree for the first time.
func transition():
	$AnimationPlayer.play("fade_to_black")
	
func transitionin():
	$AnimationPlayer.play("fade_to_normal")

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "fade_to_black":
		emit_signal("transitioned")
		$AnimationPlayer.play("fade_to_normal")
