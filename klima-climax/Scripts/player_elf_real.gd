extends CharacterBody2D

@onready var animated_sprite = $AnimatedSprite2D
@onready var Bat= $RayCast2D
@export	var gravity =400
@export var JUMP_VELOCITY=-200
@export var Ref_arrow: PackedScene
const SPEED= 250
var isAttacking: bool=false
@export var rotation_speed = 10.0


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
		
	if Input.is_action_pressed("Shoot"):
		animated_sprite.play("sp_attack")
	
	if GlobalScript.life<3:
		animated_sprite.play("Death")
	# Animation logic
	animated_sprite.flip_h=false
	if not is_on_floor():
		if velocity.y < 0:
			if direction > 0:
				animated_sprite.play("Jump")
			else:
				animated_sprite.flip_h =true
				animated_sprite.play("Jump")
		else:
			if direction > 0:
				animated_sprite.play("Fall")
			else:
				animated_sprite.flip_h =true
				animated_sprite.play("Fall")
			
	elif direction > 0:
		animated_sprite.play("Idle")
	elif direction < 0:
		#animated_sprite.play("Run_back")
		animated_sprite.flip_h =true
	else:
		if Input.is_action_just_pressed("Move_right") and is_on_floor():
			animated_sprite.play("Idle")
		else:
			animated_sprite.flip_h =true
			animated_sprite.play("Idle")
			animated_sprite.flip_h =false
		
	if Input.is_action_just_pressed("Attack"):
		shoot_arrow()
	
	
	
	#if global_position.y>100:
		#die()



	move_and_slide()


func _on_killzone_body_entered(body: Node2D) -> void:
	await get_tree().create_timer(0.05).timeout
	get_tree().reload_current_scene()
	

func shoot_arrow():
	print("Arrow_shot")
	if Ref_arrow:
		var arrow= Ref_arrow.instantiate()
		get_tree().current_scene.add_child(arrow)
		arrow.global_position= self.global_position
		
		var arrow_rotation= self.global_position.direction_to(get_global_mouse_position()).angle()
		arrow.rotation=arrow_rotation
	
	
	


	
	
