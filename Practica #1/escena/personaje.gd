extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

@onready var sprite_2d = $AnimatedSprite2D

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	if Input.is_action_just_pressed("attack"):
		sprite_2d.animation = "attack"
		
	if(velocity.x > 1 || velocity.x < -1):
		sprite_2d.animation = "correr"
	else:
		sprite_2d.animation = "default"
		
	if not is_on_floor():
		velocity.y += gravity * delta
		sprite_2d.animation = "saltar"

	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	var direction = Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, 12)

	move_and_slide()
	
	var isLeft = velocity.x < 0
	sprite_2d.flip_h = isLeft
