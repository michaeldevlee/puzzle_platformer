extends Interactable

@export var destination_portal : Area2D 
signal teleport_started

func interact():
	emit_signal("teleport_started")
