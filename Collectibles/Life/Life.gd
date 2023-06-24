extends Collectible

func collect():
	collider.set_deferred("disabled", true)
	visible = false
	GameState.player_lives += 1
	AudioPlayer.playSFX(AudioPlayer.collectSFX)
	
