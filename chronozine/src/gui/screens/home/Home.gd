extends Control


func _ready() -> void:
	MusicManager.play_menu_music()
	$VBoxContainer/Levels.get_child(0).grab_focus()


func _on_Quit_pressed() -> void:
	get_tree().quit()
