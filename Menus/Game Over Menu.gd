extends CanvasLayer

@onready var start_over_button = get_node("Button") 

func _ready():
	if start_over_button:
		start_over_button.connect("pressed", restart_game)
		

func restart_game():
	start_over_button.disabled = true
	SceneManager.index = 0
	GameState.player_lives = GameState.original_player_lives
	GameEventBus.emit_signal("level_completed")
	layer = 0
