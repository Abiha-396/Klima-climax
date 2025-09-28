extends Node2D

@onready var bat = $Bat
@onready var label=$Label
var life = 3
var Life=str(life)

	
	
func _on_timer_timeout():
	var clone = bat.duplicate()
	add_child(clone)
	clone.position = Vector2(randf_range(0,5500), randf_range(0,350))


func _on_area_2d_body_entered(body):
	queue_free()
	await get_tree().create_timer(0.05).timeout
	get_tree().reload_current_scene()
	life-=1
	
func _physics_process(delta):
	#label.text = Life
	if life<1:
		get_tree().change_scene_to_file("res://Scenes/end_screen_lost.tscn")
		
	
	
	
	
