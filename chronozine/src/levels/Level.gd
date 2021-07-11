class_name Level
extends Node2D


const LASER_SCN := preload("res://src/turrets/Laser.tscn")
const SLO_MO := 0.125

export var next_scene: PackedScene

onready var total_time := 0.0
onready var lasers: Node2D = $Lasers
onready var time_label: Label = $Gui/Time
onready var scrim: Scrim = $Gui/Scrim
onready var pause_menu: PauseMenu = $Gui/Menus/Pause
onready var retry_menu: RetryMenu = $Gui/Menus/Retry
onready var score_menu: ScoreMenu = $Gui/Menus/Score


func _ready() -> void:
	MusicManager.play_game_music()

	for gun in get_tree().get_nodes_in_group("gun"):
		gun.connect("laser_fired", self, "_on_laser_fired")


func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("pause"):
		get_tree().paused = true
		yield(scrim.animate_and_show(Color(0x0c0c0ca0)), "completed")
		pause_menu.present()


func _process(dt: float) -> void:
	total_time += dt / Engine.time_scale
	time_label.text = "%.2f sec" % total_time


func _on_Goal_body_entered(body: Node) -> void:
	if body is Player:
		get_tree().paused = true
		yield(scrim.animate_and_show(Color(0x6c6f1060)), "completed")
		score_menu.present(total_time)


func _on_Player_started_slo_mo() -> void:
	Engine.time_scale = SLO_MO


func _on_Player_stopped_slo_mo() -> void:
	Engine.time_scale = 1.0


func _on_Player_died() -> void:
	# In case the player died doing slo-mo
	Engine.time_scale = 1.0

	get_tree().paused = true
	yield(scrim.animate_and_show(Color(0x6f101060)), "completed")
	retry_menu.present()


func _on_laser_fired(pos: Vector2, dir: Vector2) -> void:
	var laser: Laser = LASER_SCN.instance()
	lasers.add_child(laser)
	laser.init(pos, dir)


func _on_PauseMenu_resumed() -> void:
	scrim.hide()
	pause_menu.hide()


func _on_Score_advanced_level() -> void:
	get_tree().change_scene_to(next_scene)
