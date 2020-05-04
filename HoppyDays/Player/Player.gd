extends KinematicBody2D

var motion = Vector2(0,0)

const SPEED = 1500
const GRAVITY = 300
const UP = Vector2(0,-1)
const JUMP_SPEED = 5000

signal animate

func _physics_process(delta):
	apply_gravity()
	jump()
	move()
	animate()
	move_and_slide(motion, UP)

func apply_gravity():
	if is_on_floor():
		motion.y = 0
	else:
		motion.y += GRAVITY
func jump():
	if (Input.is_action_pressed("jump") and is_on_floor()):
		motion.y -= JUMP_SPEED

func move():
	if (Input.is_action_pressed("left") && !Input.is_action_pressed("right")): 
		motion.x = -SPEED
	elif (Input.is_action_pressed("right") && !Input.is_action_pressed("left")):
		motion.x = SPEED
	else:
		motion.x = 0
		
func animate():
	emit_signal("animate", motion)
#	if motion.y < 0:
#		$PlayerAnimation.play("jump")
#	elif motion.x > 0:
#		$PlayerAnimation.set_flip_h(false)
#		$PlayerAnimation.play("walk")
#	elif motion.x < 0:
#		$PlayerAnimation.set_flip_h(true)
#		$PlayerAnimation.play("walk")
#	else:
#		$PlayerAnimation.play("idle")
