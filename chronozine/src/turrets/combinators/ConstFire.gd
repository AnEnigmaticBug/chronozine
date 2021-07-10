extends Node2D


export var lasers_per_second := 1

onready var timer: Timer = $Timer


func _ready() -> void:
	timer.wait_time = 1.0 / lasers_per_second
	timer.start()


func _on_Timer_timeout() -> void:
	for child in get_children():
		if child.has_method("fire"):
			child.fire()
