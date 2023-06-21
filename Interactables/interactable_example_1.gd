extends Interactable

@onready var collision_shape = get_node("CollisionShape2D")

func interact():
	print(name)
	collision_shape.disabled = true
	queue_free()

