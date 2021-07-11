class_name RetryMenu
extends VBoxContainer


func present() -> void:
	show()
	var options: ItemList = $Options
	options.grab_focus()
	options.select(0)


func _on_Options_item_activated(index: int) -> void:
	get_tree().paused = false

	match index:
		0: get_tree().reload_current_scene()
		1: get_tree().change_scene_to(Globals.HOME_SCN)
