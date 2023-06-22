extends CharacterBody2D

const GRAVITY = 1000
const MOVE_SPEED = 200
const JUMP_FORCE = 500

var isJumping = false

func _ready():
	pass

func _process(delta):
	apply_gravity(delta)
	movement()
	move_and_slide()
	jump()
	
func apply_gravity(delta):
	velocity.y += GRAVITY * delta
	
func jump():
	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		velocity.y -= JUMP_FORCE
		isJumping = true

func movement():
	velocity.x = 0
	if Input.is_action_pressed("ui_left"):
		velocity.x -= MOVE_SPEED
	if Input.is_action_pressed("ui_right"):
		velocity.x += MOVE_SPEED

	# Reset jump state if character is on the floor
	if is_on_floor() and isJumping:
		isJumping = false
		
