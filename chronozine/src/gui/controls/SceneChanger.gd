extends Button


export var destination: PackedScene


func _on_SceneChanger_pressed() -> void:
	get_tree().change_scene_to(destination)
