extends Interactable

@export var destination_portal : Area2D 
signal teleport_started

func interact():
	if destination_portal:
		var player = get_tree().get_nodes_in_group("Player")[0]
		player.global_position = destination_portal.global_position
