extends Control


func _ready() -> void:
	$MarginContainer/VBoxContainer/Continue.grab_focus()


func _on_Continue_pressed() -> void:
	get_tree().change_scene_to(Globals.HOME_SCN)
