extends CharacterBody2D


const SPEED = 100.0
const MAX_OBTAINABLE_HEALTH = 400.0
enum STATES { IDLE=0, DEAD, DAMAGED, ATTACKING, CHARGING }

@export var data = {
	"max_health": 60.0,
	"health": 60.0,
	"money": 0,
	"state": STATES.IDLE,
	"secondaries": []
}

var inertia = Vector2()
var look_direct = Vector2.DOWN

func _physics_process(delta: float) -> void:
	var direction = Vector2(
		Input.get_axis("ui_left", "ui_right"),
		Input.get_axis("ui_up", "ui_down")
	)
	if direction.length() > 0:
		look_direct = direction
		direction = direction.normalized()
		self.velocity = direction * SPEED
	else:
		velocity = velocity.move_toward(Vector2.ZERO, SPEED)
	velocity += inertia
	update_animation(direction)
	move_and_slide()
	inertia = inertia.move_toward(Vector2.ZERO, delta * 1000.0)
	
	if Input.is_action_just_pressed("ui_cancel"):
		$Camera2D/pause_menu.show()
		get_tree().paused = true


func update_animation(direction):
	var a_name = "idle_"
	if look_direct.length() > 0:
		a_name = "walk_"
	if look_direct.x != 0:
		a_name += "side"
		$AnimatedSprite2D.flip_h = look_direct.x < 0
	elif look_direct.y < 0:
		a_name += "up"
	elif look_direct.y > 0:
		a_name += "down"
	$AnimatedSprite2D.animation = a_name
	$AnimatedSprite2D.play()
	pass
	
