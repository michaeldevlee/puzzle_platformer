extends Area2D
class_name Trigger

@export_enum("DEATH", "REMOVE") var trigger_type = "DEATH"

func trigger():
	if trigger_type == "DEATH":
		GameEventBus.emit_signal("player_died")
	
	if trigger_type == "REMOVE":
		GameEventBus.emit_signal("remove_initiated")
