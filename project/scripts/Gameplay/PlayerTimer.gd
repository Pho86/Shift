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
		


func _on_Timer_timeout():
	dsec -= 10
	if dsec < 10 and minutes <= 0 and seconds <= 0:
		get_tree().change_scene("res://project/scenes/GameOver.tscn")

