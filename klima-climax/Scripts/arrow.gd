extends Area2D

@export var speed : int =200
var direction: Vector2
@export var Ref_bat: PackedScene


func _ready():
	GlobalScript.score
	
func _physics_process(delta):
	# Adjusts the arrow direction 
	direction= Vector2.RIGHT.rotated(rotation)
	global_position += direction*speed*delta

func destroy():
	queue_free()




func _on_area_entered(area):
	print(area)
	destroy()



func _on_body_entered(body):
	print(body)
	body.queue_free()
	GlobalScript.score+=1
	destroy()



func _on_visible_on_screen_notifier_2d_screen_exited():
	print("I exited")
	destroy()
