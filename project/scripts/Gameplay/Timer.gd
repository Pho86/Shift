extends Control

export (int) var minutes = 0
export (int) var seconds = 0
var dsec = 0

func _physics_process(_delta):
	if seconds > 0 and dsec <= 0 :
		seconds -= 1
		dsec = 10
	if minutes > 0 and seconds <= 0: 
		minutes -= 1
		seconds = 60
		
	if seconds >= 10:
		$sec.set_text(str(seconds))
	else:
		$sec.set_text("0"+str(seconds))
	if dsec >= 10:
		$dsec.set_text(str(dsec))
	else:
		$dsec.set_text("0"+str(dsec))
	if minutes >= 10:
		$min.set_text(str(minutes))
	else:
		$min.set_text("0"+str(minutes))


func _on_Timer_timeout():
	dsec -= 10
	if dsec < 10 and minutes <= 0 and seconds <= 0:
		# warning-ignore:return_value_discarded
		get_tree().change_scene("res://project/scenes/GameOver.tscn")
func on_timeout():
	pass
