extends Node

var score: int =0
var life: int = 3
var index:int =0
var temp:int=0

const Levels=[
preload("res://Scenes/Levels/LEVEL 1.tscn"), 
preload("res://Scenes/Levels/level_2.tscn"),
preload("res://Scenes/Levels/level_3.tscn"),
preload("res://Scenes/Levels/level_4.tscn"),
preload("res://Scenes/Levels/level_5.tscn")]


func _ready():
	print(Levels[index])
	
func _process(delta):
	if life<1:
		get_tree().change_scene_to_file("res://Scenes/end_screen_lost.tscn")
		
		
func change_to_next_level():
	temp+=1
	if temp<5:
		get_tree().change_scene_to_packed(Levels[index])
	else:
		get_tree().change_scene_to_file("res://Scenes/UI/end_screen.tscn")
	
	
		

	
