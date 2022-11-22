extends KinematicBody2D

const Up = Vector2(0,-1)
const Gravity = 20
const MaxFallSpeed = 200
const MaxSpeed = 80

var motion = Vector2()

func _ready():
	pass

func _physics_process(delta):
	motion.y += Gravity
	if motion.y > MaxFallSpeed:
		motion.y = MaxFallSpeed
	
	if Input.is_action_just_pressed("right"):
		motion.x = MaxSpeed
	elif Input.is_action_just_pressed("left"):
		motion.x = -MaxSpeed
	else:
		motion.x = 1000
	
	
