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
		anim.play("jump_1")
		if direction < 0:
			anim.flip_h
	if Input.is_action_just_pressed('ui_left') or Input.is_action_just_pressed("ui_right"):
		anim.play("walk_1")
		if direction < 0:
			$AnimatedSprite2D.flip_h
		
		if Input.is_action_just_pressed("ui_accept") and is_on_floor():
			velocity.y = JUMP_VELOCITY
			velocity += get_gravity() * delta
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	move_and_slide() 
	update_animation(direction)


func update_animation(dir):
	if not self.is_on_floor:
		$AnimatedSprite2D.play("jump_" + str(dir))
	else:
		$AnimatedSprite2D.play("idle_0")
	if dir < 0:
		$AnimatedSprite2D.play("walk_" + str(dir))
	else:
		pass
	pass
