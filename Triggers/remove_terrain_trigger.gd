extends Trigger

@export var terrain_group : Node2D

func _ready():
	GameEventBus.connect("remove_initiated", remove_terrain)
	
func remove_terrain():
	if terrain_group:
		terrain_group.queue_free()
		terrain_group = null
