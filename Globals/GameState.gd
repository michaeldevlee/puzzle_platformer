extends Node2D

@export var player_lives : int = 10
var original_player_lives : int

func _ready():
	original_player_lives = player_lives
