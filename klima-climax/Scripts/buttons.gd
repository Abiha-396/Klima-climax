extends Control

func _ready():
	GlobalScript.index

func _on_home_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/UI/start_screen.tscn")
	


func _on_restart_button_pressed() -> void:
	#get_tree().reload_current_scene()
	GlobalScript.index+=1
	GlobalScript.change_to_next_level()
