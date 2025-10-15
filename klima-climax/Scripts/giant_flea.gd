extends CharacterBody2D


const SPEED = -50
const JUMP_VELOCITY = -400.0

func _ready():
	velocity.x=0

	
func _physics_process(delta):
	velocity.x = SPEED
	

	move_and_slide()


func _on_area_2d_body_entered(body):
	print(body)
	if body is CharacterBody2D:
		body.hide()
		await get_tree().create_timer(0.5).timeout
		get_tree().change_scene_to_file("res://Scenes/UI/end_screen_lost.tscn")
