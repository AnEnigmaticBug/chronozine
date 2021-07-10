extends Node2D


export var lasers_per_second := 1
export var fire_period := 2.0
export var cool_period := 1.0
export var start_delay := 0.5

onready var start_delay_timer: Timer = $StartDelayTimer
onready var laser_timer: Timer = $LaserTimer
onready var fire_timer: Timer = $FireTimer
onready var cool_timer: Timer = $CoolTimer


func _ready() -> void:
	start_delay_timer.wait_time = start_delay
	laser_timer.wait_time = 1.0 / lasers_per_second
	fire_timer.wait_time = fire_period
	cool_timer.wait_time = cool_period

	start_delay_timer.start()


func _on_StartDelayTimer_timeout() -> void:
	_on_CoolTimer_timeout()


func _on_LaserTimer_timeout() -> void:
	for child in get_children():
		if child.has_method("fire"):
			child.fire()


func _on_FireTimer_timeout() -> void:
	laser_timer.stop()
	fire_timer.stop()
	cool_timer.start()


func _on_CoolTimer_timeout() -> void:
	laser_timer.start()
	fire_timer.start()
	cool_timer.stop()
