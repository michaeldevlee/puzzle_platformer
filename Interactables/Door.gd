extends Interactable

@onready var collision_shape = get_node("CollisionShape2D")

func interact():
	GameEventBus.emit_signal("level_completed")

