extends Interactable

@export_enum("DEATH", "WARP") var trigger_type = "DEATH"
@export var destination_portal : Area2D 

func interact():
	print('using portal')
