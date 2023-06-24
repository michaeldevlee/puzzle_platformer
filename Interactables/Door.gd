extends Interactable

@onready var collision_shape = get_node("CollisionShape2D")
@export_enum("REAL", "FAKE") var type = "REAL"
func interact():
	if type == "REAL":
		GameEventBus.emit_signal("level_completed")
		type = null
	else:
		GameEventBus.emit_signal("player_died")

