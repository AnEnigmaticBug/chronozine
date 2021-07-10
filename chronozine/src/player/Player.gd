class_name Player
extends KinematicBody2D


signal started_slo_mo
signal stopped_slo_mo


const MAX_SPEED := 800
const ACCELERATION := 0.016
const DECELERATION := 0.008
const HANDLING := 0.2

var velocity := Vector2()

onready var exhaust: Node2D = $Exhaust
onready var wave: Particles2D = $Wave


func hurt(damage: int) -> void:
	print("HURT")


func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("slo_mo"):
		wave.emitting = true
		emit_signal("started_slo_mo")

	if Input.is_action_just_released("slo_mo"):
		wave.emitting = false
		emit_signal("stopped_slo_mo")


func _physics_process(_dt: float) -> void:
	var target_dir := _direction_input()
	rotation = lerp_angle(rotation, target_dir.angle(), HANDLING)

	if Input.is_action_pressed("accelerate"):
		var target_velocity := target_dir * MAX_SPEED
		velocity = lerp(velocity, target_velocity, ACCELERATION)
		exhaust.show()
	else:
		var target_velocity := Vector2()
		velocity = lerp(velocity, target_velocity, DECELERATION)
		exhaust.hide()

	velocity = move_and_slide(velocity)


func _direction_input() -> Vector2:
	var strength := Vector2(
		Input.get_action_strength("point_rt") - Input.get_action_strength("point_lt"),
		Input.get_action_strength("point_dn") - Input.get_action_strength("point_up")
	)

	if strength:
		return strength.normalized()
	else:
		return Vector2(cos(rotation), sin(rotation))
