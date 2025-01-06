extends CharacterBody2D


const SPEED = 200.0
const JUMP_VELOCITY = -300.0
@onready var anim = $AnimatedSprite2D
@onready var aud_p = $AudioStreamPlayer2D


func _physics_process(delta: float) -> void:
	# Add the gravity.
	var direction := Input.get_axis("ui_left", "ui_right")
	if not is_on_floor():
		velocity += get_gravity() * delta
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	update_animation(direction)
	
	move_and_slide()

func update_animation(dir):
	if not self.is_on_floor:
		$AnimatedSprite2D.play("jump_" + str(dir))
	elif dir != 0:
		$AnimatedSprite2D.play("walk_" + str(dir))
		$AnimatedSprite2D.flip_h = dir < 0
	else:
		$AnimatedSprite2D.play("idle_" + str(dir))
	pass
