extends Node2D

@export var player_jumps : int = 6
@export var player : CharacterBody2D
@export var start_point : Node2D

var original_number_of_jumps

func _ready():
	original_number_of_jumps = player_jumps
	GameEventBus.emit_signal("level_started")
	GameEventBus.connect("player_died", check_game_state)
	GameEventBus.connect("jump_up_collected", increaseJumpCount)
	if player:
		player.connect("player_jumped", decreaseJumpCount)

func increaseJumpCount():
	player_jumps += 1
	player.canJump = true
	print('add jump')
	print(player_jumps)


func decreaseJumpCount():
	player_jumps -= 1
	print(player_jumps)
	if (player_jumps <= 0):
		player.canJump = false


func check_game_state():
	GameState.player_lives -= 1
	player_jumps = original_number_of_jumps
	player.canJump = true
	if (GameState.player_lives <= 0):
		print('game over')
		return
	
	var start_loc = start_point.global_position
	
	player.global_position = start_loc
	
	
