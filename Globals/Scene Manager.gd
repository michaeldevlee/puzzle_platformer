extends CanvasLayer

@onready var animPlayer : AnimationPlayer = get_node("AnimationPlayer")

@export var level_list : Array[PackedScene] = []
var index = 0

func _ready():
	GameEventBus.connect("level_completed", start_level_transition)
	
func start_level_transition():
	if (level_list[index]):
		animPlayer.play("Level_Completed")
	else:
		animPlayer.play("End Game Animation")

func load_next_level():
	get_tree().change_scene_to_packed(level_list[index])
	index += 1

func finish_level_transition():
	animPlayer.play_backwards("Level Completed")
	
