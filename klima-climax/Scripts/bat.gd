extends Node2D

@onready var bat = $Bat


func _ready():
	GlobalScript.life

	
func _on_timer_timeout():
	var clone = bat.duplicate()
	add_child(clone)
	clone.position = Vector2(randf_range(0,6000), randf_range(0,500))
	

func _on_area_2d_body_entered(body):
	print(body)
	self.queue_free()
	GlobalScript.life -=1
	get_tree().reload_current_scene()
	
	
	
	
	

	
	
		
	
	
	
	
