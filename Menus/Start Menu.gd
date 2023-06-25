extends CanvasLayer

@onready var start_button = get_node("Button") 

func _ready():
	if start_button:
		start_button.connect("pressed", start_game)
		

func start_game():
	print('start')
	start_button.disabled = true
	GameEventBus.emit_signal("level_completed")
	layer = 0
