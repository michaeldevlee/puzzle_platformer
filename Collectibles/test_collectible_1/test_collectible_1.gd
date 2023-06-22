extends Collectible

func collect():
	print(name + ' collected')
	queue_free()
