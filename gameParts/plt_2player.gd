extends CharacterBody2D


var SPEED = 200.0
var JUMP_VELOCITY = -300.0
@onready var anim = $AnimatedSprite2D


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
		anim.play("jump")
		var dir := Input.get_axis("ui_left", "ui_right")
		if dir < 0:
			anim.flip_h
		
	if is_on_floor():
		anim.play("walk_1")
		var dir := Input.get_axis("ui_left", "ui_right")
		if dir < 0:
			anim.flip_h
	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
