extends Collectible

func collect():
	GameEventBus.emit_signal("jump_up_collected")
	collider.set_deferred("disabled", true)
	visible = false
	print('collected')
	AudioPlayer.playSFX(AudioPlayer.collectSFX)
