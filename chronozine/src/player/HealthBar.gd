class_name HealthBar
extends HBoxContainer


const ITEM_SCN := preload("res://src/player/HealthBarItem.tscn")


func init(max_health: int) -> void:
	for i in max_health:
		var item = ITEM_SCN.instance()
		add_child(item)


func hurt(health: int) -> void:
	for i in get_child_count():
		if i < health:
			get_child(i).show()
		else:
			get_child(i).hide()
