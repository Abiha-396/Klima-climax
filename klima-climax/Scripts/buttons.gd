extends Control

var audio_bus= AudioServer.get_bus_index("BG")

func _ready():
	GlobalScript.index

func _on_home_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/UI/start_screen.tscn")
	


func _on_restart_button_pressed() -> void:
	get_tree().reload_current_scene()
	


func _on_sound_button_pressed():
	AudioServer.set_bus_mute(audio_bus,not AudioServer.is_bus_mute(audio_bus))
	
