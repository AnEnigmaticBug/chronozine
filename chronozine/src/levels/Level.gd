class_name Level
extends Node2D


const LASER_SCN := preload("res://src/turrets/Laser.tscn")
const SLO_MO := 0.125

onready var lasers: Node2D = $Lasers


func _ready() -> void:
	MusicManager.play_game_music()

	for gun in get_tree().get_nodes_in_group("gun"):
		gun.connect("laser_fired", self, "_on_laser_fired")


func _on_Goal_body_entered(body: Node) -> void:
	if body is Player:
		get_tree().reload_current_scene()


func _on_Player_started_slo_mo() -> void:
	Engine.time_scale = SLO_MO


func _on_Player_stopped_slo_mo() -> void:
	Engine.time_scale = 1.0


func _on_Player_died() -> void:
	get_tree().reload_current_scene()


func _on_laser_fired(pos: Vector2, dir: Vector2) -> void:
	var laser: Laser = LASER_SCN.instance()
	lasers.add_child(laser)
	laser.init(pos, dir)
