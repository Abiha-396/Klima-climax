extends Node2D


func _on_area_2d_body_entered(body: Node2D) -> void:
	await get_tree().create_timer(0.05).timeout
	get_tree().reload_current_scene()
