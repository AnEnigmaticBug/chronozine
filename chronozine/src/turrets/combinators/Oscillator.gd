extends Node2D


export var half_spread_in_degrees := 60.0
export var degrees_per_second := 60.0

onready var _dir := int(sign(degrees_per_second))


func _physics_process(dt: float) -> void:
	if rotation_degrees < -half_spread_in_degrees:
		_dir = +1
	if rotation_degrees > +half_spread_in_degrees:
		_dir = -1

	rotation_degrees += _dir * degrees_per_second * dt
