extends CharacterBody2D


const SPEED = 200.0
const JUMP_VELOCITY = -300.0
@onready var anim = $AnimatedSprite2D
@onready var aud_p = $AudioStreamPlayer2D
@onready var ghosttimer = $ghosttimer

func dash():
	ghosttimer.start()
	var tween = get_tree().create_tween()
	tween.tween_property(self, "position", position + velocity * 1.5, 0.45)
	await tween.finished
	ghosttimer.stop()

func _input(event):
	if event.is_action_just_pressed("dash"):
		dash()

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
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	move_and_slide() 
	update_animation(direction)


func update_animation(dir):
	if not self.is_on_floor:
		$AnimatedSprite2D.play("jump_" + str(dir))
	elif dir != 0:
		$AnimatedSprite2D.flip_h = dir < 0
		$AnimatedSprite2D.play("walk_" + str(dir))
	else:
		$AnimatedSprite2D.play("idle_" + str(dir))
	if dir < 0:
		$AnimatedSprite2D.flip_h = dir < 0
		$AnimatedSprite2D.play("walk_" + str(dir))
	else:
		pass
	pass
