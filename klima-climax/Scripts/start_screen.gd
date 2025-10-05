extends Control



func _on_quit_button_pressed() -> void:
	get_tree().quit()


func _on_texture_button_2_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/UI/menu_screen.tscn")
