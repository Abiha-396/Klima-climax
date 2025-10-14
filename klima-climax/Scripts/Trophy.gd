extends Node2D
@onready var trophy = $Trophy2
signal change_scene


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GlobalScript.index
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	

func _on_area_2d_body_entered(body: Node2D) -> void:
	GlobalScript.index+=1
	trophy.play("Win")
	$AudioStreamPlayer2D.play()
	await get_tree().create_timer(0.75).timeout
	GlobalScript.change_to_next_level()
	
