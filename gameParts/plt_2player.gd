extends CharacterBody2D


var SPEED = 200.0
var JUMP_VELOCITY = -300.0
@onready var anim = $AnimatedSprite2D
@onready var sound = $AudioStreamPlayer2D

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
		anim.play("jump")
	if not is_on_floor() and Input.is_action_just_pressed("ui_accept"):
		velocity.y = JUMP_VELOCITY
	if not is_on_floor() and Input.is_action_just_pressed("dash"):
		var direction := Input.get_axis("ui_left", "ui_right")
		velocity.x = -JUMP_VELOCITY * 5
		if direction < 0:
			velocity.x = JUMP_VELOCITY * 5
		anim.play("dash")
		sound.play()
		await sound.finished
	if not is_on_floor():
		pass
	if is_on_wall():
		velocity / 2
	if is_on_floor():
		if velocity.x != 0:
			anim.play("walk_1")
		else:
			anim.play("idle_")
	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		anim.flip_h = (direction < 0)
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	move_and_slide()
