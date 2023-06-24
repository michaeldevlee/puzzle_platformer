extends Area2D
class_name Collectible

@onready var collider = get_node("CollisionShape2D")

func collect():
	print('collected')
