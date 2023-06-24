extends Node2D

@export var player_jumps : int = 6
@export var player : CharacterBody2D
@export var start_point : Node2D
@export var reset_node_group : Node2D

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
	if player.camera:
		player.camera.limit_top = 0
	if (GameState.player_lives <= 0):
		print('game over')
		return
	
	var start_loc = start_point.global_position
	player.global_position = start_loc
	reset_nodes()
	
func reset_nodes():
	if reset_node_group:
		for node in reset_node_group.get_children():
			if node is Collectible || node is Trigger:
				node.visible = true
				node.collider.set_deferred("disabled", false)
			
	
