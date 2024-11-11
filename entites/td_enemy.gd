extends CharacterBody2D

const speed = 60.0
var max_h = 30.0
var health = max_h
var dam = 10.0
var AI_STATES = STATES.IDLE

enum STATES { IDLE=0, UP, DOWN, LEFT, RIGHT, UP_L, UP_R, DOWN_L, DOWN_R}
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

func turn_to_player(location: Vector2):
	# TODO
	pass
func take_damage(dmg, attacker=null):
	# TODO
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
		# RECOVER
		# DAMAGE
		
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
