class_name Laser
extends Area2D


const RANGE_SQUARED := 1000 * 1000
const SPEED := 500
const DAMAGE := 1

var velocity := Vector2()
var initial_position := Vector2()


func init(pos: Vector2, dir: Vector2) -> void:
	global_position = pos
	rotation = dir.angle()
	velocity = dir * SPEED
	initial_position = pos


func _physics_process(dt: float) -> void:
	position += velocity * dt

	if global_position.distance_squared_to(initial_position) > RANGE_SQUARED:
		queue_free()


func _on_Laser_body_entered(body: Node) -> void:
	if body.has_method("hurt"):
		body.hurt(DAMAGE)

	queue_free()
