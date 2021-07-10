extends Node


onready var menu_music: AudioStreamPlayer = $Menu
onready var game_music: AudioStreamPlayer = $Game


func play_menu_music() -> void:
	if menu_music.playing:
		return

	game_music.stop()
	menu_music.play()


func play_game_music() -> void:
	menu_music.stop()
	game_music.play()


func increase_game_music_volume() -> void:
	game_music.volume_db = -3


func decrease_game_music_volume() -> void:
	game_music.volume_db = -6
