class_name ScoreMenu
extends VBoxContainer


signal advanced_level


export var requirement_1_star := 0
export var requirement_2_star := 0
export var requirement_3_star := 0

onready var star1: GradingStar = $ScoreCard/VBoxContainer/Stars/Star0
onready var star2: GradingStar = $ScoreCard/VBoxContainer/Stars/Star1
onready var star3: GradingStar = $ScoreCard/VBoxContainer/Stars/Star2
onready var remark: Label = $ScoreCard/VBoxContainer/Remark
onready var options: ItemList = $Options


func _ready() -> void:
	star1.requirement = requirement_1_star
	star2.requirement = requirement_2_star
	star3.requirement = requirement_3_star


func present(time_taken: float) -> void:
	show()

	star1.is_unlocked = time_taken <= star1.requirement
	star2.is_unlocked = time_taken <= star2.requirement
	star3.is_unlocked = time_taken <= star3.requirement

	if not star1.is_unlocked:
		remark.text = "0 stars. Wow. You were SLOW.\n"
	if star1.is_unlocked:
		remark.text = "1 star. You can do better.\n"
	if star2.is_unlocked:
		remark.text = "2 stars. Nice job.\n"
	if star3.is_unlocked:
		remark.text = "3 stars. You rock!\n"

	options.grab_focus()
	options.select(0)


func _on_Options_item_activated(index: int) -> void:
	get_tree().paused = false

	match index:
		0: emit_signal("advanced_level")
		1: get_tree().reload_current_scene()
		2: get_tree().change_scene_to(Globals.HOME_SCN)
