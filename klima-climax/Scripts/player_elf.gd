extends CharacterBody2D
@onready var animated_sprite = $AnimatedSprite2D
@export	var gravity =400


func _physics_process(delta):
	velocity.y += gravity *delta
	
	
	move_and_slide()
