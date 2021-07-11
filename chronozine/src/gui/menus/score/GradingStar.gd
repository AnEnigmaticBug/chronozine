class_name GradingStar
extends VBoxContainer


var requirement := 99 setget _set_requirement
var is_unlocked := false setget _set_unlocked

onready var anim_sprite: AnimatedSprite = $Control/AnimatedSprite
onready var requirement_label: Label = $Requirement


func _set_requirement(value: int) -> void:
	requirement = value
	requirement_label.text = "%s sec" % requirement


func _set_unlocked(value: bool) -> void:
	is_unlocked = value

	if is_unlocked:
		anim_sprite.modulate = Color.white
	else:
		anim_sprite.modulate = Color(0x60606060)
