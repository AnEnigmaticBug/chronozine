extends Node2D


export var degrees_per_second := 60


func _physics_process(dt: float) -> void:
	rotation_degrees += degrees_per_second * dt
