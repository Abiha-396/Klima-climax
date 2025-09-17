extends Node2D
@onready var trophy= $Trophy

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
	
 

func _on_area_2d_body_entered(body: Node2D) -> void:
	trophy.play("Win")
	await get_tree().create_timer(0.75).timeout
	get_tree().change_scene_to_file("res://Scenes/level_2_platform.tscn")
