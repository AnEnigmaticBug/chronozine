extends Control


func _ready() -> void:
	$VBoxContainer/Exit.grab_focus()


func _on_Exit_pressed() -> void:
	get_tree().change_scene_to(Globals.HOME_SCN)
