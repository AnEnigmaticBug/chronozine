class_name Level
extends Node2D


const LASER_SCN := preload("res://src/turrets/Laser.tscn")

onready var lasers: Node2D = $Lasers


func _ready() -> void:
	for gun in get_tree().get_nodes_in_group("gun"):
		gun.connect("laser_fired", self, "_on_laser_fired")


func _on_laser_fired(pos: Vector2, dir: Vector2) -> void:
	var laser: Laser = LASER_SCN.instance()
	lasers.add_child(laser)
	laser.init(pos, dir)
