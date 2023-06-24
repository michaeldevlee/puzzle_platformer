extends Area2D
class_name Trigger

@export_enum("DEATH", "REMOVE", "REVEAL", "CAMERA") var trigger_type = "DEATH"
@onready var collider = get_node("CollisionShape2D")

func trigger():
	if trigger_type == "DEATH":
		GameEventBus.emit_signal("player_died")
		AudioPlayer.playSFX(AudioPlayer.dieSFX)
	
	if trigger_type == "REMOVE":
		GameEventBus.emit_signal("remove_initiated")
