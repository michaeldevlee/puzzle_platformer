extends Node2D

signal level_completed

func _ready():
	for child in get_children():
		if child.has_signal("teleport_started"):
			child.connect("teleport_started", test)

func test():
	print('teleport')
	pass
