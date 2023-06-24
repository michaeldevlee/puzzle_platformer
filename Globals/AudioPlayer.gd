extends Node2D

@onready var mPlayer = get_node("Music Player")
@onready var sfxPlayer = get_node("SFX Player")
var levelMusic = preload("res://Assets/Music/gameplay.ogg")
var titleMusic = preload("res://Assets/Music/title.ogg")

var jumpSFX = preload("res://Assets/Jump/Jump.wav")
var dieSFX = preload("res://Assets/Jump/Laser2.wav")
var collectSFX = preload("res://Assets/Jump/Powerup.wav")

func playMusic(stream : AudioStream):
	mPlayer.set_stream(stream)
	mPlayer.play()

func playSFX(stream : AudioStream):
	sfxPlayer.set_stream(stream)
	sfxPlayer.play()
