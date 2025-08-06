extends CharacterBody2D

@onready var animated_sprite = $AnimatedSprite2D
@export	var gravity =400
@export var JUMP_VELOCITY=-200
const SPEED= 250

#func die():
	#animated_sprite.play("Death")
	#get_tree().change_scene_to_file("res://Scenes/end_screen.tscn")
	

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		if Input.is_action_pressed("Jump") and is_on_floor():
			velocity.y= 2*JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("Move_left", "Move_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	if Input.is_action_pressed("Move_up") and is_on_floor():
		velocity.y= JUMP_VELOCITY
		if JUMP_VELOCITY>-100:
			JUMP_VELOCITY=-100
			
	if Input.is_action_pressed("Roll"):
		velocity.y= -JUMP_VELOCITY
	
	# Animation logic
	if not is_on_floor():
		if velocity.y < 0:
			animated_sprite.play("Jump")
		else:
			animated_sprite.play("Fall")
	elif direction != 0:
		animated_sprite.play("Run")
	else:
		animated_sprite.play("Idle")
		
	#if global_position.y>100:
		#die()




	move_and_slide()
