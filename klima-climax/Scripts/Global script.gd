extends Node

var score: int =0
var life: int = 3


func _ready():
	pass
	
func _process(delta):
	if life<1:
		get_tree().change_scene_to_file("res://Scenes/end_screen_lost.tscn")
		
		
		

	
