extends Trigger

#left, top, right, bottom
@export_enum("left:0", "top:1", "right:2", "bottom:3") var side : int = 3
@export var amount = 270

func trigger():
	var camera : Camera2D = get_tree().get_nodes_in_group("Player")[0].camera
	var current_limit = camera.get_limit(side) + amount
	camera.set_limit(side, current_limit)
	collider.set_deferred("disabled", true)
	

