extends CharacterBody2D


const SPEED = 200.0
const JUMP_VELOCITY = -300.0
@onready var anim = $AnimatedSprite2D
@onready var aud_p = $AudioStreamPlayer2D
func get_direction_name():
	return ["right", "left"]
var dir = get_direction_name()

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

func update_animation(dir):
	if not self.is_on_floor:
		anim.play("jump_" + dir)
	elif dir != 0:
		anim.play("walk_" + dir)
		anim.flip_h = dir < 0
	else:
		anim.play("idle_" + dir)
