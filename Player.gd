extends KinematicBody2D

const UP = Vector2(0,-1)
const GRAVITY = 20
const MAXFALLSPEED = 200
const MAXSPEED = 200
const JUMPFORCE = 350 
const ACCELRATION = 10

var motion = Vector2()

func _ready():
	pass
	
func _physics_process(delta):
	
	
	motion.y += GRAVITY
	if motion.y > MAXFALLSPEED:
		motion.y = MAXFALLSPEED
	
	
	motion.x = clamp(motion.x, -MAXSPEED, MAXSPEED)
	
	if Input.is_action_pressed("right"):
		motion.x += ACCELRATION
		$AnimatedSprite.flip_h = false
		if motion.x >= 100:
			$AnimatedSprite.play("Run")
		else: 
			$AnimatedSprite.play("Walk")
	elif Input.is_action_pressed("left"):
		motion.x += -ACCELRATION
		$AnimatedSprite.flip_h = true
		if motion.x >= 100:
			$AnimatedSprite.play("Run")
		else: 
			$AnimatedSprite.play("Walk")
	else: 
		$AnimatedSprite.play("Idle")
		motion.x = lerp(motion.x,0,0.2)
	
	if is_on_floor():
		if Input.is_action_just_pressed("up"):
			motion.y = -JUMPFORCE
	if !is_on_floor():
		if motion.y < 0:
			$AnimatedSprite.play("Jump")
		elif motion.y > 0:
			$AnimatedSprite.play("Jump")
	
	motion = move_and_slide(motion, UP)
	
