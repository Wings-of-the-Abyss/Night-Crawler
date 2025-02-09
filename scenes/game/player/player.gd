extends CharacterBody2D

const SPEED = 300.0

var HP: float = 20.0
const MAX_HP: float = 20.0

@onready var hitbox = $Hitbox
@onready var anims = $AnimationPlayer

func _physics_process(_delta):
	var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	if direction:
		velocity = direction * SPEED
		hitbox.rotation = direction.angle()
	else:
		velocity = velocity.lerp(Vector2.ZERO, 0.6)
	
	move_and_slide()

func _unhandled_input(_event):
	if Input.is_action_just_pressed("ui_accept"):
		anims.play("attack")
