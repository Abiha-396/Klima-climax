extends Node

var score =0
var life: int = 3

func _ready() -> void:
	pass


	
	
func _on_bat_elf_hit():
	life-=1
	print(life)
	get_tree().reload_current_scene()
