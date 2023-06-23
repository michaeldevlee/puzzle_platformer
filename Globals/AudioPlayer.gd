extends AudioStreamPlayer

var levelMusic = preload("res://Assets/Music/gameplay.ogg")
var titleMusic = preload("res://Assets/Music/title.ogg")

func playMusic(stream : AudioStream):
	set_stream(stream)
	play()

