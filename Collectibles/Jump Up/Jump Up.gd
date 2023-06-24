extends Collectible

func collect():
	GameEventBus.emit_signal("jump_up_collected")
	print('collected')
	queue_free()
