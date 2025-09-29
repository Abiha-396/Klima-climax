extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
@onready var shoot_raycast= $RayCast2D
@onready var bat= $Bat

func _process(delta):
	if Input.is_action_just_pressed("shoot"):
		shoot_raycast.is_colliding()
 		
		
		
	
