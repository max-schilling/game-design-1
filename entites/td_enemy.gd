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
