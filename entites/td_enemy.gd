extends CharacterBody2D

const speed = 60.0
var max_h = 30.0
var health = max_h
var dam = 10.0
var AI_STATES = STATES.IDLE

enum STATES { IDLE=0, UP, DOWN, LEFT, RIGHT, UP_L, UP_R, DOWN_L, DOWN_R, DAMAGED}
var state_directs = [Vector2.ZERO, Vector2.UP, Vector2.DOWN, Vector2.LEFT, Vector2.RIGHT, Vector2(-1,-1).normalized(), Vector2(1, -1).normalized(), Vector2(-1, 1).normalized(), Vector2(1, 1).normalized(), Vector2.ZERO]
var state_anim = [
	"",
	"walk_up",
	"walk_down",
	"walk_left",
	"walk_right",
	"walk_left",
	"walk_right",
	"walk_left",
	"walk_right",
	"",
]

var inertia = Vector2()
var ai_time_max = 0.5
var ai_timer = ai_time_max - randi() % 5
var damg_lock = 0.0
var anima_lock = 0.0
var kbk = 128.0
var vision_dist = 50.0
var money_v = 5.0

signal recover

@onready var rcR = $top_raycast
@onready var rcM = $mid_rcast
@onready var rcL = $bottom_raycast
@onready var anim_player = $AnimatedSprite2D
@onready var aud_p = $AudioStreamPlayer2D
var drops = ["drop_coin", "drop_heart"]
var coin_scene = preload("res://entites/items/mini_coin.tscn")
var heart_scene = preload("res://entites/items/mini_mart.tscn")
var damage_shader = preload("res://assets/shaders/take_damage.gdshader")
var death_sound = preload("res://assets/sounds/enemy_death.wav")
func vec2_offset():
	return Vector2(randf_range(-10.0, 10.0), randf_range(-10.0, 10.0))

func drop_scene(item_scene):
	item_scene.global_position = self.global_position + vec2_offset()
	get_tree().current_scene.add_child(item_scene)

func drop_heart():
	drop_scene(heart_scene.instantiate())

func drop_coin():
	var coin = coin_scene.instantiate()
	coin.value = self.money_value
	drop_scene(coin)

func drop_items():
	var num_drops = randi() % 3 + 1
	for i in range(num_drops):
		var rnd_drop = drops[randi() % drops.size()]
		call_deferred(rnd_drop)

func turn_to_player(location: Vector2):
	#set state to move player
	var dir_to_player = (location - self.global_position).normalized()
	velocity = dir_to_player * (speed * 2)
	var closest_ang = INF
	var closest_state = STATES.IDLE
	for i in range(1, 5):
		var state_dir = state_directs[i]
		var ang_diff = abs(state_dir.angle_to(dir_to_player))
		if ang_diff < closest_ang:
			closest_ang = ang_diff
			closest_state = STATES.values()[i]
	AI_STATES = closest_state
func take_damage(dmg, attacker=null):
	if damg_lock == 0.0:
		AI_STATES = STATES.DAMAGED
		health -= dmg
		damg_lock = 0.2
		anima_lock = 0.2
		var dmg_intensity = clamp(1.0-((health+0.01)/max_h), 0.1, 0.8)
		anima_lock = dmg * 0.005
		if health <= 0:
			drop_items()
			aud_p.stream = death_sound
			aud_p.play()
			await aud_p.finished
			queue_free()
		else:
			if attacker != null:
				var loc = attacker.global_position
				#await recovered
				
		
	pass
func _physics_process(delta: float) -> void:
	anima_lock = max(anima_lock - delta, 0.0)
	damg_lock = max(damg_lock - delta, 0.0)
	if int(AI_STATES) >= 1 and int(AI_STATES) <= 8:
		var raydir = state_directs[int(AI_STATES)]
		rcM.target_position = raydir * vision_dist
		rcL.target_position = raydir.rotated(deg_to_rad(-45)).normalized() * vision_dist
		rcR.target_position = raydir.rotated(deg_to_rad(+45)).normalized() * vision_dist
	if anima_lock == 0.0:
		if AI_STATES == STATES.DAMAGED:
			$AnimatedSprite2D.material = null
			AI_STATES = STATES.IDLE
			recover.emit()
		for player in get_tree().get_nodes_in_group("Player"):
			if $att_box.overlaps_body(player):
				if player.dam_lock == 0.0:
					var inert = abs(player.global_position-self.global_position)
					player.inertia = (inert.normalized() * Vector2(1,1) * kbk)
					player.take_damage(STATES.DAMAGED)
				else:
					continue
			if player.data.state != player.STATES.DEAD:
				if (rcM.is_colliding() and rcM.get_collider() == player) or \
			(rcL.is_colliding() and rcL.get_collider() == player) or \
			(rcR.is_colliding() and rcR.get_collider() == player):
					turn_to_player(player.global_position)
		pass
		ai_timer = clamp(ai_timer, 0.0, ai_time_max)
		if ai_timer == 0.0:
			if AI_STATES == STATES.IDLE:
				var rnd_move = randi() % 4
				AI_STATES = STATES.values()[rnd_move+1]
			else:
				AI_STATES = STATES.IDLE
			ai_timer = ai_time_max
		var directon = state_directs[int(AI_STATES)]
		velocity = directon * speed
		var anim = state_anim[int(AI_STATES)]
		if anim and not anim_player.is_playing():
			anim_player.play(anim)
		if AI_STATES == STATES.IDLE and anim_player.is_playing():
			anim_player.stop()
		velocity += inertia
		move_and_slide()
		inertia = inertia.move_toward(Vector2(), delta * 1000.0)
		 
		
	pass
