extends Control


func _ready() -> void:
	$MarginContainer/VBoxContainer/UseMouse.pressed = Globals.is_using_mouse
	$MarginContainer/VBoxContainer/Continue.grab_focus()


func _on_UseMouse_toggled(checked: bool) -> void:
	Globals.is_using_mouse = checked


func _on_Continue_pressed() -> void:
	get_tree().change_scene_to(Globals.HOME_SCN)
