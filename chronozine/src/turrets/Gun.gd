extends Node2D


signal laser_fired(pos, dir)


onready var barrel_exit: Node2D = $BarrelExit
onready var pew_sfx: AudioStreamPlayer2D = $Pew


func fire() -> void:
	var pos := barrel_exit.global_position
	var dir := Vector2(cos(global_rotation), sin(global_rotation))
	emit_signal("laser_fired", pos, dir)

	pew_sfx.play()
