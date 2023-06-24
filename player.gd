extends CharacterBody2D

const GRAVITY = 1000
const MOVE_SPEED = 125
const JUMP_FORCE = 400

signal player_jumped

@onready var animPlayer : AnimationPlayer = get_node("AnimationPlayer")
@onready var sprite : Sprite2D = get_node("Sprite2D") 

var isJumping = false
var canMove = false
var canJump = true

func _ready():
	GameEventBus.connect("level_started", makePlayerMovable)
	GameEventBus.connect("level_completed", makePlayerImmovable)

func _process(delta):
	apply_gravity(delta)
	movement()
	move_and_slide()
	jump()
	updateAnims()
	
func apply_gravity(delta):
	velocity.y += GRAVITY * delta
	
func jump():
	if Input.is_action_just_pressed("ui_up") and is_on_floor() and canMove and canJump:
		velocity.y -= JUMP_FORCE
		isJumping = true
		emit_signal("player_jumped")

func updateAnims():
	if velocity.x == 0 && canMove:
		animPlayer.play("Idle")
	if velocity.x > 0 && canMove:
		animPlayer.play("Walk")
		sprite.scale.x = -1
	if velocity.x < 0 && canMove:
		animPlayer.play("Walk")
		sprite.scale.x = 1

		
func makePlayerImmovable():
	canMove = false
	velocity.x = 0
	animPlayer.play("Victory")

func makePlayerMovable():
	canMove = true
	velocity.x = 0
	
func movement():
	if canMove:
		velocity.x = 0
		if Input.is_action_pressed("ui_left"):
			velocity.x -= MOVE_SPEED
		if Input.is_action_pressed("ui_right"):
			velocity.x += MOVE_SPEED

		# Reset jump state if character is on the floor
		if is_on_floor() and isJumping:
			isJumping = false
		
