extends KinematicBody2D

const UP = Vector2(0,-1)
const GRAVITY = 20
const MAXFALLSPEED = 200
const MAXSPEED = 250
const JUMPFORCE = 400 
const ACCELERATION = 3

var canDash = true
var motion = Vector2()
var facingRight = true
var direction = Vector2.ZERO


func _ready():
	direction = Vector2(1,0)
	pass


func _physics_process(_delta):
	motion.y += GRAVITY
	
	if motion.y > MAXFALLSPEED:
		motion.y = MAXFALLSPEED
	
	motion.x = clamp(motion.x, -MAXSPEED, MAXSPEED)
	
	if Input.is_action_pressed("right"):
		motion.x += ACCELERATION
		facingRight = true
		direction = Vector2(1,0)
		$AnimatedSprite.flip_h = false
		if motion.x >= 100:
			$AnimatedSprite.play("Run")
		else: 
			$AnimatedSprite.play("Walk")
		
	elif Input.is_action_pressed("left"):
		motion.x += -ACCELERATION
		facingRight = false
		direction = Vector2(-1,0)
		$AnimatedSprite.flip_h = true
		if motion.x >= -100:
			$AnimatedSprite.play("Run")
		else: 
			$AnimatedSprite.play("Walk")
			
	
	
	else: 
		$AnimatedSprite.play("Idle")
		motion.x = lerp(motion.x,0,0.2)
		
#	if canDash == false and motion.x <= 50:
#		yield(get_tree().create_timer(1.0), "timeout")
#		canDash = true
		
	if Input.is_action_just_pressed("dash") and canDash:
#		motion.x = clamp(motion.x, 1000, MAXSPEED)
		motion.x = clamp(motion.x, 1000, 1000)
		motion.x = direction.x * 5000
		canDash = false
		print(motion)
		
#	elif Input.is_action_just_pressed("dash") and !canDash:
#		print(motion)
#		motion = direction.normalized() * 5000
#		motion.x = clamp(motion.x, -MAXSPEED, MAXSPEED)
#		motion = direction.normalized() / 250
		
		
#			yield(get_tree().create_timer(0), "timeout")
#			canDash = false
#			get_tree().create_timer(5.0).connect("timeout", self, "set_timing", [false])
#			canDash = true
			
#			yield(get_tree().create_timer(1.0),"timeout")
#		elif facingRight == false:
#			motion.x += -5000
#		motion.x += 1000
#		yield(get_tree().create_timer(1.0), "timeout")
#		canDash = true
#		motion.x += -1000
#		canDash = false
#		yield(get_tree().create_timer(1), "timeout")
#		canDash = true
		
		
		
	if is_on_floor():
		canDash = true
		if Input.is_action_just_pressed("up"):
			motion.y = -JUMPFORCE
	if !is_on_floor():
		$AnimatedSprite.play("Jump")
#		if motion.y < 0:
#			$AnimatedSprite.play("Jump")
#		elif motion.y > 0:
#			$AnimatedSprite.play("Jump")
	
	motion = move_and_slide(motion, UP)
	
