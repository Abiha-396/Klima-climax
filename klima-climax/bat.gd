extends Node2D

@onready var bat = $Bat

signal elf_hit

func _ready():
	GlobalScript.life=3
	
func _process(delta):
	if GlobalScript.life<1:
		get_tree().change_scene_to_file("res://Scenes/end_screen_lost.tscn")
		
	
	
func _on_timer_timeout():
	var clone = bat.duplicate()
	add_child(clone)
	clone.position = Vector2(randf_range(0,6000), randf_range(0,400))



func _on_area_2d_body_entered(body):
	self.queue_free()
	elf_hit.emit()
	
	
	
	

	
	
		
	
	
	
	
