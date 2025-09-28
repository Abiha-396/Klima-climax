extends CharacterBody2D


const SPEED = -100.0
const JUMP_VELOCITY = -400.0

func _ready():
	velocity.x=0

	
func _physics_process(delta):
	velocity.x = SPEED
	

	move_and_slide()


	
