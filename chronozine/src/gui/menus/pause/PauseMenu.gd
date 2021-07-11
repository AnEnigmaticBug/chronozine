class_name PauseMenu
extends VBoxContainer


signal resumed


func present() -> void:
	show()
	var options: ItemList = $Options
	options.grab_focus()
	options.select(0)


func _on_Options_item_activated(index: int) -> void:
	get_tree().paused = false

	match index:
		0: emit_signal("resumed")
		1: get_tree().reload_current_scene()
		2: get_tree().quit()
