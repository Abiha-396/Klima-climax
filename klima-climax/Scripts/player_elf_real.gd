extends CharacterBody2D

@onready var animated_sprite = $AnimatedSprite2D
@onready var ray=$RayCast2D

@export	var gravity =400
@export var JUMP_VELOCITY=-300
@export var Ref_arrow: PackedScene
@export var kill_zone: PackedScene
@export var rotation_speed = 10.0

const SPEED= 250
var isAttacking: bool=false



func _ready():
	GlobalScript.life

func _physics_process(delta: float) -> void:
	

	
	#Variables
	var direction := Input.get_axis("Move_left", "Move_right")
	if direction<0:
		animated_sprite.flip_h=true
	else:
		animated_sprite.flip_h=false
	
	
	
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	
	# Movement
	if direction: #move towards it
		velocity.x = direction * SPEED
		if is_on_floor():
			animated_sprite.play("Run")
		
	else: # Come to a stop
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
		
		
		
		
	# Handle jump.
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		animated_sprite.play("Jump_short")
		velocity.y = JUMP_VELOCITY
		if Input.is_action_pressed("Jump") and is_on_floor():
			velocity.y= 1.5*JUMP_VELOCITY
		
		
	if Input.is_action_pressed("Move_up") and is_on_floor():
		animated_sprite.play("Jump_short")
		velocity.y= JUMP_VELOCITY
		
			
	if Input.is_action_pressed("Roll"):
		velocity.y= -JUMP_VELOCITY
		animated_sprite.play("Roll")
		 
	if is_on_floor() and velocity.x==0 and velocity.y==0 and !animated_sprite.is_playing():
		animated_sprite.play("Idle")
	
		
		
	if Input.is_action_just_pressed("Laser"):
		animated_sprite.play("sp_attack")
		#add the raycast
		

	if Input.is_action_just_pressed("Attack"):
		shoot_arrow()
	

	move_and_slide()



func _on_killzone_body_entered(body: Node2D) -> void:
	animated_sprite.play("Death")
	await get_tree().create_timer(1.78).timeout
	get_tree().reload_current_scene()
	GlobalScript.life-=1

func shoot_arrow():
	animated_sprite.play("Attack_straight")
	if Ref_arrow:
		var arrow= Ref_arrow.instantiate()
		get_tree().current_scene.add_child(arrow)
		arrow.global_position= self.global_position
		
		var arrow_rotation= self.global_position.direction_to(get_global_mouse_position()).angle()
		arrow.rotation=arrow_rotation
	
	
