extends Node2D

@onready var bat = $Bat

func _physics_process(delta: float) -> void:
	await get_tree().create_timer(1).timeout
	var clone = bat.duplicate()
	add_child(clone)
	clone.position = Vector2(randf_range(0,1), -50)
	await get_tree().create_timer(1).timeout
		
