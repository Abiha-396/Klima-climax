extends Node2D
var score=0 

func _on_area_2d_body_entered(body: Node2D) -> void:
	queue_free()
	
	
