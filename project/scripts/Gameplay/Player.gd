extends KinematicBody2D

#const ShiftGhost = preload("res://project/scripts/Gameplay/ShiftGhost.tscn")
#const DashGhost = preload("res://project/scripts/Gameplay/DashGhost.tscn")
const UP = Vector2(0,-1)
const GRAVITY = 20
const MAXFALLSPEED = 200
const MAXSPEED = 200
const JUMPFORCE = 400 
const ACCELERATION = 3

var canDash = true
var motion = Vector2()
var facingRight = true
var direction = Vector2.ZERO
#onready var sprite = $AnimatedSprite

#func _create_ghost():
#	var ghost: AnimatedSprite = ShiftGhost.instance()
##	print(ghost)
#	get_parent().get_parent().add_child(ghost)
#	print(ghost)

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
			
	elif Input.is_action_pressed("down") and !is_on_floor():
		motion.y += GRAVITY*5
	
	else: 
		$AnimatedSprite.play("Idle")
		motion.x = lerp(motion.x,0,0.2)
		
		
	if Input.is_action_just_pressed("dash") and canDash and !is_on_floor():
		motion.x = clamp(motion.x, 1000, 0)
		motion.x = direction.x * 5000
		canDash = false
		
	if is_on_floor():
		canDash = true
		if Input.is_action_just_pressed("up"):
			motion.y = -JUMPFORCE
	if !is_on_floor():
		$AnimatedSprite.play("Jump")
	
	motion = move_and_slide(motion, UP)
	
