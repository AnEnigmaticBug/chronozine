extends StaticBody2D


var rotation_speed := rand_range(-15, 15)

onready var sprite: Sprite = $Sprite


func _physics_process(dt: float) -> void:
	sprite.rotation_degrees += rotation_speed * dt
