class_name Scrim
extends ColorRect


const FADE_IN_TIME := 0.2

onready var tween: Tween = $Tween


func animate_and_show(color: Color) -> void:
	get_tree().paused = true
	show()

	tween.interpolate_property(
		self,
		"color",
		Color.transparent,
		color,
		FADE_IN_TIME
	)
	tween.start()

	yield(tween, "tween_all_completed")
