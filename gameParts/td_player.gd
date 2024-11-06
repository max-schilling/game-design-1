extends CharacterBody2D


const SPEED = 100.0
const MAX_OBTAINABLE_HEALTH = 400.0
enum STATES { IDLE=0, DEAD, DAMAGED, ATTACKING, CHARGING }

@export var data = {
	"max_health": 60.0,
	"health": 50.0,
	"money": 0,
	"state": STATES.IDLE,
	"secondaries": []
}

var inertia = Vector2()
var look_direct = Vector2.DOWN
var att_direct = look_direct
var anim_lock = 0.0
var dam_lock = 0.0
var chrg_time = 2.5
var chrg_start = 0.0

var slash_scene = preload("res://entites/attacks/slash.tscn")

@onready var p_HUD = get_tree(). get_first_node_in_group("HUD")

func get_direction_name():
	return ["right", "down", "left", "up"] [
		int(round(look_direct.angle() * 2 / PI)) % 4
	]

func attack():
	data.state = STATES.ATTACKING
	var dir_name = get_direction_name()
	if dir_name == "left":
		$AnimatedSprite2D.flip_h = 0
	$AnimatedSprite2D.play("swipe_" + dir_name)
	att_direct = look_direct
	var slash = slash_scene.instantiate()
	slash.position = att_direct * 20.0
	slash.rotation = Vector2().angle_to_point(-att_direct)
	add_child(slash)
	anim_lock = 0.2

func _ready() -> void:
	p_HUD.show()

func pickup_health(value):
	data.health += value
	data.health = clamp(data.health, 0, data.max_health)

func pickup_money(value):
	data.money += value

func _physics_process(delta: float) -> void:
	
	anim_lock = max(anim_lock-delta, 0.0)
	dam_lock = max(dam_lock-delta, 0.0)
	if anim_lock == 0 and data.state != STATES.DEAD:
		if data.state != STATES.CHARGING:
			data.state = STATES.IDLE
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
	
	if data.state != STATES.DEAD:
		if Input.is_action_just_pressed("ui_accept"):
			attack()
			# TODO: charge timer/state
	if Input.is_action_just_pressed("ui_cancel"):
		$Camera2D/pause_menu.show()
		get_tree().paused = true
	pass

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
	
