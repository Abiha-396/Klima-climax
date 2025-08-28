extends Node2D
@onready var trophy= $Trophy


func _on_area_2d_area_entered(area: Area2D) -> void:
	trophy.play("Win")
	await get_tree().create_timer(0.75).timeout
	get_tree().change_scene_to_file("res://Scenes/level_2_platform.tscn")
